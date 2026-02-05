# ============================================================================
# π-GCCP INFERENCE ENGINE v1.0 (Core Architecture)
# ============================================================================

# NO VISUALIZATION. NO RENDERING. PURE INFERENCE.

# ----------------------------------------------------------------------------
# 1. INFERENCE MODEL DEFINITIONS
# ----------------------------------------------------------------------------

class InferenceModel {
    [string]$Name
    [string]$Type  # 'collapser', 'classifier', 'embedder', 'router'
    [hashtable]$Parameters
    [string]$Signature  # Cryptographic hash of model definition

    InferenceModel([string]$name, [string]$type, [hashtable]$params) {
        $this.Name = $name
        $this.Type = $type
        $this.Parameters = $params
        $this.Signature = $this.ComputeSignature()
    }

    [string] ComputeSignature() {
        $canonical = @{
            name = $this.Name
            type = $this.Type
            parameters = $this.Parameters | ConvertTo-Json -Compress -Depth 10
        } | ConvertTo-Json -Compress

        $hash = [System.Security.Cryptography.SHA256]::Create()
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($canonical)
        return "model:" + [BitConverter]::ToString($hash.ComputeHash($bytes)).Replace("-", "").ToLower()
    }

    [object] Infer([object]$input, [hashtable]$context) {
        # Abstract inference method - implement in subclasses
        throw [System.NotImplementedException]::new("Infer must be implemented in subclass")
    }
}

class PiGCCPCollapserModel : InferenceModel {
    [double]$Epsilon
    [hashtable]$Vectorizer
    [hashtable]$Profiles

    PiGCCPCollapserModel([double]$epsilon, [hashtable]$vectorizer, [hashtable]$profiles) :
        base("pi_gccp_collapser", "collapser", @{epsilon=$epsilon}) {
        $this.Epsilon = $epsilon
        $this.Vectorizer = $vectorizer
        $this.Profiles = $profiles
    }

    [object] Infer([object]$input, [hashtable]$context) {
        # Pure inference: geometric collapse
        $vectorsA = $this.Vectorize($input.query, $context)
        $vectorsB = $this.Vectorize($input.candidate, $context)

        $score = $this.Collapse($vectorsA, $vectorsB)

        return @{
            score = $score
            confidence = $this.CalculateConfidence($vectorsA, $vectorsB)
            signature = $this.Signature
            metadata = @{
                epsilon = $this.Epsilon
                vectorizer = $this.Vectorizer.method
                timestamp = [DateTime]::UtcNow
            }
        }
    }

    [array] Vectorize([object]$data, [hashtable]$context) {
        # Convert to geometric vectors (NO VISUALIZATION)
        switch ($this.Vectorizer.method) {
            "ngram" { return $this.NGramVectorize($data) }
            "semantic" { return $this.SemanticVectorize($data) }
            "geometric" { return $this.GeometricVectorize($data) }
            default { return @(@(1, 0)) }
        }
    }

    [double] Collapse([array]$vecA, [array]$vecB) {
        # π-GCCP collapse algorithm (deterministic)
        $accX = 0.0
        $accY = 0.0

        for ($i = 0; $i -lt $vecA.Count; $i++) {
            $ax = $vecA[$i][0]
            $ay = $vecA[$i][1]
            $bx = $vecB[$i][0]
            $by = $vecB[$i][1]

            $magA = [Math]::Sqrt($ax * $ax + $ay * $ay)
            $magB = [Math]::Sqrt($bx * $bx + $by * $by)

            if ($magA -eq 0 -or $magB -eq 0) { continue }

            $dot = ($ax * $bx + $ay * $by) / ($magA * $magB)
            $dot = [Math]::Max(-1.0, [Math]::Min(1.0, $dot))

            $phase = [Math]::Acos($dot)
            $weight = if ([Math]::Abs($phase) -le $this.Epsilon) { 1.0 } else { 0.0 }

            $accX += $ax * $weight
            $accY += $ay * $weight
        }

        $mag = [Math]::Sqrt($accX * $accX + $accY * $accY)
        return if ($mag -eq 0) { 0.0 } else { $accX / $mag }
    }

