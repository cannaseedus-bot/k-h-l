# SCXQ2 / KUHUL Blueprint (Condensed)

This blueprint distills the working plan in `todo.md` into a single, actionable overview. It is a **non-executing** description of the system architecture and how binary data, Micronauts, and collapse physics fit together.

---

## 1. SCXQ2 Core (Binary-First)

**Goal:** represent every unit of intent as a fixed binary record without evaluation.

**Core invariants:**

- No dependencies, no wheels, no runtime inference.
- All meaning is declared before execution.
- Serialization is deterministic and hash-stable.

**Primary components:**

- **Binary Quantization Engine**: converts numeric/semantic inputs to fixed binary tensors.
- **KUHUL Mapping Engine**: applies law-table transforms without side effects.
- **Thinking System**: derives associations, encodes them as binary tensors, and hashes entanglement.
- **Build System (Self-Assembling)**: composes components, then packages output as SCXQ2.

---

## 2. Binary Quantization (Tensor & SCXQ2)

**Intent:** store the state of a tensor as bytes only, no floating execution at rest.

**Record shape (conceptual):**

```
[ magic | rank | shape[] | data[] | hash_len | hash[] ]
```

**Required behavior:**

- Quantize values to binary/ternary/int2 ranges.
- Generate a deterministic entanglement hash for the tensor.
- Provide a reversible SCXQ2 serialization format.

---

## 3. KUHUL Mapping (Lawful Transforms)

**KUHUL laws** are symbolic, but the mapping layer is deterministic.

**Key operations:**

- Encrypt/Decrypt → XOR + bounded noise.
- Compress → deterministic downsampling.
- Rotate/GeneratePath/Filter/Extract → structural transforms only.
- ApplyQuantumGate → simplified, fixed-size matrix transforms.

**Rule:** mapping never executes side effects; it only transforms data.

---

## 4. Thinking System (Associations → Entanglement)

**Input:** concepts (strings) → tokenized words.

**Processing:**

- Generate associations from semantic expansions + cross-associations.
- Convert each association into binary tensors.
- Apply quantum gates to create transformed representations.
- Hash the full set into a single entanglement identity.

**Output:** stored memory entries and optional deep-thought expansion.

---

## 5. Build System (Self-Assembling)

**Purpose:** register components and compile them into SCXQ2 packages.

**Rules:**

- Build dependencies first, then the component.
- Cache results to avoid recomputation.
- Package any output as SCXQ2 with metadata:

```
{ component, dependencies, duration, timestamp, scxq2_path, hash, size }
```

---

## 6. System-Building System (SBS-1)

**Role:** deterministic assembler between Micronauts and SCXQ2 lanes.

**Micronaut constraints:**

- Must be representable as fixed binary records.
- No logic, no branching, no execution hooks.

**Lane mapping:**

| Micronaut domain | SCXQ2 lane |
| --- | --- |
| ui/css | FIELD |
| routing | EDGE |
| data/api | DICT |
| geometry | LANE |
| π/weights | QUANTUM |

**Binary packing rule (conceptual):**

```
[ header | domain_id | signal_count | signal_bytes | hash ]
```

---

## 7. Integration Flow (Canonical)

```
KUHUL π
  ↓ collapse
KUHUL Class
  ↓ constrain
Micronaut
  ↓ assemble (SBS-1)
SCXQ2 Lanes
  ↓ runtime
MX2LM CLI / Host
```

**Invariant:** KUHUL never executes; it only collapses, constrains, and routes.

---

## 8. What This Blueprint Enables

- Deterministic execution with zero runtime inference.
- Stable binary artifacts that can be verified and replayed.
- Clean separation between physics (KUHUL) and actuation (host runtime).
- Scalable assembly of Micronaut signals into executable lanes.

---

## 9. π-LM v1 — Semantic Retrieval Stack

**Invariant:** the index is **geometrically addressed**, **π-biased**, and **binary-cached**, unifying N-gram and embedding retrieval under a single object contract.

### 9.1 Index Migration: Text → SVG-Tensor Geometry