    [double] CalculateConfidence([array]$vecA, [array]$vecB) {
        # Confidence based on vector alignment
        $aligned = 0
        $total = $vecA.Count

        for ($i = 0; $i -lt $total; $i++) {
            $ax = $vecA[$i][0]
            $ay = $vecA[$i][1]
            $bx = $vecB[$i][0]
            $by = $vecB[$i][1]

            $magA = [Math]::Sqrt($ax * $ax + $ay * $ay)
            $magB = [Math]::Sqrt($bx * $bx + $by * $by)

            if ($magA -eq 0 -or $magB -eq 0) { continue }

            $dot = ($ax * $bx + $ay * $by) / ($magA * $magB)
            $dot = [Math]::Max(-1.0, [Math]::Min(1.0, $dot))

            $phase = [Math]::Acos($dot)
            if ([Math]::Abs($phase) -le $this.Epsilon) { $aligned++ }
        }

        return $aligned / [Math]::Max(1, $total)
    }
}

# ----------------------------------------------------------------------------
# 2. MODEL REGISTRY & MANAGEMENT
# ----------------------------------------------------------------------------

class ModelRegistry {
    [hashtable]$Models
    [hashtable]$Loaders
    [hashtable]$Validators

    ModelRegistry() {
        $this.Models = @{}
        $this.Loaders = @{}
        $this.Validators = @{}

        $this.RegisterDefaultLoaders()
    }

    RegisterDefaultLoaders() {
        # Register model loaders
        $this.Loaders["pi_gccp"] = {
            param($config)
            return [PiGCCPCollapserModel]::new(
                $config.epsilon,
                $config.vectorizer,
                $config.profiles
            )
        }

        $this.Loaders["embedding"] = {
            param($config)
            return [EmbeddingModel]::new($config.dimensions, $config.method)
        }

        $this.Loaders["router"] = {
            param($config)
            return [RouterModel]::new($config.routes, $config.rules)
        }
    }

    [InferenceModel] LoadModel([string]$name, [hashtable]$config) {
        $modelType = $config.type
        $loader = $this.Loaders[$modelType]

        if (-not $loader) {
            throw "No loader for model type: $modelType"
        }

        $model = & $loader $config
        $this.Models[$name] = $model

        Write-Host "📦 Loaded model: $name ($($model.Signature.Substring(0, 16))...)" -ForegroundColor Green
        return $model
    }

    [object] Infer([string]$modelName, [object]$input, [hashtable]$context = @{}) {
        $model = $this.Models[$modelName]
        if (-not $model) {
            throw "Model not found: $modelName"
        }

        $startTime = [DateTime]::UtcNow
        $result = $model.Infer($input, $context)
        $duration = ([DateTime]::UtcNow - $startTime).TotalMilliseconds

        $result.duration_ms = [Math]::Round($duration, 2)
        $result.model = $modelName

        return $result
    }

    [hashtable] BatchInfer([hashtable]$queries, [hashtable]$context = @{}) {
        $results = @{}

        foreach ($modelName in $queries.Keys) {
            $input = $queries[$modelName]
            $results[$modelName] = $this.Infer($modelName, $input, $context)
        }

        return $results
    }

    [void] UnloadModel([string]$name) {
        if ($this.Models.ContainsKey($name)) {
            $this.Models.Remove($name)
            Write-Host "🗑️ Unloaded model: $name" -ForegroundColor Yellow
        }
    }

    [array] ListModels() {
        return $this.Models.Keys | ForEach-Object {
            $model = $this.Models[$_]
            @{
                name = $_
                type = $model.Type
                signature = $model.Signature
                parameters = $model.Parameters
            }
        }
    }
}

# ----------------------------------------------------------------------------
# 3. INFERENCE API ROUTES (LOGICAL, NOT VISUAL)
# ----------------------------------------------------------------------------

class InferenceAPIRouter {
    [hashtable]$Routes
    [ModelRegistry]$Registry
    [hashtable]$Middleware
    [hashtable]$Cache