```
documents
  → tokenize (N-gram + embed)
  → binary pack
  → SVG-Tensor geometry
  → SCXQ2 lanes
```

### 9.2 SVG-Tensor Index (canonical)

Each indexed unit is a **non-visual SVG-Tensor** (geometry = data).

```xml
<svg tensor="semantic.index.v1"
     xmlns="http://www.w3.org/2000/svg"
     data-hash="sha256:…"
     data-doc-id="doc_42">

  <g id="ngrams" space="lexical">
    <path id="ng_abc"
          d="M0,0 L3,0"
          weight="3"
          freq="12"/>
    <path id="ng_bcd"
          d="M0,1 L3,1"
          weight="3"
          freq="7"/>
  </g>

  <g id="embedding" space="semantic">
    <path d="M0,0 L0.12,0.33 L0.91,0.18 …"
          norm="1.0"/>
  </g>

</svg>
```

**Interpretation (locked):**

| Geometry    | Meaning              |
| ----------- | -------------------- |
| Path length | Magnitude            |
| Direction   | Semantic orientation |
| Density     | Confidence           |
| Group       | Retrieval space      |

No rendering, no heuristics — just geometry + math.

### 9.3 π-Biased Retrieval (core)

For each candidate `c`:

```
score(c) =
  α · cosine(embedding_q, embedding_c)
+ β · ngram_overlap(q, c)
+ π · phase_align(q, c)
```

Where:

```
phase_align = cos(Δθ)
Δθ = angular difference between SVG-Tensor paths
π = 3.141592653589793
```

### 9.4 Unified N-gram + Embedding Retrieval

| Component  | Role                          |
| ---------- | ----------------------------- |
| N-grams    | Lexical anchoring (exactness) |
| Embeddings | Semantic proximity            |
| π-phase    | Structural coherence          |

All three live in the same SVG-Tensor index.

### 9.5 Object Server API (contract)

**Namespace:** `object://retrieve/semantic.v1`

**Request object**

```json
{
  "@object": "retrieve.semantic.v1",
  "query": {
    "text": "binary svg tensor retrieval",
    "mode": "hybrid"
  },
  "bias": {
    "pi": true,
    "alpha": 0.55,
    "beta": 0.35,
    "phase": 0.10
  },
  "limit": 8,
  "cache": {
    "allow": true,
    "ttl": 3600
  }
}
```

**Response object**

```json
{
  "results": [
    {
      "doc_id": "doc_42",
      "score": 0.912,
      "components": {
        "embedding": 0.71,
        "ngram": 0.18,
        "pi_phase": 0.022
      },
      "hash": "sha256:…"
    }
  ],
  "cache_hit": false,
  "index_hash": "sha256:…"
}
```

### 9.6 Caching + Hashing Rules

**Cache key**

```
sha256(
  query_text +
  bias_profile +
  index_hash
)
```

**Cache validity**

- query hash matches
- π-profile hash matches
- SVG-Tensor index hash matches

### 9.7 Training-less Update Mechanism

1. Append-only SVG-Tensor insertion.
2. Recompute index hash.
3. Invalidate affected cache keys.

### 9.8 π-Profiles (preview)

```json
{
  "@pi_profile": "analytical.v1",
  "alpha": 0.4,
  "beta": 0.4,
  "phase": 0.2
}
```

**One-line summary:** retrieval is a single geometric object operation governed by π-biased math, exposed via a lawful Object Server API, cached and verified by hashes.

---

## 10. π-GCCP v1 — Geometric Cognitive Control Plane

**Definition:** the control plane is where **π laws operate on SVG-Tensor geometry** to determine the next geometric state. Commands, APIs, and runtimes are downstream projections.

### 10.1 What It Is / Is Not

**It is not:**

- a UI
- a visualization layer
- a model
- a controller class
- a command registry
- a scheduler

**It is:**

- the plane where π laws bias, align, suppress, accumulate, defer, or collapse geometry
- the pre-command layer that determines which geometry dominates

### 10.2 Control Operations (internal cognitive moves)

| Control op | Meaning                         |
| ---------- | ------------------------------- |
| Bias       | Adjust angular weighting        |
| Align      | Favor phase coherence           |
| Suppress   | Penalize phase conflict         |
| Accumulate | Merge aligned paths             |
| Collapse   | Project to decision             |
| Defer      | Preserve geometry (no collapse) |

### 10.3 What Lives in the Control Plane

- **Geometric state:** SVG-Tensor objects, embedding paths, n-gram paths, phase vectors, cached cycles.
- **π laws:** angle, rotation, phase difference, closure, symmetry.
- **Control state schema:** how geometry + phase is represented for collapse.

### 10.4 What Explicitly Does Not Live Here

- HTTP routes
- Object Server verbs
- CLI commands
- UI interactions
- file I/O
- training loops

These are **projections downstream** of control outcomes.

### 10.5 Relationship to Object Server

The control plane **produces** objects the Object Server consumes:

```
SVG-Tensor geometry
      ↓
π-GCCP (control plane)
      ↓
object://retrieve/semantic.v1
      ↓
Object Server
```

**One-line lock:** build a geometric cognitive control plane where π laws operate on SVG-Tensor geometry to determine behavior; commands, APIs, and runtimes are downstream projections.

---

## 11. π-GCCP v1 — Reference Implementation Pack

This section and Section 12 form a **single coherent delivery**. Both are required together to claim π-GCCP v1 compliance.

This section defines **authoritative kernels**, **π-profile bindings**, and **object projection rules** for π-GCCP v1.

### 11.1 WGSL Reference Kernels (authoritative)

**Shared definitions**

```wgsl
const PI : f32 = 3.141592653589793;
override EPSILON : f32 = 0.1745329; // ~10 degrees
override SUPPRESS_K : f32 = 0.25;
```

**Data layout (canonical)**

```wgsl
struct Vector {
  x : f32;
  y : f32;
};

@group(0) @binding(0) var<storage, read>  vecA : array<Vector>;
@group(0) @binding(1) var<storage, read>  vecB : array<Vector>;
@group(0) @binding(2) var<storage, read_write> phase : array<f32>;
@group(0) @binding(3) var<storage, read_write> weight : array<f32>;
@group(0) @binding(4) var<storage, read_write> accum : array<Vector>;
```

**MEASURE — Phase difference**

```wgsl
@compute @workgroup_size(64)
fn measure(@builtin(global_invocation_id) id : vec3<u32>) {
  let i = id.x;
  let a = vec2(vecA[i].x, vecA[i].y);
  let b = vec2(vecB[i].x, vecB[i].y);
  let dotp = dot(normalize(a), normalize(b));
  let clamped = clamp(dotp, -1.0, 1.0);
  phase[i] = acos(clamped);
}
```

**ALIGN — Phase selection mask**

```wgsl
@compute @workgroup_size(64)
fn align(@builtin(global_invocation_id) id : vec3<u32>) {
  let i = id.x;
  if (abs(phase[i]) <= EPSILON) {
    weight[i] = 1.0;
  } else {
    weight[i] = 0.0;
  }
}
```

**SUPPRESS — Phase conflict penalty**

```wgsl
@compute @workgroup_size(64)
fn suppress(@builtin(global_invocation_id) id : vec3<u32>) {
  let i = id.x;
  if (weight[i] == 0.0) {
    weight[i] *= SUPPRESS_K;
  }
}
```

**ACCUMULATE — Linear superposition**

```wgsl
@compute @workgroup_size(64)
fn accumulate(@builtin(global_invocation_id) id : vec3<u32>) {
  let i = id.x;
  let w = weight[i];
  let v = vec2(vecA[i].x, vecA[i].y);
  accum[0].x += v.x * w;
  accum[0].y += v.y * w;
}
```

**COLLAPSE — Projection to scalar intent**