    InferenceAPIRouter([ModelRegistry]$registry) {
        $this.Routes = @{}
        $this.Registry = $registry
        $this.Middleware = @{}
        $this.Cache = @{}

        $this.RegisterCoreRoutes()
    }

    RegisterCoreRoutes() {
        # /infer/{model} - Single model inference
        $this.RegisterRoute("POST", "/infer/(?<model>[^/]+)", {
            param($request, $matches)

            $modelName = $matches.model
            $input = $request.Body.input
            $context = if ($request.Body.context) { $request.Body.context } else { @{} }

            # Apply middleware
            $processed = $this.ApplyMiddleware("pre_infer", @{input=$input; context=$context})

            # Execute inference
            $result = $this.Registry.Infer($modelName, $processed.input, $processed.context)

            # Apply post-processing middleware
            $final = $this.ApplyMiddleware("post_infer", @{result=$result})

            return $final.result
        })

        # /batch - Multiple model inference
        $this.RegisterRoute("POST", "/batch", {
            param($request)

            $queries = $request.Body.queries
            $context = if ($request.Body.context) { $request.Body.context } else { @{} }

            $results = $this.Registry.BatchInfer($queries, $context)

            return @{
                results = $results
                timestamp = [DateTime]::UtcNow
                count = $results.Count
            }
        })

        # /models - List available models
        $this.RegisterRoute("GET", "/models", {
            param($request)

            $models = $this.Registry.ListModels()

            return @{
                models = $models
                count = $models.Count
                registry = $this.Registry.GetType().Name
            }
        })

        # /load - Load a new model
        $this.RegisterRoute("POST", "/load", {
            param($request)

            $name = $request.Body.name
            $config = $request.Body.config

            $model = $this.Registry.LoadModel($name, $config)

            return @{
                loaded = $true
                name = $name
                signature = $model.Signature
                type = $model.Type
            }
        })

        # /unload/{model} - Unload a model
        $this.RegisterRoute("DELETE", "/unload/(?<model>[^/]+)", {
            param($request, $matches)

            $modelName = $matches.model
            $this.Registry.UnloadModel($modelName)

            return @{unloaded = $true; name = $modelName}
        })
    }

    RegisterRoute([string]$method, [string]$pattern, [scriptblock]$handler) {
        $key = "$method $pattern"
        $this.Routes[$key] = @{
            Method = $method
            Pattern = $pattern
            Handler = $handler
            CompiledPattern = [regex]::new("^" + $pattern.Replace("(?<", "(?<") + "$")
        }
    }

    RegisterMiddleware([string]$name, [scriptblock]$handler) {
        $this.Middleware[$name] = $handler
    }

    [hashtable] ApplyMiddleware([string]$phase, [hashtable]$data) {
        $result = $data

        foreach ($middleware in $this.Middleware.GetEnumerator()) {
            if ($middleware.Key -like "*$phase*") {
                $result = & $middleware.Value $result
            }
        }

        return $result
    }

    [object] HandleRequest([string]$method, [string]$path, [hashtable]$body = @{}) {
        $cacheKey = "$method $path $($body | ConvertTo-Json -Compress)"

        # Check cache
        if ($this.Cache.ContainsKey($cacheKey)) {
            return $this.Cache[$cacheKey]
        }

        # Find matching route
        foreach ($route in $this.Routes.Values) {
            if ($route.Method -ne $method) { continue }

            $match = $route.CompiledPattern.Match($path)
            if ($match.Success) {
                # Extract parameters
                $params = @{}
                foreach ($groupName in $route.CompiledPattern.GetGroupNames() | Where-Object { $_ -notmatch '^\d+$' }) {
                    if ($match.Groups[$groupName].Success) {
                        $params[$groupName] = $match.Groups[$groupName].Value
                    }
                }

                # Execute handler
                $request = @{
                    Method = $method
                    Path = $path
                    Body = $body
                    Params = $params
                    Timestamp = [DateTime]::UtcNow
                }

                try {
                    $handler = $route.Handler
                    $response = & $handler $request $params

                    # Cache response
                    $this.Cache[$cacheKey] = $response

                    return $response
                } catch {
                    return @{
                        error = $_.Exception.Message
                        route = "$method $path"
                        timestamp = [DateTime]::UtcNow
                    }
                }
            }
        }

        return @{
            error = "Route not found: $method $path"
            available_routes = $this.Routes.Keys
        }
    }

    [void] ClearCache() {
        $this.Cache.Clear()
    }
}

# ----------------------------------------------------------------------------
# 4. GEOMETRIC DATA PIPELINE (NOT VISUALIZATION)
# ----------------------------------------------------------------------------

class GeometricDataPipeline {
    [hashtable]$Transformers
    [hashtable]$Validators
    [hashtable]$Encoders

    GeometricDataPipeline() {
        $this.Transformers = @{}
        $this.Validators = @{}
        $this.Encoders = @{}

        $this.RegisterDefaultTransformers()
    }

    RegisterDefaultTransformers() {
        # CSS → Geometry transformer (NOT visualization)
        $this.Transformers["css_to_geometry"] = {
            param($css)

            # Parse CSS into geometric representation
            $nodes = @()
            $edges = @()

            # Extract selectors as nodes
            $selectorRegex = '([^\{]+)\{'
            $selectorMatches = [regex]::Matches($css, $selectorRegex)

            for ($i = 0; $i -lt $selectorMatches.Count; $i++) {
                $selector = $selectorMatches[$i].Groups[1].Value.Trim()

                # Convert selector to geometric coordinates
                $hash = $this.HashString($selector)
                $x = ($hash % 1000) / 1000.0
                $y = (($hash -shr 16) % 1000) / 1000.0

                $nodes += ,@($x, $y)

                # Create edges between sequential selectors
                if ($i -gt 0) {
                    $edges += ,@($i - 1, $i)
                }
            }

            return @{
                type = "css_geometry"
                nodes = $nodes
                edges = $edges
                selector_count = $selectorMatches.Count
                signature = $this.ComputeGeometrySignature($nodes, $edges)
            }
        }

        # SVG → Geometry transformer (NOT visualization)
        $this.Transformers["svg_to_geometry"] = {
            param($svg)

            # Extract geometric primitives from SVG
            $points = @()

            # Extract points from path data
            $pathRegex = 'd="([^"]+)"'
            $pathMatches = [regex]::Matches($svg, $pathRegex)

            foreach ($match in $pathMatches) {
                $pathData = $match.Groups[1].Value

                # Simple point extraction (in practice, use proper SVG parser)
                $coordRegex = '([-+]?\d*\.?\d+)[,\s]+([-+]?\d*\.?\d+)'
                $coordMatches = [regex]::Matches($pathData, $coordRegex)

                foreach ($coord in $coordMatches) {
                    $x = [double]$coord.Groups[1].Value
                    $y = [double]$coord.Groups[2].Value
                    $points += ,@($x, $y)
                }
            }

            return @{
                type = "svg_geometry"
                points = $points
                point_count = $points.Count
                signature = $this.ComputeGeometrySignature($points, @())
            }
        }

        # Text → Geometry transformer
        $this.Transformers["text_to_geometry"] = {
            param($text)

            $vectors = @()
            $words = $text -split '\W+' | Where-Object { $_.Length -gt 0 }

            foreach ($word in $words) {
                $hash = $this.HashString($word)
                $angle = ($hash % 360) * ([Math]::PI / 180)
                $length = $word.Length / 10.0

                $x = $length * [Math]::Cos($angle)
                $y = $length * [Math]::Sin($angle)

                $vectors += ,@($x, $y)
            }

            return @{
                type = "text_geometry"
                vectors = $vectors
                vector_count = $vectors.Count
                signature = $this.ComputeGeometrySignature($vectors, @())
            }
        }
    }