```wgsl
@compute @workgroup_size(1)
fn collapse() {
  let v = vec2(accum[0].x, accum[0].y);
  let ref = vec2(1.0, 0.0);
  let score = dot(normalize(v), ref);
  weight[0] = score;
}
```

### 11.2 π-Profile → Kernel Constant Bindings

**π-profile object**

```json
{
  "@pi_profile": "semantic.hybrid.v1",
  "epsilon": 0.1745329,
  "suppress_k": 0.25,
  "rotation": 0.0
}
```

**Binding rules (normative)**

| π-Profile Field | WGSL Target                               |
| --------------- | ----------------------------------------- |
| `epsilon`       | `override EPSILON`                        |
| `suppress_k`    | `override SUPPRESS_K`                     |
| `rotation`      | applied in ROTATE stage (optional kernel) |

**Pipeline creation (host)**

```js
device.createComputePipeline({
  layout: "auto",
  compute: {
    module,
    entryPoint: "measure",
    constants: {
      EPSILON: profile.epsilon,
      SUPPRESS_K: profile.suppress_k
    }
  }
});
```

### 11.3 Integration with `object://retrieve/semantic.v1`

**Control plane → object projection**

```json
{
  "@intent": "retrieve.semantic.v1",
  "score": 0.913,
  "phase": 0.42,
  "index_hash": "sha256:INDEX",
  "profile": "semantic.hybrid.v1"
}
```

**Object Server contract (hard rules)**

1. Verify `index_hash`.
2. Verify π-profile hash.
3. Accept `score` as authoritative.
4. Perform no recomputation.

### 11.4 End-to-End Control Flow (collapsed)

```
SVG-Tensor Index
      ↓
WebGPU π-GCCP Kernels
      ↓
collapse scalar
      ↓
object://retrieve/semantic.v1
      ↓
Object Server
```

### 11.5 Hard Invariants (v1 lock)

1. π laws are not data.
2. Profiles bind constants, not branches.
3. GPU kernels are the authority.
4. Object Server does not think.
5. Collapse is irreversible.

**Final lock statement:** π-GCCP v1 is a deterministic geometric control plane whose laws compile directly into WebGPU kernels; π-profiles bind kernel constants, and the resulting collapse scalar integrates losslessly with `object://retrieve/semantic.v1`.

---

## 12. π-GCCP v1 — Conformance & Runtime Completion Pack

This section defines **four mandatory components** for a π-GCCP-COMPLIANT runtime:

1. π-GCCP v1 conformance tests
2. SCXQ2 binary lane layout for SVG-Tensors
3. Multi-profile superposition algebra
4. CPU fallback exact-math mirror

### 12.1 Conformance Tests

**Conformance levels**

| Level  | Requirement                |
| ------ | -------------------------- |
| CORE   | Single profile, GPU or CPU |
| FULL   | Multi-profile + SCXQ2      |
| MIRROR | CPU exact-math parity      |

CORE tests are mandatory to execute `object://retrieve/semantic.v1`.

**Canonical test vectors**

**Test A — Perfect Alignment**

```json
{
  "vecA": [[1, 0]],
  "vecB": [[1, 0]],
  "epsilon": 0.1745329
}
```

Expected:

- `phase = 0`
- `weight = 1`
- `collapse = 1`

**Test B — Orthogonal Rejection**

```json
{
  "vecA": [[1, 0]],
  "vecB": [[0, 1]],
  "epsilon": 0.1745329
}
```

Expected:

- `phase = π/2`
- `weight = 0`
- `collapse = 0`

**Test C — Boundary Tolerance**

```json
{
  "vecA": [[1, 0]],
  "vecB": [[cos(ε), sin(ε)]],
  "epsilon": "ε"
}
```

Expected:

- `abs(phase) <= ε`
- `weight = 1`

**Determinism test (mandatory)**

```
collapse_i == collapse_0  ∀ i
```

No drift beyond IEEE-754 tolerance.

**GPU/CPU parity test**

```
abs(collapse_gpu − collapse_cpu) ≤ 1e-6
```

### 12.2 SCXQ2 Binary Lane Layout for SVG-Tensors