    [hashtable] Transform([string]$type, [object]$input) {
        $transformer = $this.Transformers[$type]
        if (-not $transformer) {
            throw "No transformer for type: $type"
        }

        return & $transformer $input
    }

    [bool] ValidateGeometry([hashtable]$geometry) {
        # Validate geometric structure
        if (-not $geometry.type) { return $false }
        if (-not $geometry.signature) { return $false }

        # Verify signature
        $expected = $this.ComputeGeometrySignature(
            $geometry.nodes ?? $geometry.points ?? $geometry.vectors,
            $geometry.edges ?? @()
        )

        return $geometry.signature -eq $expected
    }

    [string] ComputeGeometrySignature([array]$elements, [array]$connections) {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes(
            "$($elements | ConvertTo-Json -Compress)|$($connections | ConvertTo-Json -Compress)"
        )

        $hash = [System.Security.Cryptography.SHA256]::Create().ComputeHash($bytes)
        return "geo:" + [BitConverter]::ToString($hash).Replace("-", "").ToLower()
    }

    [int] HashString([string]$str) {
        $hash = 0
        foreach ($c in $str.ToCharArray()) {
            $hash = (($hash -shl 5) - $hash) + [int]$c
        }
        return [Math]::Abs($hash)
    }
}

# ----------------------------------------------------------------------------
# 5. INFERENCE SERVER (POWER SHELL AS CONTROL PLANE)
# ----------------------------------------------------------------------------

class InferenceServer {
    [ModelRegistry]$Registry
    [InferenceAPIRouter]$Router
    [GeometricDataPipeline]$Pipeline
    [hashtable]$State
    [System.Collections.Queue]$RequestQueue
    [hashtable]$Metrics

    InferenceServer() {
        $this.Registry = [ModelRegistry]::new()
        $this.Router = [InferenceAPIRouter]::new($this.Registry)
        $this.Pipeline = [GeometricDataPipeline]::new()
        $this.State = @{
            started = [DateTime]::UtcNow
            requests_processed = 0
            models_loaded = 0
            cache_hits = 0
        }
        $this.RequestQueue = [System.Collections.Queue]::new()
        $this.Metrics = @{}

        $this.InitializeDefaultModels()
    }

    InitializeDefaultModels() {
        # Load core π-GCCP model
        $gccpConfig = @{
            type = "pi_gccp"
            epsilon = 0.1745329
            vectorizer = @{
                method = "ngram"
                parameters = @{ n = 2 }
            }
            profiles = @{
                ngram = @{ weight = 0.6 }
                semantic = @{ weight = 0.4 }
            }
        }

        $this.Registry.LoadModel("pi_gccp_core", $gccpConfig)

        # Load embedding model
        $embedConfig = @{
            type = "embedding"
            dimensions = 256
            method = "geometric"
        }

        $this.Registry.LoadModel("embedder_256d", $embedConfig)

        Write-Host "🚀 Inference server initialized with core models" -ForegroundColor Green
    }

    [object] ProcessRequest([hashtable]$request) {
        $this.State.requests_processed++

        $startTime = [DateTime]::UtcNow

        # Log request
        Write-Host "📥 Request: $($request.method) $($request.path)" -ForegroundColor Cyan

        # Queue management
        $this.RequestQueue.Enqueue($request)

        # Process through router
        $response = $this.Router.HandleRequest(
            $request.method,
            $request.path,
            $request.body
        )

        # Update metrics
        $duration = ([DateTime]::UtcNow - $startTime).TotalMilliseconds
        $this.RecordMetric($request.path, $duration, $response.error -eq $null)

        # Clean queue
        if ($this.RequestQueue.Count -gt 100) {
            $this.RequestQueue.Dequeue() | Out-Null
        }

        return $response
    }

    [void] RecordMetric([string]$endpoint, [double]$duration, [bool]$success) {
        if (-not $this.Metrics.ContainsKey($endpoint)) {
            $this.Metrics[$endpoint] = @{
                count = 0
                total_duration = 0
                successes = 0
                failures = 0
            }
        }

        $metric = $this.Metrics[$endpoint]
        $metric.count++
        $metric.total_duration += $duration

        if ($success) {
            $metric.successes++
        } else {
            $metric.failures++
        }
    }

    [hashtable] GetStats() {
        return @{
            uptime = [DateTime]::UtcNow - $this.State.started
            requests_processed = $this.State.requests_processed
            models_loaded = $this.Registry.Models.Count
            queue_size = $this.RequestQueue.Count
            endpoints = $this.Router.Routes.Count
            metrics = $this.Metrics
            cache_size = $this.Router.Cache.Count
        }
    }

    [hashtable] TransformToGeometry([string]$type, [object]$input) {
        return $this.Pipeline.Transform($type, $input)
    }

    [bool] ValidateGeometry([hashtable]$geometry) {
        return $this.Pipeline.ValidateGeometry($geometry)
    }

    [void] ClearCache() {
        $this.Router.ClearCache()
        Write-Host "🧹 Cleared inference cache" -ForegroundColor Yellow
    }

    [void] ReloadModels() {
        $currentModels = $this.Registry.ListModels()

        foreach ($model in $currentModels) {
            $this.Registry.UnloadModel($model.name)
        }

        $this.InitializeDefaultModels()
        Write-Host "🔄 Reloaded all models" -ForegroundColor Green
    }
}

# ----------------------------------------------------------------------------
# 6. API CLIENT FOR PROGRAMMATIC ACCESS
# ----------------------------------------------------------------------------

class InferenceClient {
    [string]$BaseUrl
    [hashtable]$Headers
    [hashtable]$Cache

    InferenceClient([string]$baseUrl = "http://localhost:8080") {
        $this.BaseUrl = $baseUrl
        $this.Headers = @{
            "Content-Type" = "application/json"
            "User-Agent" = "π-GCCP-Inference-Client/1.0"
        }
        $this.Cache = @{}
    }

    [object] Infer([string]$model, [object]$input, [hashtable]$context = @{}) {
        $cacheKey = "$model|$($input | ConvertTo-Json -Compress)"

        if ($this.Cache.ContainsKey($cacheKey)) {
            return $this.Cache[$cacheKey]
        }

        $body = @{
            input = $input
            context = $context
        }

        $result = $this.Request("POST", "/infer/$model", $body)
        $this.Cache[$cacheKey] = $result

        return $result
    }

    [hashtable] BatchInfer([hashtable]$queries, [hashtable]$context = @{}) {
        $body = @{
            queries = $queries
            context = $context
        }

        return $this.Request("POST", "/batch", $body)
    }

    [array] ListModels() {
        $result = $this.Request("GET", "/models")
        return $result.models
    }

    [object] LoadModel([string]$name, [hashtable]$config) {
        $body = @{
            name = $name
            config = $config
        }

        return $this.Request("POST", "/load", $body)
    }