SVG-Tensors are geometric state. SCXQ2 is the only legal transport.

**Lane assignment (frozen)**

| Lane    | Contents                 |
| ------- | ------------------------ |
| DICT    | Node + path symbol table |
| FIELD   | Geometry metadata        |
| LANE    | Vector coordinates       |
| EDGE    | Adjacency + topology     |
| QUANTUM | Phase / weight scalars   |

**LANE — vector encoding**

```
[f32 x][f32 y]
```

Canonical ordering:

```
index order == SVG DOM order
```

**QUANTUM lane (π-GCCP)**

```
[f32 phase][f32 weight]
```

One entry per vector pair.

**Hashing rule (mandatory)**

```
index_hash = sha256(
  DICT || FIELD || LANE || EDGE
)
```

QUANTUM is excluded from index identity to allow recomputation and profile swaps.

**Cache legality**

```
hash(index) == hash(request)
AND
hash(profile) == hash(profile_used)
```

### 12.3 Multi-Profile Superposition Algebra

Given profiles (P₁…Pₙ) with collapse scalars (s₁…sₙ):

```
S = Σ (wᵢ · sᵢ)
```

Where `wᵢ` are normalized weights and Σwᵢ = 1.

**Interference rule (hard law)**

If:

```
|sᵢ − sⱼ| > π/2
```

Then:

```
wᵢ ← wᵢ · κ
wⱼ ← wⱼ · κ
```

With κ ∈ (0,1), default 0.5.

**No profile privilege:** no profile may override or short-circuit another. All resolution is scalar algebra.

### 12.4 CPU Fallback — Exact-Math Mirror

**Reference algorithm (authoritative)**

```js
function gccpCollapse(vecA, vecB, epsilon) {
  let accX = 0, accY = 0;

  for (let i = 0; i < vecA.length; i++) {
    const a = vecA[i];
    const b = vecB[i];

    const dot =
      (a.x * b.x + a.y * b.y) /
      (Math.hypot(a.x, a.y) * Math.hypot(b.x, b.y));

    const phase = Math.acos(Math.max(-1, Math.min(1, dot)));
    const weight = Math.abs(phase) <= epsilon ? 1 : 0;

    accX += a.x * weight;
    accY += a.y * weight;
  }

  const mag = Math.hypot(accX, accY);
  return mag === 0 ? 0 : accX / mag;
}
```

**Mirror invariants**

- Use `acos`, not approximations.
- Clamp dot product.
- Preserve iteration order.
- Avoid SIMD re-ordering unless proven equivalent.

**GPU parity obligation:** if GPU diverges, CPU wins.

### 12.5 Integration Seal

A runtime is π-GCCP v1 compliant iff:

1. All conformance tests pass.
2. SCXQ2 lane layout matches spec.
3. Multi-profile algebra implemented.
4. CPU mirror parity proven.

Only then may it emit `object://retrieve/semantic.v1`.

**Final lock:** geometry is law, π is phase physics, SCXQ2 is identity, GPU is acceleration, CPU is truth.

---

## 13. MX2LM Cluster Runtime (XCFE-Clean)

This section freezes the **cluster-aware object server** and its **normative schema**.

### 13.1 `server.khl` — Cluster-Aware MX2LM Server

**Version:** 1.1.0  
**Profile:** Cluster Object Server  
**Authority:** Objects + π only