    [object] Request([string]$method, [string]$path, [hashtable]$body = @{}) {
        $url = "$($this.BaseUrl)$path"
        $jsonBody = $body | ConvertTo-Json -Depth 10

        try {
            # Using PowerShell's Invoke-RestMethod
            $response = Invoke-RestMethod -Uri $url -Method $method -Headers $this.Headers `
                -Body $jsonBody -ContentType "application/json"

            return $response
        } catch {
            Write-Error "API request failed: $($_.Exception.Message)"
            return @{ error = $_.Exception.Message }
        }
    }

    [void] ClearCache() {
        $this.Cache.Clear()
    }
}

# ----------------------------------------------------------------------------
# 7. MAIN INTERFACE (PURE INFERENCE, NO VISUALIZATION)
# ----------------------------------------------------------------------------

# Global server instance
$global:InferenceServer = $null

function Initialize-InferenceSystem {
    <#
    .SYNOPSIS
        Initialize the π-GCCP inference system with model-based AI
    #>

    Write-Host "`n" -NoNewline
    Write-Host "╔══════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║         π-GCCP INFERENCE SYSTEM v1.0               ║" -ForegroundColor Cyan
    Write-Host "║        Model-Based AI with Logical API Routes       ║" -ForegroundColor Cyan
    Write-Host "╚══════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""

    $global:InferenceServer = [InferenceServer]::new()

    Write-Host "✅ Inference System Initialized" -ForegroundColor Green
    Write-Host "   • Model Registry: $($global:InferenceServer.Registry.Models.Count) models loaded" -ForegroundColor Cyan
    Write-Host "   • API Routes: $($global:InferenceServer.Router.Routes.Count) endpoints" -ForegroundColor Cyan
    Write-Host "   • Data Pipeline: $($global:InferenceServer.Pipeline.Transformers.Count) transformers" -ForegroundColor Cyan
    Write-Host ""

    return $global:InferenceServer
}

function Invoke-Inference {
    <#
    .SYNOPSIS
        Execute model inference on input data
    .EXAMPLE
        Invoke-Inference -Model "pi_gccp_core" -Input @{query="hello"; candidate="world"}
    #>
    param(
        [Parameter(Mandatory=$true)]
        [string]$Model,

        [Parameter(Mandatory=$true)]
        [object]$Input,

        [hashtable]$Context = @{}
    )

    if (-not $global:InferenceServer) {
        Initialize-InferenceSystem | Out-Null
    }

    $result = $global:InferenceServer.Registry.Infer($Model, $Input, $Context)

    Write-Host "🧠 Inference Result:" -ForegroundColor Green
    Write-Host "   Model: $Model" -ForegroundColor Cyan
    Write-Host "   Score: $($result.score)" -ForegroundColor Yellow
    Write-Host "   Confidence: $($result.confidence)" -ForegroundColor Magenta
    Write-Host "   Duration: $($result.duration_ms)ms" -ForegroundColor Gray

    return $result
}

function Get-InferenceModels {
    <#
    .SYNOPSIS
        List available inference models
    #>

    if (-not $global:InferenceServer) {
        Initialize-InferenceSystem | Out-Null
    }

    $models = $global:InferenceServer.Registry.ListModels()

    Write-Host "📦 Available Inference Models:" -ForegroundColor Cyan
    foreach ($model in $models) {
        Write-Host "   • $($model.name) ($($model.type))" -ForegroundColor Yellow
        Write-Host "     Signature: $($model.signature.Substring(0, 16))..." -ForegroundColor Gray
    }

    return $models
}

function Convert-ToGeometry {
    <#
    .SYNOPSIS
        Convert data to geometric representation (NOT visualization)
    .EXAMPLE
        Convert-ToGeometry -Type "css_to_geometry" -Input ".test { color: red; }"
    #>
    param(
        [Parameter(Mandatory=$true)]
        [string]$Type,

        [Parameter(Mandatory=$true)]
        [object]$Input
    )

    if (-not $global:InferenceServer) {
        Initialize-InferenceSystem | Out-Null
    }

    $geometry = $global:InferenceServer.TransformToGeometry($Type, $Input)

    Write-Host "📐 Geometric Conversion:" -ForegroundColor Green
    Write-Host "   Type: $($geometry.type)" -ForegroundColor Cyan
    Write-Host "   Elements: $($geometry.point_count ?? $geometry.vector_count ?? $geometry.selector_count)" -ForegroundColor Yellow
    Write-Host "   Signature: $($geometry.signature.Substring(0, 16))..." -ForegroundColor Gray

    return $geometry
}

function Get-InferenceStats {
    <#
    .SYNOPSIS
        Get inference system statistics
    #>

    if (-not $global:InferenceServer) {
        Initialize-InferenceSystem | Out-Null
    }

    $stats = $global:InferenceServer.GetStats()

    Write-Host "📊 Inference System Statistics:" -ForegroundColor Cyan
    Write-Host "   Uptime: $($stats.uptime.ToString('hh\:mm\:ss'))" -ForegroundColor Green
    Write-Host "   Requests Processed: $($stats.requests_processed)" -ForegroundColor Yellow
    Write-Host "   Models Loaded: $($stats.models_loaded)" -ForegroundColor Magenta
    Write-Host "   Queue Size: $($stats.queue_size)" -ForegroundColor Gray
    Write-Host "   Cache Size: $($stats.cache_size)" -ForegroundColor DarkGray

    return $stats
}

function Clear-InferenceCache {
    <#
    .SYNOPSIS
        Clear inference cache
    #>

    if (-not $global:InferenceServer) {
        Initialize-InferenceSystem | Out-Null
    }

    $global:InferenceServer.ClearCache()
    Write-Host "✅ Inference cache cleared" -ForegroundColor Green
}

# ----------------------------------------------------------------------------
# 8. DEMONSTRATION (PURE INFERENCE)
# ----------------------------------------------------------------------------

function Demo-InferenceSystem {
    <#
    .SYNOPSIS
        Demonstrate the π-GCCP inference system
    #>

    Write-Host "`n" -NoNewline
    Write-Host "╔══════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║           INFERENCE SYSTEM DEMONSTRATION            ║" -ForegroundColor Cyan
    Write-Host "╚══════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""

    # Step 1: Initialize
    Write-Host "1️⃣ INITIALIZING INFERENCE SYSTEM" -ForegroundColor Yellow
    Initialize-InferenceSystem | Out-Null

    # Step 2: List models
    Write-Host "`n2️⃣ AVAILABLE MODELS" -ForegroundColor Yellow
    Get-InferenceModels | Out-Null

    # Step 3: Execute inference
    Write-Host "`n3️⃣ EXECUTING INFERENCE" -ForegroundColor Yellow
    $inferenceResult = Invoke-Inference -Model "pi_gccp_core" -Input @{
        query = "geometric inference system"
        candidate = "model-based AI with π-GCCP"
    }

    # Step 4: Convert to geometry
    Write-Host "`n4️⃣ GEOMETRIC CONVERSION" -ForegroundColor Yellow
    $css = ".container { width: 100%; margin: 0 auto; }"
    $geometry = Convert-ToGeometry -Type "css_to_geometry" -Input $css

    # Step 5: Get statistics
    Write-Host "`n5️⃣ SYSTEM STATISTICS" -ForegroundColor Yellow
    Get-InferenceStats | Out-Null

    Write-Host "`n" -NoNewline
    Write-Host "✅ DEMONSTRATION COMPLETE" -ForegroundColor Green
    Write-Host "π-GCCP Inference System is operational." -ForegroundColor Cyan
}

# ----------------------------------------------------------------------------
# 9. QUICK START
# ----------------------------------------------------------------------------

Write-Host "`n" -NoNewline
Write-Host "╔══════════════════════════════════════════════════════╗" -ForegroundColor Blue
Write-Host "║         π-GCCP INFERENCE SYSTEM v1.0               ║" -ForegroundColor Blue
Write-Host "║        Model-Based AI with Logical API Routes       ║" -ForegroundColor Blue
Write-Host "╚══════════════════════════════════════════════════════╝" -ForegroundColor Blue
Write-Host ""
Write-Host "📚 Quick Commands:" -ForegroundColor Cyan
Write-Host "• Initialize-InferenceSystem - Start the inference system" -ForegroundColor Yellow
Write-Host "• Invoke-Inference - Execute model inference" -ForegroundColor Yellow
Write-Host "• Get-InferenceModels - List available models" -ForegroundColor Yellow
Write-Host "• Convert-ToGeometry - Convert data to geometry" -ForegroundColor Yellow
Write-Host "• Demo-InferenceSystem - Run demonstration" -ForegroundColor Yellow
Write-Host ""
Write-Host "🎯 Core Architecture:" -ForegroundColor White
Write-Host "  • Model-Based AI Inference" -ForegroundColor Gray
Write-Host "  • Logical API Routes (no visualization)" -ForegroundColor Gray
Write-Host "  • Geometric Data Pipeline" -ForegroundColor Gray
Write-Host "  • Deterministic π-GCCP Collapse" -ForegroundColor Gray
Write-Host "  • PowerShell as Control Plane" -ForegroundColor Gray