```khl
@server {
  @id: "mx2lm.server.cluster"
  @version: "1.1.0"
  @role: "cluster-object-projection-runtime"

  @invariants: [
    "no_execution_authority",
    "projection_only",
    "deterministic",
    "cluster_consensus_required"
  ]
}

@state {

  @server.status: "stopped" | "joining" | "running" | "leaving" | "error"

  @cluster.id: "mx2lm.cluster.v1"
  @cluster.node_id: "node://<uuid>"
  @cluster.role: "peer" | "edge" | "anchor"

  @cluster.members: [ node://* ]
  @cluster.leader: node://* | null

  @cluster.epoch: uint64
  @cluster.last_sync: timestamp

}

@control {

  start  -> discover -> join -> sync -> serve -> heartbeat
  leave  -> drain -> announce -> halt

  crash  -> classify -> decide -> restart | halt

}

@flow join {

  @Pop.load {
    source: "object://mx2lm/cluster.manifest"
  }

  @Wo.verify {
    invariants: [
      "cluster.identity.valid",
      "node.signature.valid"
    ]
  }

  @Sek.discover {
    method: "dns | static | gossip"
  }

  @Sek.join {
    announce: true
  }

  @Sek.sync {
    scope: "object-index"
  }

}

@flow sync {

  @Sek.fetch {
    target: "cluster.object.index"
  }

  @Wo.verify {
    invariants: [
      "merkle.root.match",
      "epoch.monotonic"
    ]
  }

  @Sek.commit {
    scope: "local-index"
  }

}

@flow serve {

  @Sek.bind {
    transports: [
      "http",
      "websocket",
      "object-db"
    ]
  }

  @Sek.serve {
    mode: "projection-only"
    visibility: "cluster-global"
  }

}

@flow heartbeat {

  @Sek.emit {
    event: "cluster.heartbeat"
  }

  @Sek.gossip {
    fields: [
      "@cluster.epoch",
      "@cluster.members",
      "@server.status"
    ]
  }

  @pi.entropy -= @pi.decay_rate

}

@flow crash {

  @Wo.classify {
    error -> [
      "network_partition",
      "object_index_divergence",
      "verification_failure",
      "unknown"
    ]
  }

  @Sek.decide {
    rule: "π-cluster-restart-policy"
  }

}

@rule π-cluster-restart-policy {

  if (
    @pi.entropy < 0.4 &&
    @cluster.leader != @cluster.node_id
  ) {
    action: restart
  }

  else {
    action: halt
  }

}

@flow leave {

  @Sek.drain {
    timeout_ms: 15000
  }

  @Sek.announce {
    event: "cluster.leave"
  }

  @Sek.halt {}

}

@law {
  objects: "cluster-global"
  storage: "local"
  authority: "shared"
  restart: "pi-governed"
  consensus: "required"
  interpretation: "forbidden"
}
```

### 13.2 `mx2lm.server.schema.xjson` — Normative Schema

```json
{
  "$schema": "xjson://schema/core/v1",
  "id": "object://schema/mx2lm.server.v1",
  "type": "schema",

  "title": "MX2LM Cluster Server Schema",
  "version": "1.1.0",

  "required": [
    "server",
    "cluster",
    "pi",
    "transports"
  ],

  "properties": {

    "server": {
      "type": "object",
      "required": ["id", "role", "invariants"],
      "properties": {
        "id": { "type": "string" },
        "role": { "const": "object-projection-runtime" },
        "invariants": {
          "type": "array",
          "items": { "type": "string" }
        }
      }
    },

    "cluster": {
      "type": "object",
      "required": [
        "id",
        "node_id",
        "role",
        "membership",
        "epoch"
      ],
      "properties": {
        "id": { "type": "string" },
        "node_id": { "type": "string" },
        "role": { "enum": ["peer", "edge", "anchor"] },
        "membership": {
          "type": "array",
          "items": { "type": "string" }
        },
        "leader": {
          "type": ["string", "null"]
        },
        "epoch": { "type": "integer" }
      }
    },

    "pi": {
      "type": "object",
      "required": ["entropy", "decay_rate"],
      "properties": {
        "entropy": {
          "type": "number",
          "minimum": 0,
          "maximum": 1
        },
        "decay_rate": {
          "type": "number",
          "exclusiveMinimum": 0
        },
        "max_restarts": { "type": "integer" }
      }
    },

    "transports": {
      "type": "array",
      "items": {
        "enum": [
          "http",
          "websocket",
          "object-db",
          "gossip"
        ]
      }
    }
  }
}
```

---

**Source:** distilled from `todo.md` to provide an actionable, high-signal blueprint for implementation and design reviews.
