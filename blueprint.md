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

---

## 10. Hybrid Wormhole Control Plane (Tiered Stack)

**Purpose:** a tiered control plane for capability discovery, state sync, live runtime, and cryptographic proof that remains orthogonal to π/geometry semantics.

### 10.1 Four-Layer Stack (canonical)

| Layer | Role | Protocol class | Authority |
| --- | --- | --- | --- |
| 1. Discovery | capability negotiation + service discovery | DNS-SD + DNSSEC + DANE | non-authoritative |
| 2. Sync | resumable state sync + bulk transfer | HTTP/WebDAV + TLS + OAuth2 | authoritative |
| 3. Runtime | live state + RPC | WebSocket (binary) + per-message auth | ephemeral |
| 4. Proof | compression + integrity + verification | SCXQ2 + zk proof envelope | authoritative (async) |

### 10.2 Locked Invariants (Wormhole Laws)

**Law 1 — Layer Orthogonality (LOCKED)**
```
∀ layer_i, layer_j where i ≠ j:
layer_i correctness ⟂ layer_j availability
```
No layer may assume availability, correctness, or continuity of any other layer.

**Law 2 — Capability Before Authority (LOCKED)**
```
authority := f(discovery.capabilities ∩ client.capabilities)
```
Authority is always discovered and negotiated; it is never assumed.

**Law 3 — Runtime Is Ephemeral (LOCKED)**
```
runtime_state ⊆ transient
authoritative_state ∈ sync_layer OR proof_layer
```
Runtime never becomes authoritative.

**Law 4 — Proof Is Asynchronous and Non-Blocking (LOCKED)**
```
verification ∈ background
failure ⇒ invalidate, not halt
```
Proof governs acceptance, not delivery.

### 10.3 Binding to π-LM / Object Server / Adapter v1

**Semantic boundary:** `object://` is the seam between transport and meaning.

```
DNS / HTTP / WS / SCXQ2
        ↓
    object://
        ↓
     π-GCCP
```

**Mapping:**

| Concern | Hybrid wormhole layer | π/Object Server exposure |
| --- | --- | --- |
| Capability discovery | DNS discovery | hidden (non-semantic) |
| State sync | HTTP sync | object:// store |
| Live deltas | WebSocket runtime | geometry deltas |
| Integrity proofs | SCXQ2 proof | verification envelope |

π consumes **geometry only**; transport, auth, compression, and proof are below `object://`.

### 10.4 Adapter v1 Placement (clean fit)

Adapters emit geometry and never encode transport assumptions.

```json
{
  "@type": "pi.signal.v1",
  "geometry": { "...": "..." }
}
```

| Backend | Placement |
| --- | --- |
| GGUF / ONNX | local → runtime WS or HTTP sync |
| WASM / WebGPU | browser → runtime WS |
| Batch jobs | HTTP sync |
| Archives | HTTP + SCXQ2 |

### 10.5 Wormhole Capability Schema v1 (normative)

**Canonical capability object (authoritative, transport-independent)**

```json
{
  "schema": "wormhole.capability.v1",
  "service": {
    "name": "string",
    "domain": "fqdn",
    "instance": "uuid"
  },
  "endpoints": {
    "http": "https://host/path",
    "ws": "wss://host/path",
    "proof": "https://host/proof"
  },
  "protocols": {
    "discovery": ["dns", "https"],
    "sync": ["http", "http+delta"],
    "runtime": ["ws", "ws+binary"],
    "proof": ["scxq2"]
  },
  "compression": ["scxq2", "brotli", "lz4"],
  "auth": ["jwt", "oauth2", "mtls", "anonymous"],
  "capabilities": [
    "object-server",
    "pi-adapter-v1",
    "pi-gccp-v1",
    "svg-tensor-index",
    "crdt"
  ],
  "limits": {
    "max_frame_bytes": 16777216,
    "max_state_bytes": 1073741824,
    "rate_per_sec": 1000
  },
  "hash": "sha256:..."
}
```

**DNS TXT record layout (summary only, authoritative)**

Record name:

```
_asxr._tcp.<domain>
```

TXT payload (key=value, semicolon-delimited):

```
v=1;
http=https://api.example.com/sync;
ws=wss://api.example.com/runtime;
proof=https://api.example.com/proof;
proto=ws,http,scxq2;
compress=scxq2,brotli;
auth=jwt;
caps=object-server,pi-adapter-v1,pi-gccp-v1;
hash=sha256:abcd...
```

Rules:

- TXT record MUST fit DNS limits (summary only).
- `hash` MUST correspond to the HTTPS descriptor.
- DNSSEC REQUIRED for trust.

**HTTPS capability descriptor**

URL:

```
https://<domain>/.well-known/wormhole-capabilities.json
```

Rules:

- JSON MUST match the canonical schema.
- `hash` MUST equal SHA-256 of canonicalized JSON.
- HTTPS cert MUST match DNS name (DANE allowed).

**Capability negotiation rule (LOCKED)**

```
SelectedCapabilities =
  ClientCapabilities ∩ ServerCapabilities
```

No defaults. No assumptions. No silent downgrade.

### 10.6 SCXQ2 Proof Envelope v1 (normative)

**Canonical proof envelope**

```json
{
  "schema": "scxq2.proof.v1",
  "subject": {
    "object": "object://state/path",
    "version": "monotonic-id",
    "byte_length": 12345678
  },
  "compression": {
    "algorithm": "scxq2",
    "dictionary_id": "sha256:...",
    "ratio": 87.4
  },
  "integrity": {
    "root_hash": "sha256:...",
    "chunk_hashes": ["sha256:...", "sha256:..."]
  },
  "proof": {
    "type": "zk-stark",
    "curve": "bls12-381",
    "proof_bytes": "base64..."
  },
  "signatures": {
    "server": "base64...",
    "algorithm": "sphincs+"
  },
  "timestamp": "iso-8601"
}
```

**Verification contract (π / Object Server)**

1. Verify signature.
2. Verify proof against `root_hash`.
3. Decompress payload.
4. Hash decompressed payload.
5. Compare hash == `root_hash`.

If any step fails:

- mark state invalid
- do not halt runtime
- trigger resync

**Proof non-blocking rule (LOCKED)**

```
delivery ≠ acceptance
```

### 10.7 Hybrid Wormhole Conformance Tests v1

**Discovery conformance — DNS → HTTPS parity**

- TXT hash MUST match HTTPS descriptor hash.
- Missing HTTPS descriptor = FAIL.
- Hash mismatch = FAIL.

**Negotiation conformance — capability intersection**

- Server advertises `{A,B,C}`.
- Client advertises `{B,C,D}`.
- Selected MUST be `{B,C}` only.
- Implicit fallback = FAIL.

**Runtime conformance — ephemerality**

- Kill WebSocket.
- Client MUST recover via HTTP sync.
- No data loss allowed.

**Proof conformance — corruption detection**

- Flip one bit in compressed payload.
- Proof verification MUST fail.
- Runtime MUST continue.
- State MUST be invalidated.

**π integration conformance — geometry determinism**

- Same SVG-Tensor + same π-Profile.
- MUST collapse to identical score.
- CPU and GPU paths MUST match within ε.

**SCXQ2 independence**

- Disable SCXQ2.
- System MUST still function (larger payloads).
- Proof layer is optional, never required.

### 10.8 Minimal Reference Client (compliance anchor)

**Responsibilities**

1. Perform DNS discovery.
2. Fetch HTTPS capability descriptor.
3. Negotiate protocol.
4. Sync initial state via HTTP.
5. Establish WebSocket runtime.
6. Receive geometry deltas.
7. Collapse via π-GCCP.
8. Verify SCXQ2 proof asynchronously.

**Minimal control flow**

```
discover()
  ↓
negotiate()
  ↓
http_sync(full)
  ↓
ws_connect()
  ↓
on_delta → π_collapse()
  ↓
on_proof → verify_or_invalidate()
```

**Minimal client pseudocode**

```ts
const caps = await discoverDNS(domain);
const desc = await fetch(descUrl);

const negotiated = intersect(clientCaps, desc.capabilities);

await httpSync(desc.endpoints.http);

const ws = connect(desc.endpoints.ws);

ws.on("delta", d => {
  const geometry = decode(d);
  piCollapse(geometry);
});

ws.on("proof", p => {
  verifySCXQ2(p);
});
```

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

### 12.6 π-GCCP v1 Test Harness (Reference Pack)

This is the authoritative test harness and parity baseline. GPU must conform to this CPU truth.

**Test vector format**

```json
{
  "epsilon": 0.1745329,
  "pairs": [
    {
      "A": [[1, 0]],
      "B": [[1, 0]],
      "expected": 1.0
    },
    {
      "A": [[1, 0]],
      "B": [[0, 1]],
      "expected": 0.0
    }
  ]
}
```

**CPU exact-math reference (authoritative)**

```js
export function gccpCollapse(vecA, vecB, epsilon) {
  let accX = 0;
  let accY = 0;

  for (let i = 0; i < vecA.length; i++) {
    const ax = vecA[i][0];
    const ay = vecA[i][1];
    const bx = vecB[i][0];
    const by = vecB[i][1];

    const magA = Math.hypot(ax, ay);
    const magB = Math.hypot(bx, by);
    if (magA === 0 || magB === 0) continue;

    let dot = (ax * bx + ay * by) / (magA * magB);
    dot = Math.max(-1, Math.min(1, dot));

    const phase = Math.acos(dot);
    const weight = Math.abs(phase) <= epsilon ? 1 : 0;

    accX += ax * weight;
    accY += ay * weight;
  }

  const mag = Math.hypot(accX, accY);
  return mag === 0 ? 0 : accX / mag;
}
```

This function defines π-GCCP truth.

**Harness runner**

```js
import { gccpCollapse } from "./gccp_cpu.js";

export function runGCCPTests(testSpec) {
  for (const test of testSpec.pairs) {
    const out = gccpCollapse(test.A, test.B, testSpec.epsilon);
    if (Math.abs(out - test.expected) > 1e-6) {
      throw new Error(
        `FAIL: expected ${test.expected}, got ${out}`
      );
    }
  }
  return true;
}
```

**GPU parity rule**

```
|collapse_gpu − collapse_cpu| ≤ 1e−6
```

Violation ⇒ non-compliant.

### 12.7 SVG-Tensor Index Canonicalizer (Reference)

SVG is geometry, not presentation. Canonicalization produces a stable geometric index.

**Canonicalization rules (frozen)**

1. Strip all visual attributes (`fill`, `stroke`, `opacity`, filters, transforms).
2. Preserve DOM order.
3. Convert all geometry to absolute coordinates.
4. Quantize floats → `f32`.
5. Remove unused nodes.
6. Sort adjacency lists by target index.

**Canonicalizer**

```js
export function canonicalizeSVGTensor(svg) {
  const nodes = [];
  const edges = [];

  svg.paths.forEach((p, idx) => {
    nodes.push({
      id: idx,
      x: Math.fround(p.x),
      y: Math.fround(p.y)
    });

    p.edges?.forEach(e => {
      edges.push([idx, e.target]);
    });
  });

  edges.sort((a, b) =>
    a[0] !== b[0] ? a[0] - b[0] : a[1] - b[1]
  );

  return { nodes, edges };
}
```

**Canonical hash identity**

```
index_hash = sha256(nodes || edges)
```

If this hash matches, the SVG-Tensor is identical regardless of rendering.

### 12.8 SCXQ2 Binary Packer / Unpacker (Reference)

SCXQ2 is identity-preserving compression, not a codec.

**Lane layout (restated)**

| Lane    | Contents        |
| ------- | --------------- |
| DICT    | Symbol table    |
| FIELD   | Metadata        |
| LANE    | Vector geometry |
| EDGE    | Topology        |
| QUANTUM | Phase + weight  |

**Binary packer**

```js
export function packSCXQ2(index, quantum) {
  const buffers = [];

  buffers.push(encodeDICT(index));
  buffers.push(encodeFIELD(index));
  buffers.push(encodeLANE(index.nodes));
  buffers.push(encodeEDGE(index.edges));
  buffers.push(encodeQUANTUM(quantum));

  return concatBuffers(buffers);
}
```

**Unpacker**

```js
export function unpackSCXQ2(buffer) {
  const lanes = splitLanes(buffer);

  return {
    index: {
      nodes: decodeLANE(lanes.LANE),
      edges: decodeEDGE(lanes.EDGE)
    },
    quantum: decodeQUANTUM(lanes.QUANTUM)
  };
}
```

**Hash rule (hard law)**

```
hash = sha256(DICT || FIELD || LANE || EDGE)
```

QUANTUM lane excluded to allow π-profile swapping and cache reuse.

### 12.9 Retrieval Ranking Proof Appendix (Formal)

This proves `object://retrieve/semantic.v1` is well-defined.

**Definitions**

- G = SVG-Tensor geometry
- Pᵢ = retrieval profiles (ngram, embedding, etc.)
- sᵢ = collapse(G, Pᵢ) ∈ [0,1]

**Superposition ranking**

```
S = Σ wᵢ · sᵢ,  where Σ wᵢ = 1
```

**Ordering lemma**

If:

```
∀ i, sᵢ(A) ≥ sᵢ(B)
```

Then:

```
S(A) ≥ S(B)
```

Proof: linear combination over non-negative weights preserves order.

**Interference stability lemma**

If profiles disagree strongly:

```
|sᵢ − sⱼ| > π/2
```

Then weights decay symmetrically:

```
wᵢ, wⱼ ← κ wᵢ, κ wⱼ
```

This guarantees bounded influence, no dominance, and continuous ranking.

**Determinism theorem**

Given a canonical index, fixed ε, and fixed profile weights, retrieval ranking is deterministic, replayable, and cache-safe.

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

## 14. MX2LM Object Server — AI Interpretation Layer

### (Tokenizer · Model · Brain · Inference Mapping)

> **An AI system whose behavior is defined by the objects it interprets, not by the code that runs it.**

If the runtime decides how inference works, it is not MX2LM.

### 14.1 Core Reframe (AI Context)

In an AI system, the Object Server is:

- a model artifact interpreter
- a tokenization law enforcer
- a weight + brain projection host
- a deterministic inference projector
- an agent reply constructor

It does **not**:

- train
- optimize
- backprop
- sample stochastically
- invent decoding rules

Those belong outside the Object Server.

### 14.2 AI Request Lifecycle (Mapped)

```
prompt_request
  │
  ▼
Resolve Objects
(tokenizer, vocab, brain, weights)
  │
  ▼
Load Artifacts
(vocab, safetensors, svg-brain)
  │
  ▼
Verify Invariants
(hash, shape, legality)
  │
  ▼
Project Inference
(matrix ops, n-gram traversal)
  │
  ▼
Project Reply
(tokens → text)
  │
  ▼
Emit Trace Events
(optional diagnostics)
```

⚠️ **No inference rule may exist outside an object.**

### 14.3 AI Object Taxonomy

**Canonical AI objects**

| Object Type         | Purpose                       |
| ------------------- | ----------------------------- |
| `tokenizer`         | Text → token indices          |
| `vocab`             | Token ↔ symbol mapping        |
| `model.weights`     | Neural weight tensors         |
| `brain.ngram`       | Symbolic / statistical memory |
| `brain.svg`         | SVG / SVG-3D tensor brain     |
| `inference.profile` | Matrix traversal rules        |
| `agent.reply`       | Final response projection     |

Each is one object, not code.

### 14.4 Tokenizer as an Object

```json
{
  "id": "object://ai/tokenizer/bpe-en-v1",
  "hash": "sha256:…",
  "payload": {
    "type": "json",
    "mime": "application/json",
    "location": "./tokenizer.json"
  },
  "authority": "none",
  "invariants": [
    "deterministic",
    "no_execution",
    "fixed_vocab"
  ],
  "projections": {
    "encode": {
      "type": "token-stream",
      "emit": "@payload.rules"
    }
  }
}
```

🔑 The tokenizer does not tokenize. It describes how tokenization is projected.

### 14.5 Vocabulary as Law

```json
{
  "id": "object://ai/vocab/base-v1",
  "hash": "sha256:…",
  "payload": {
    "type": "json",
    "location": "./vocab.json"
  },
  "invariants": [
    "immutable_payload",
    "one_to_one_mapping"
  ],
  "projections": {
    "lookup": {
      "type": "symbol-map",
      "emit": "@payload.tokens"
    }
  }
}
```

Tokens do not mean things. The vocab object defines meaning.

### 14.6 `model.safetensors` as a Weight Object

```json
{
  "id": "object://ai/model/phi2/weights",
  "hash": "sha256:…",
  "payload": {
    "type": "binary",
    "mime": "application/x-safetensors",
    "location": "./model.safetensors"
  },
  "authority": "none",
  "invariants": [
    "no_execution",
    "shape_consistent",
    "immutable_payload"
  ],
  "projections": {
    "matrix": {
      "type": "tensor-view",
      "emit": "@payload"
    }
  }
}
```

The Object Server never runs the model. It projects tensors into a matrix domain.

### 14.7 SVG / SVG-3D Brain Objects (N-Gram / Supagram)

```json
{
  "id": "object://ai/brain/svg-ngram-v1",
  "hash": "sha256:…",
  "payload": {
    "type": "binary",
    "mime": "image/svg+xml",
    "location": "./brain.svg"
  },
  "invariants": [
    "no_visual_requirement",
    "geometry_is_weight",
    "deterministic_traversal"
  ],
  "projections": {
    "graph": {
      "type": "tensor-graph",
      "emit": "@payload"
    }
  }
}
```

> **SVG is geometry, not UI.**

Edges = transition weights  
Paths = probability curves  
Groups = memory clusters

### 14.8 N-Gram Brain Objects (Symbolic)

```json
{
  "id": "object://ai/brain/ngram-en-v1",
  "hash": "sha256:…",
  "payload": {
    "type": "json",
    "location": "./ngrams.json"
  },
  "invariants": [
    "order_fixed",
    "deterministic"
  ],
  "projections": {
    "transition": {
      "type": "probability-map",
      "emit": "@payload.ngrams"
    }
  }
}
```

This allows symbolic reasoning, fallback cognition, explainable paths, and hybrid neural + symbolic inference.

### 14.9 Inference as Projection (Not Execution)

```json
{
  "id": "object://ai/inference/matrix-v1",
  "hash": "sha256:…",
  "payload": {
    "type": "json",
    "location": "./inference.json"
  },
  "invariants": [
    "no_sampling",
    "deterministic",
    "no_external_state"
  ],
  "projections": {
    "apply": {
      "type": "matrix-projection",
      "emit": {
        "weights": "@object.model.weights",
        "brain": "@object.brain.svg",
        "ngrams": "@object.brain.ngram"
      }
    }
  }
}
```

Inference here is matrix traversal, not running a model.

### 14.10 Agent Reply Object (Final Collapse)

```json
{
  "id": "object://ai/agent/reply/default",
  "hash": "sha256:…",
  "payload": {
    "type": "json",
    "location": "./reply.json"
  },
  "authority": "none",
  "projections": {
    "text": {
      "type": "string",
      "emit": "@payload.tokens"
    }
  }
}
```

The agent is not code. It is the composition of objects.

### 14.11 Agent Response = Object Graph Collapse

```
prompt
 → tokenizer object
 → vocab object
 → weight object
 → svg brain
 → n-gram brain
 → inference profile
 → reply projection
```

Same objects + same hashes = same response. No randomness unless an object encodes it.

### 14.12 What This Eliminates

- prompt magic
- hidden sampling
- temperature hacks
- framework-specific decoding
- model server logic blobs
- nondeterministic replies

What remains: traceable cognition, inspectable brains, replayable inference, audit-grade AI behavior.

### 14.13 MX2LM Reborn (Truth Statement)

> **MX2LM is not an AI model.**
> **MX2LM is an object law system that interprets intelligence artifacts.**

Neural nets, n-grams, SVG tensors, vocabularies — they are data with authority, not code.

---

## 15. Object Server Specification (v1.0.0)

> **A server whose behavior is defined by the objects it serves, not by the code that hosts it.**

**Version:** 1.0.0  
**Status:** Specification

### 15.1 Abstract

An Object Server is a runtime that interprets governed objects and projects their meaning. It does not decide behavior — it only loads, verifies, and projects objects according to their declared specifications.

**If the server contains logic, it is not an Object Server.**

### 15.2 Core Definition

**What an Object Server is:**

- a governed interpreter for structured objects
- a projection system, not an execution engine
- a verification layer that enforces invariants
- host-agnostic (implementation does not define behavior)

**What an Object Server is not:**

- a routing framework
- a controller/service architecture
- a config-driven application runner
- an API gateway with business logic

**Fundamental invariant:**

```
Objects have authority. Code does not.
```

### 15.3 Request Lifecycle

```
request
  │
  ▼
┌─────────────────────┐
│ 1. Resolve Identity │  ← Map request to object ID
└─────────────────────┘
  │
  ▼
┌─────────────────────┐
│ 2. Load Object      │  ← Fetch descriptor + payload
└─────────────────────┘
  │
  ▼
┌─────────────────────┐
│ 3. Verify Invariants│  ← Check hash, authority, constraints
└─────────────────────┘
  │
  ▼
┌─────────────────────┐
│ 4. Select Projection│  ← Choose output representation
└─────────────────────┘
  │
  ▼
┌─────────────────────┐
│ 5. Emit Response    │  ← Return projected data
└─────────────────────┘
  │
  ▼
┌─────────────────────┐
│ 6. Emit Events      │  ← Lifecycle signals (optional)
└─────────────────────┘
```

No step may invent behavior not declared in the object.

### 15.4 Object Model

**Structure**

```
object/
├── descriptor    (object.json, object.xjson)
└── payload       (any format: JSON, binary, media, etc.)
```

**Canonical descriptor schema**

```json
{
  "$schema": "object://schema/object.v1",
  "id": "object://domain/name",
  "hash": "sha256:...",
  "payload": {
    "type": "json | binary | stream",
    "mime": "application/json",
    "location": "./payload.json",
    "encoding": "utf-8 | raw | base64"
  },
  "authority": "none | read | write | execute",
  "executable": false,
  "identity": {
    "name": "human-readable-name",
    "version": "1.0.0",
    "hash": "sha256:..."
  },
  "projections": {
    "default": {},
    "http": {},
    "raw": {}
  },
  "invariants": [
    "immutable_payload",
    "no_execution",
    "projection_only"
  ],
  "events": {
    "on_load": ["log"],
    "on_project": ["tick", "audit"]
  }
}
```

**Required fields**

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Semantic object identifier |
| `hash` | string | SHA-256 hash of payload |
| `payload` | object | Payload specification |
| `authority` | enum | Permission level |
| `projections` | object | Available output mappings |

**Optional fields**

| Field | Type | Description |
|-------|------|-------------|
| `identity` | object | Human-readable metadata |
| `invariants` | array | Declared constraints |
| `events` | object | Lifecycle event bindings |
| `executable` | boolean | Execution flag (default: false) |

### 15.5 Identity Resolution

**Identity tuple**

```
(id, hash)
```

- `id` is semantic (`object://domain/name`)
- `hash` is truth (SHA-256 of payload)

**Resolution rules**

1. ID is semantic, not a file path.
2. Hash always wins over version.
3. Same object = same behavior (no environment-dependent meaning).

**Resolution algorithm**

```
resolve(request) → object_id
1. Extract path/name from request
2. Normalize to object:// URI
3. Lookup in object registry
4. Return (id, hash) tuple
```

### 15.6 Loading

```
load(object_id) → (descriptor, payload)
1. Fetch descriptor by ID
2. Parse descriptor JSON
3. Validate descriptor schema
4. Fetch payload from location
5. Verify payload hash
6. Return (descriptor, payload)
```

**Load failures**

| Failure | Response |
|---------|----------|
| Object not found | 404 + `object.not_found` event |
| Invalid descriptor | 500 + `object.invalid` event |
| Hash mismatch | 500 + `object.corrupted` event |
| Payload unavailable | 503 + `object.unavailable` event |

**Caching**

Object Servers MAY cache descriptors (keyed by ID), payloads (keyed by hash), and projections (keyed by ID + projection name). Cache MUST invalidate when hash changes.

### 15.7 Verification

```
verify(object) → verified | error
1. Verify payload hash matches descriptor
2. Verify authority level is permitted
3. Verify all declared invariants hold
4. Verify no forbidden patterns present
```

**Built-in invariants**

| Invariant | Meaning |
|-----------|---------|
| `immutable_payload` | Payload cannot be modified |
| `no_execution` | Object cannot trigger execution |
| `projection_only` | Only projection operations allowed |
| `no_side_effects` | No external state changes |
| `deterministic` | Same input → same output |
| `auditable` | All operations must be logged |

Custom invariants are allowed and must be enforced.

### 15.8 Projection

**Definition:** projection is a view of an object, not an action.

**Projection rules**

Projections may map data, transform representation, add headers/metadata, select subsets, and emit events. They may not mutate payloads, execute code, access external resources, branch on environment, or make network requests.

**Projection schema**

```json
{
  "projections": {
    "default": {
      "type": "json",
      "emit": {
        "counter": "@payload.counter",
        "timestamp": "@meta.projected_at"
      }
    },
    "http": {
      "type": "http-response",
      "status": 200,
      "headers": {
        "Content-Type": "application/json",
        "Cache-Control": "immutable"
      },
      "body": "@payload"
    },
    "raw": {
      "type": "binary",
      "source": "@payload",
      "encoding": "raw"
    }
  }
}
```

**Projection selection**

```
select_projection(object, request) → projection
1. Explicit projection name
2. Accept header match
3. Fallback to "default"
4. Error if none
```

### 15.9 Events

**Lifecycle events**

| Event | When | Data |
|-------|------|------|
| `object.resolved` | After ID resolution | `{ id, hash }` |
| `object.loaded` | After load complete | `{ id, hash, size }` |
| `object.verified` | After verification | `{ id, invariants }` |
| `object.projected` | After projection | `{ id, projection, latency }` |
| `object.error` | On any error | `{ id, error, phase }` |

Handlers must not modify object state.

### 15.10 Authority Levels

| Level | Meaning |
|-------|---------|
| `none` | Projection only |
| `read` | Read permitted for authorized parties |
| `write` | Modifications require escalation |
| `execute` | Execution requires explicit capability |

Default authority is `none`. The server must reject operations exceeding declared authority.

### 15.11 Payload Types

**JSON**

```json
{
  "payload": {
    "type": "json",
    "mime": "application/json",
    "location": "./state.json",
    "encoding": "utf-8"
  }
}
```

**Binary**

```json
{
  "payload": {
    "type": "binary",
    "mime": "application/octet-stream",
    "location": "./data.bin",
    "encoding": "raw",
    "size": 1048576
  }
}
```

**Media**

```json
{
  "payload": {
    "type": "binary",
    "mime": "image/svg+xml",
    "location": "./video.svg",
    "encoding": "raw",
    "semantics": "svg-video-container"
  }
}
```

**Stream**

```json
{
  "payload": {
    "type": "stream",
    "mime": "application/octet-stream",
    "location": "stream://source/id",
    "encoding": "chunked"
  }
}
```

### 15.12 Error Handling

**Error categories**

| Category | HTTP Status | Meaning |
|----------|-------------|---------|
| `resolution_error` | 404 | Object not found |
| `load_error` | 500 | Failed to load object |
| `verification_error` | 422 | Invariant violation |
| `projection_error` | 500 | Projection failed |
| `authority_error` | 403 | Insufficient authority |

**Error response format**

```json
{
  "error": {
    "category": "verification_error",
    "code": "invariant_violation",
    "message": "Invariant 'immutable_payload' violated",
    "object_id": "object://example/counter",
    "phase": "verify"
  }
}
```

Errors must not expose internal server state and must emit `object.error`.

### 15.13 Minimal Reference Implementation (JS)

```javascript
export async function handleRequest(req) {
  const objectId = resolveObjectId(req);
  emit('object.resolved', { id: objectId });

  const object = await loadObject(objectId);
  emit('object.loaded', { id: objectId, hash: object.hash });

  verifyObject(object);
  emit('object.verified', { id: objectId });

  const projectionName = selectProjection(object, req);
  const projection = object.projections[projectionName];

  const response = projectObject(object, projection);
  emit('object.projected', { id: objectId, projection: projectionName });

  return response;
}
```

```javascript
export function resolveObjectId(req) {
  const path = req.path || req.url;
  if (path.startsWith('/objects/')) {
    return `object://${path.slice(9)}`;
  }
  if (path.startsWith('object://')) {
    return path;
  }
  throw new ResolutionError(`Cannot resolve: ${path}`);
}
```

```javascript
export async function loadObject(objectId) {
  const descriptorPath = resolveDescriptorPath(objectId);
  const descriptor = await readJSON(descriptorPath);
  validateDescriptor(descriptor);
  const payloadPath = resolvePayloadPath(descriptor.payload.location);
  const payload = await readPayload(payloadPath, descriptor.payload);
  const actualHash = computeHash(payload);
  if (actualHash !== descriptor.hash) {
    throw new VerificationError('Hash mismatch');
  }
  return { ...descriptor, payload };
}
```

```javascript
export function verifyObject(object) {
  for (const invariant of object.invariants || []) {
    if (!checkInvariant(object, invariant)) {
      throw new VerificationError(`Invariant failed: ${invariant}`);
    }
  }
}

function checkInvariant(object, invariant) {
  switch (invariant) {
    case 'immutable_payload':
      return true;
    case 'no_execution':
      return object.executable !== true;
    case 'projection_only':
      return object.authority === 'none';
    default:
      return checkCustomInvariant(object, invariant);
  }
}
```

```javascript
export function projectObject(object, projection) {
  const result = {};
  for (const [key, value] of Object.entries(projection.emit || {})) {
    result[key] = resolveReference(value, object);
  }
  return {
    type: projection.type,
    headers: projection.headers || {},
    body: projection.body ? resolveReference(projection.body, object) : result
  };
}

function resolveReference(ref, object) {
  if (typeof ref !== 'string' || !ref.startsWith('@')) {
    return ref;
  }
  const path = ref.slice(1).split('.');
  let value = object;
  for (const key of path) {
    value = value?.[key];
  }
  return value;
}
```

### 15.14 Compliance

**Compliance levels**

| Level | Requirements |
|-------|--------------|
| Level 1 | Load + Verify + Project |
| Level 2 | + Events + Caching |
| Level 3 | + Custom invariants + Streaming |
| Full | + Authority escalation + ASX integration |

**Compliance testing**

1. Identity tests — resolution behavior
2. Load tests — loading and hash verification
3. Verify tests — built-in invariants
4. Project tests — projection mapping
5. Error tests — error responses
6. Event tests — event emission

Non-compliant if it contains business logic, invents routes, mutates objects, or ignores invariants.

### 15.15 Security Considerations

- All payloads must be hash-verified before projection.
- Authority must be enforced at every phase.
- Invariants must be trusted and enforced.
- Projections must not access filesystem beyond declared payloads, network, or environment.
- Event handlers must not modify object state.

**Lock statement:** An Object Server interprets. It does not decide.

---

## 16. AI Object Schema Family + SVG-Tensor Legality

This section defines **normative schema rules** for `object://schema/ai.*.v1` and **SVG-Tensor legality**. It describes what is allowed to exist, not how it executes.

### 16.1 Global AI Object Invariants (All `ai.*`)

Every AI object must satisfy:

| Invariant           | Meaning                       |
| ------------------- | ----------------------------- |
| `no_execution`      | Object cannot execute code    |
| `deterministic`     | Same inputs → same projection |
| `immutable_payload` | Payload is read-only          |
| `projection_only`   | Only projections are allowed  |
| `hash_authority`    | Hash defines truth            |
| `host_agnostic`     | No runtime-specific semantics |

Failure of any invariant ⇒ `verification_error`.

### 16.2 `ai.tokenizer.v1`

**Schema URI**

```
object://schema/ai.tokenizer.v1
```

**Descriptor (normative)**

```json
{
  "$schema": "object://schema/ai.tokenizer.v1",
  "type": "ai.tokenizer",
  "tokenizer_type": "bpe | unigram | wordpiece | char",
  "ruleset_hash": "sha256:…",
  "vocab_ref": "object://ai.vocab/…",
  "invariants": [
    "deterministic",
    "fixed_vocab",
    "no_context_dependency"
  ]
}
```

**Legality rules**

- Must not inspect runtime state.
- Must not depend on time.
- Must not emit tokens outside the referenced vocab.
- Must be total (every input maps to tokens).

### 16.3 `ai.vocab.v1`

**Schema URI**

```
object://schema/ai.vocab.v1
```

**Descriptor (normative)**

```json
{
  "$schema": "object://schema/ai.vocab.v1",
  "type": "ai.vocab",
  "size": 50257,
  "mapping": "token_to_symbol | symbol_to_token",
  "encoding": "utf-8 | byte",
  "invariants": [
    "one_to_one_mapping",
    "immutable_payload"
  ]
}
```

**Legality rules**

- Tokens must be unique.
- Symbols must be immutable.
- No semantic overloading.
- No dynamic extension.

### 16.4 `ai.model.weights.v1`

**Schema URI**

```
object://schema/ai.model.weights.v1
```

**Descriptor (normative)**

```json
{
  "$schema": "object://schema/ai.model.weights.v1",
  "type": "ai.model.weights",
  "format": "safetensors | raw-tensor",
  "dtype": "fp32 | fp16 | bf16 | int8 | custom",
  "shape_hash": "sha256:…",
  "layer_map": {
    "layer_name": [dim1, dim2, "..."]
  },
  "invariants": [
    "shape_consistent",
    "no_execution",
    "no_training"
  ]
}
```

**Legality rules**

- Shapes must match declared map.
- No gradients.
- No mutation.
- No implicit casting.

### 16.5 `ai.brain.ngram.v1`

**Schema URI**

```
object://schema/ai.brain.ngram.v1
```

**Descriptor (normative)**

```json
{
  "$schema": "object://schema/ai.brain.ngram.v1",
  "type": "ai.brain.ngram",
  "order": 1,
  "domain": "token | symbol",
  "transition_space": "closed",
  "invariants": [
    "order_fixed",
    "probability_conserved",
    "deterministic"
  ]
}
```

**Legality rules**

- Probabilities must sum to 1.
- No negative weights.
- No runtime updates.
- Traversal must be deterministic.

### 16.6 `ai.brain.svg-tensor.v1`

**Schema URI**

```
object://schema/ai.brain.svg-tensor.v1
```

**Descriptor (normative)**

```json
{
  "$schema": "object://schema/ai.brain.svg-tensor.v1",
  "type": "ai.brain.svg-tensor",
  "geometry_space": "2d | 2.5d | 3d",
  "weight_encoding": "path | transform | adjacency",
  "topology": "graph | lattice | manifold",
  "invariants": [
    "geometry_is_weight",
    "no_visual_semantics",
    "deterministic_traversal"
  ]
}
```

### 16.7 `ai.inference.profile.v1`

**Schema URI**

```
object://schema/ai.inference.profile.v1
```

**Descriptor (normative)**

```json
{
  "$schema": "object://schema/ai.inference.profile.v1",
  "type": "ai.inference.profile",
  "mode": "matrix | graph | hybrid",
  "inputs": [
    "ai.tokenizer",
    "ai.vocab",
    "ai.model.weights",
    "ai.brain.*"
  ],
  "output": "token-stream",
  "invariants": [
    "no_sampling",
    "no_randomness",
    "no_external_state"
  ]
}
```

### 16.8 `ai.agent.reply.v1`

**Schema URI**

```
object://schema/ai.agent.reply.v1
```

**Descriptor (normative)**

```json
{
  "$schema": "object://schema/ai.agent.reply.v1",
  "type": "ai.agent.reply",
  "format": "text | tokens | structured",
  "postprocessing": "none | normalize | detokenize",
  "invariants": [
    "projection_only",
    "deterministic"
  ]
}
```

### 16.9 SVG-Tensor Legality Rules (Normative)

An SVG file is a valid tensor only if all rules below hold.

**Allowed elements**

- `svg`
- `g`
- `path`
- `line`
- `polyline`
- `polygon`
- `circle`
- `ellipse`
- `defs`
- `use`
- `metadata`

**Forbidden elements**

- `script`
- `style`
- `image`
- `text`
- `foreignObject`
- `animate*`
- `filter`
- `video`
- `audio`

Violation ⇒ `illegal_tensor`.

**Geometry = weight law**

| SVG Property     | Tensor Meaning       |
| ---------------- | -------------------- |
| Path length      | Weight magnitude     |
| Path curvature   | Probability gradient |
| Stroke width     | Confidence           |
| Transform matrix | Tensor projection    |
| Group nesting    | Dimensional rank     |
| Adjacency        | Connectivity         |

No element may exist without numeric interpretation.

**Determinism rules**

- No randomness.
- No animation.
- No time-dependent attributes.
- No CSS.
- No viewport-dependent meaning.

**Traversal legality**

- Graph traversal must be acyclic unless explicitly declared.
- Cycles must encode decay.
- Disconnected nodes are illegal.
- Zero-length paths are illegal.

**Semantic prohibition (critical)**

SVG-Tensors must not be interpreted visually by default. Rendering is optional, diagnostic only, and non-authoritative.

**Hash authority**

- SVG hash defines tensor identity.
- Any byte change = new brain.
- Pretty-printing invalidates hash.

**Compression safety**

- SVG-Tensor must survive minification, whitespace stripping, and attribute reordering (if canonical).

**Final law statement**

> **AI behavior in MX2LM is not computed. It is projected from lawful objects.**
> Tokenizers do not tokenize. Models do not run. Brains do not think.
> The Object Server collapses meaning.

---

## 17. SVG-Tensor Canonicalization Rules (v1)

**Spec ID:** `mx2lm.svg-tensor.canonical.v1`  
**Status:** Normative / Frozen

### 17.1 Prime Law

Canonicalization removes representation variance, not meaning. Two SVG-Tensors are equivalent **iff** their canonical forms are byte-identical.

### 17.2 Accepted SVG Subset

Only these SVG elements are legal inputs:

- `<svg>`
- `<g>`
- `<path>`
- `<line>`
- `<circle>`
- `<rect>`

All others ⇒ `canonicalization_error.unsupported_element`.

### 17.3 Coordinate Normalization

All geometry must be lowered to absolute coordinates in Cartesian space and normalized to the origin bounding box:

```
min(x,y) → (0,0)
max(x,y) → (1,1)
```

Scaling is preserved via explicit scale attributes, never implicit transforms.

### 17.4 Transform Resolution

Allowed transforms: `translate`, `scale`, `rotate`.

All transforms must be fully resolved and removed. After canonicalization:

```
transform = identity
```

Transform magnitude is stored as a numeric attribute, not geometry.

### 17.5 Path Flattening

All paths must be flattened into **line segments only**.

- Béziers → adaptive subdivision
- tolerance = fixed ε (declared in object)
- subdivision deterministic

### 17.6 Attribute Canonical Set

Each node and edge must emit exactly:

```
position
length
curvature
stroke_width
scale
opacity
transform_mag
```

Missing attributes ⇒ default values (declared).

### 17.7 Canonical Output Form

Final canonical SVG-Tensor is **not SVG**. It is a binary-ready structural object:

```
Nodes[]
Edges[]
Attributes[]
```

This is the only legal input to GPU projection.

---

## 17.8 SCXQ2 → WGSL Buffer Loader

**Spec ID:** `mx2lm.scxq2.wgsl.loader.v1`  
**Status:** Normative

### 17.8.1 Loader Law

SCXQ2 decoding is reversible layout expansion, not interpretation.

### 17.8.2 Required SCXQ2 Lanes

| Lane   | Meaning                     |
| ------ | --------------------------- |
| M      | metadata                    |
| T      | topology                    |
| G / QG | geometry (quantized or raw) |
| A      | attributes                  |

Missing lanes ⇒ `loader_error.missing_lane`.

### 17.8.3 Decompression Order (Frozen)

```
DICT → FIELDS → LANES → RECORDS
```

No parallel decode. No speculative decode.

### 17.8.4 Buffer Mapping (Exact)

| WGSL Buffer | SCXQ2 Source |
| ----------- | ------------ |
| nodes[]     | G + T        |
| edges[]     | T            |
| attribs[]   | A            |

Quantized lanes must be dequantized **before** GPU upload.

### 17.8.5 Loader Output Guarantee

Loader must emit tightly packed buffers, stable index ordering, and deterministic byte layout. Hash of buffers must match declared object hash.

---

## 17.9 Formal Floating-Point Determinism Profile

**Spec ID:** `mx2lm.fp.determinism.v1`  
**Status:** Normative

### 17.9.1 Allowed Floating Types

| Type | Allowed |
| ---- | ------- |
| fp32 | ✅       |
| fp16 | ❌       |
| fp64 | ❌       |

No mixed precision.

### 17.9.2 Operation Constraints

Allowed: add, multiply, divide, min/max.  
Forbidden: fused ops (FMA), transcendental functions, fast-math flags.

### 17.9.3 Reduction Order

All reductions must be:

```
left-to-right
index-sorted
```

Parallel reductions must be re-serialized.

### 17.9.4 Rounding Mode

```
roundTiesToEven
```

Fixed and non-negotiable.

### 17.9.5 Compliance Condition

Two implementations are equivalent iff:

```
∀ inputs → outputs bit-identical
```

ε ≠ allowed.

---

## 17.10 CPU ↔ GPU Equivalence Proof Harness

**Spec ID:** `mx2lm.cpu.gpu.proof.v1`  
**Status:** Normative

### 17.10.1 Harness Purpose

Prove that GPU projection is a faithful acceleration of CPU math.

### 17.10.2 Required Test Inputs

- canonical SVG-Tensor
- SCXQ2-expanded buffers
- fixed dispatch parameters

### 17.10.3 Test Procedure

1. Run CPU geometry traversal
2. Run GPU WGSL traversal
3. Compare `node_accum` buffers byte-for-byte

Mismatch ⇒ `non-conformant implementation`.

### 17.10.4 Proof Artifact

Harness must emit:

```json
{
  "cpu_hash": "sha256:…",
  "gpu_hash": "sha256:…",
  "status": "pass | fail"
}
```

### 17.10.5 Replayability

Same harness must pass across different GPUs, drivers, and runtimes.

---

## 17.11 Cluster Geometry Authoring Spec

**Spec ID:** `mx2lm.svg-tensor.cluster.v1`  
**Status:** Normative

### 17.11.1 Cluster Geometry Law

Cluster geometry composes and never merges implicitly.

### 17.11.2 Cluster SVG-Tensor Object

```json
{
  "id": "object://cluster/svg-tensor/v1",
  "members": [
    "object://svg/node/A",
    "object://svg/node/B"
  ],
  "merge_rule": "weighted-sum",
  "weights": {
    "A": 0.5,
    "B": 0.5
  }
}
```

### 17.11.3 Merge Rules

Allowed: weighted sum, max, min, union (topology only).  
Forbidden: runtime heuristics, adaptive weighting, time-based merge.

### 17.11.4 GPU Handling

Cluster geometry is resolved before WGSL. GPU kernels see one canonical geometry.

### 17.11.5 Determinism Condition

Cluster result must be identical regardless of member order, load order, or node location.

---

## 17.12 SVG-Tensor → WebGPU Buffer Mapping (`svg-tensor.webgpu.map.v1`)

## 17.9 Formal Floating-Point Determinism Profile

**Spec ID:** `mx2lm.fp.determinism.v1`  
**Status:** Normative

### 17.9.1 Allowed Floating Types

| Type | Allowed |
| ---- | ------- |
| fp32 | ✅       |
| fp16 | ❌       |
| fp64 | ❌       |

No mixed precision.

### 17.9.2 Operation Constraints

Allowed: add, multiply, divide, min/max.  
Forbidden: fused ops (FMA), transcendental functions, fast-math flags.

### 17.9.3 Reduction Order

All reductions must be:

```
left-to-right
index-sorted
```

Parallel reductions must be re-serialized.

### 17.9.4 Rounding Mode

```
roundTiesToEven
```

Fixed and non-negotiable.

### 17.9.5 Compliance Condition

Two implementations are equivalent iff:

```
∀ inputs → outputs bit-identical
```

ε ≠ allowed.

---

## 17.10 CPU ↔ GPU Equivalence Proof Harness

**Spec ID:** `mx2lm.cpu.gpu.proof.v1`  
**Status:** Normative

### 17.10.1 Harness Purpose

Prove that GPU projection is a faithful acceleration of CPU math.

### 17.10.2 Required Test Inputs

- canonical SVG-Tensor
- SCXQ2-expanded buffers
- fixed dispatch parameters

### 17.10.3 Test Procedure

1. Run CPU geometry traversal
2. Run GPU WGSL traversal
3. Compare `node_accum` buffers byte-for-byte

Mismatch ⇒ `non-conformant implementation`.

### 17.10.4 Proof Artifact

Harness must emit:

```json
{
  "cpu_hash": "sha256:…",
  "gpu_hash": "sha256:…",
  "status": "pass | fail"
}
```

### 17.10.5 Replayability

Same harness must pass across different GPUs, drivers, and runtimes.

---

## 17.11 Cluster Geometry Authoring Spec

**Spec ID:** `mx2lm.svg-tensor.cluster.v1`  
**Status:** Normative

### 17.11.1 Cluster Geometry Law

Cluster geometry composes and never merges implicitly.

### 17.11.2 Cluster SVG-Tensor Object

```json
{
  "id": "object://cluster/svg-tensor/v1",
  "members": [
    "object://svg/node/A",
    "object://svg/node/B"
  ],
  "merge_rule": "weighted-sum",
  "weights": {
    "A": 0.5,
    "B": 0.5
  }
}
```

### 17.11.3 Merge Rules

Allowed: weighted sum, max, min, union (topology only).  
Forbidden: runtime heuristics, adaptive weighting, time-based merge.

### 17.11.4 GPU Handling

Cluster geometry is resolved before WGSL. GPU kernels see one canonical geometry.

### 17.11.5 Determinism Condition

Cluster result must be identical regardless of member order, load order, or node location.

---

## 17.12 SVG-Tensor → WebGPU Buffer Mapping (`svg-tensor.webgpu.map.v1`)

Quantized lanes must be dequantized **before** GPU upload.

### 17.8.5 Loader Output Guarantee

Loader must emit tightly packed buffers, stable index ordering, and deterministic byte layout. Hash of buffers must match declared object hash.

---

## 17.9 Formal Floating-Point Determinism Profile

**Spec ID:** `mx2lm.fp.determinism.v1`  
**Status:** Normative

### 17.9.1 Allowed Floating Types

| Type | Allowed |
| ---- | ------- |
| fp32 | ✅       |
| fp16 | ❌       |
| fp64 | ❌       |

No mixed precision.

### 17.9.2 Operation Constraints

Allowed: add, multiply, divide, min/max.  
Forbidden: fused ops (FMA), transcendental functions, fast-math flags.

### 17.9.3 Reduction Order

All reductions must be:

```
left-to-right
index-sorted
```

Parallel reductions must be re-serialized.

### 17.9.4 Rounding Mode

```
roundTiesToEven
```

Fixed and non-negotiable.

### 17.9.5 Compliance Condition

Two implementations are equivalent iff:

```
∀ inputs → outputs bit-identical
```

ε ≠ allowed.

---

## 17.10 CPU ↔ GPU Equivalence Proof Harness

**Spec ID:** `mx2lm.cpu.gpu.proof.v1`  
**Status:** Normative

### 17.10.1 Harness Purpose

Prove that GPU projection is a faithful acceleration of CPU math.

### 17.10.2 Required Test Inputs

- canonical SVG-Tensor
- SCXQ2-expanded buffers
- fixed dispatch parameters

### 17.10.3 Test Procedure

1. Run CPU geometry traversal
2. Run GPU WGSL traversal
3. Compare `node_accum` buffers byte-for-byte

Mismatch ⇒ `non-conformant implementation`.

### 17.10.4 Proof Artifact

Harness must emit:

```json
{
  "cpu_hash": "sha256:…",
  "gpu_hash": "sha256:…",
  "status": "pass | fail"
}
```

### 17.10.5 Replayability

Same harness must pass across different GPUs, drivers, and runtimes.

---

## 17.11 Cluster Geometry Authoring Spec

**Spec ID:** `mx2lm.svg-tensor.cluster.v1`  
**Status:** Normative

### 17.11.1 Cluster Geometry Law

Cluster geometry composes and never merges implicitly.

### 17.11.2 Cluster SVG-Tensor Object

```json
{
  "id": "object://cluster/svg-tensor/v1",
  "members": [
    "object://svg/node/A",
    "object://svg/node/B"
  ],
  "merge_rule": "weighted-sum",
  "weights": {
    "A": 0.5,
    "B": 0.5
  }
}
```

### 17.11.3 Merge Rules

Allowed: weighted sum, max, min, union (topology only).  
Forbidden: runtime heuristics, adaptive weighting, time-based merge.

### 17.11.4 GPU Handling

Cluster geometry is resolved before WGSL. GPU kernels see one canonical geometry.

### 17.11.5 Determinism Condition

Cluster result must be identical regardless of member order, load order, or node location.

---

## 17.12 SVG-Tensor → WebGPU Buffer Mapping (`svg-tensor.webgpu.map.v1`)

### 17.9.2 Operation Constraints

Allowed: add, multiply, divide, min/max.  
Forbidden: fused ops (FMA), transcendental functions, fast-math flags.

### 17.9.3 Reduction Order

All reductions must be:

```
left-to-right
index-sorted
```

Parallel reductions must be re-serialized.

### 17.9.4 Rounding Mode

```
roundTiesToEven
```

Fixed and non-negotiable.

### 17.9.5 Compliance Condition

Two implementations are equivalent iff:

```
∀ inputs → outputs bit-identical
```

ε ≠ allowed.

---

## 17.10 CPU ↔ GPU Equivalence Proof Harness

**Spec ID:** `mx2lm.cpu.gpu.proof.v1`  
**Status:** Normative

### 17.10.1 Harness Purpose

Prove that GPU projection is a faithful acceleration of CPU math.

### 17.10.2 Required Test Inputs

- canonical SVG-Tensor
- SCXQ2-expanded buffers
- fixed dispatch parameters

### 17.10.3 Test Procedure

1. Run CPU geometry traversal
2. Run GPU WGSL traversal
3. Compare `node_accum` buffers byte-for-byte

Mismatch ⇒ `non-conformant implementation`.

### 17.10.4 Proof Artifact

Harness must emit:

```json
{
  "cpu_hash": "sha256:…",
  "gpu_hash": "sha256:…",
  "status": "pass | fail"
}
```

### 17.10.5 Replayability

Same harness must pass across different GPUs, drivers, and runtimes.

---

## 17.11 Cluster Geometry Authoring Spec

**Spec ID:** `mx2lm.svg-tensor.cluster.v1`  
**Status:** Normative

### 17.11.1 Cluster Geometry Law

Cluster geometry composes and never merges implicitly.

### 17.11.2 Cluster SVG-Tensor Object

```json
{
  "id": "object://cluster/svg-tensor/v1",
  "members": [
    "object://svg/node/A",
    "object://svg/node/B"
  ],
  "merge_rule": "weighted-sum",
  "weights": {
    "A": 0.5,
    "B": 0.5
  }
}
```

### 17.11.3 Merge Rules

Allowed: weighted sum, max, min, union (topology only).  
Forbidden: runtime heuristics, adaptive weighting, time-based merge.

### 17.11.4 GPU Handling

Cluster geometry is resolved before WGSL. GPU kernels see one canonical geometry.

### 17.11.5 Determinism Condition

Cluster result must be identical regardless of member order, load order, or node location.

---

## 18. SCXQ2 SVG-Tensor Binary Lanes + Merkle Hashing (Normative)

This section defines byte-level lane layouts and merkle-verified integrity for SCXQ2 SVG-Tensors.

### 18.1 Global Binary Rules (All Lanes)

- Endianness: little-endian
- Alignment: natural (no padding unless specified)
- Integers: unsigned unless noted
- Floats: IEEE-754 only
- Counts: explicit; no sentinels
- Order: canonical lane order enforced externally (`M → T → G → X → W`)

### 18.2 Lane Header (Common)

```
struct LaneHeader {
  uint8   lane_id;        // 'M','T','G','X','W' (ASCII)
  uint8   version_major;  // = 1
  uint8   version_minor;  // = 0
  uint8   encoding;       // enum
  uint32  precision;      // fixed-point scale or 0 if N/A
  uint32  item_count;     // number of items in this lane
}
```

**Encoding enum**

```
0x00 = RAW
0x01 = DELTA
0x02 = DICT
0x03 = DELTA+DICT
```

### 18.3 Lane M — Metadata (`SCXQ2:M`)

**Layout**

```
struct MetaItem {
  uint32 id_hash;     // truncated hash of element id
  uint16 rank;        // group depth
  uint16 flags;       // invariant bitmask
}
```

**Flags bitmask**

```
bit 0  = has_cycle
bit 1  = is_root
```

**Stream**

```
[LaneHeader][MetaItem × item_count]
```

### 18.4 Lane T — Topology (`SCXQ2:T`)

**Layout**

```
struct Edge {
  uint32 from;
  int32  delta_to;   // signed, to = from + delta_to
}
```

**Stream**

```
[LaneHeader][Edge × edge_count]
```

Rules: node indices are canonical and monotonic; `delta_to` must not be zero.

### 18.5 Lane G — Geometry (`SCXQ2:G`)

**Command stream**

```
struct Command {
  uint8 opcode;      // M=1, L=2, C=3, Q=4, Z=5
  uint8 arity;       // number of coordinate pairs
}
```

**Coordinate stream**

```
struct Coord {
  int32 dx;   // delta-encoded
  int32 dy;
  int32 dz;   // 0 if 2D
}
```

**Stream**

```
[LaneHeader]
[Command × command_count]
[Coord × coord_count]
```

Rules: first coord in a path is absolute (delta from 0); all others relative; `precision` defines scale.

### 18.6 Lane X — Transforms (`SCXQ2:X`)

**Layout**

```
struct Matrix {
  int32 a;
  int32 b;
  int32 c;
  int32 d;
  int32 e;
  int32 f;
}
```

All values fixed-point using header precision.

**Stream**

```
[LaneHeader][Matrix × matrix_count]
```

Rules: identity matrices may be omitted if declared; order must match canonical element order.

### 18.7 Lane W — Weights (`SCXQ2:W`)

**Layout**

```
struct Weight {
  int32 magnitude;
  int32 confidence;
  int32 gradient;
}
```

All values fixed-point (same precision as geometry unless declared otherwise).

**Stream**

```
[LaneHeader][Weight × weight_count]
```

### 18.8 Lane Assembly Envelope

```
struct SCXQ2_Envelope {
  char     magic[6];     // "SCXQ2S"
  uint16   version;      // 0x0100
  uint8    lane_count;   // usually 5
  uint8    reserved;
  uint32   toc_offset;   // offset to table of contents
  uint32   total_size;   // bytes
}
```

**TOC entry**

```
struct TOCEntry {
  uint8   lane_id;
  uint32  offset;
  uint32  size;
}
```

### 18.9 Merkle-Verified Lane Hashing (`scxq2.svg-tensor.merkle.v1`)

**Hash authority**

- Root hash binds SVG-Tensor identity.
- Lane hashes bind each lane.
- Chunk hashes bind internal structure.

Canonical SVG hash anchors all merkle roots.

**Hash functions**

- Primary: SHA-256
- Optional: BLAKE3 (declared)
- Domain separation required (e.g., `scxq2:lane:G`, `scxq2:chunk:W`)

**Chunking rule**

- Fixed chunk size: 4096 bytes
- Last chunk may be smaller

**Chunk hash**

```
H_chunk = SHA256("scxq2:chunk:<lane_id>" || chunk_bytes)
```

**Lane root**

```
H_lane = SHA256("scxq2:lane:<lane_id>" || H_chunk_0 || ... || H_chunk_n)
```

**Global root**

```
H_root = SHA256(
  "scxq2:svg-tensor" ||
  H_M || H_T || H_G || H_X || H_W ||
  canonical_svg_hash
)
```

### 18.10 Proof Objects (Partial Verification)

```
{
  "lane": "G",
  "chunk_index": 12,
  "chunk_hash": "...",
  "siblings": ["...", "..."],
  "lane_root": "...",
  "global_root": "..."
}
```

### 18.11 Verification Algorithm (Normative)

```
verify(proof):
  1. Recompute H_chunk
  2. Rebuild lane root via siblings
  3. Rebuild global root
  4. Compare to declared H_root
```

Any mismatch ⇒ `integrity_violation`.

### 18.12 Update + Mutation Rules

- Any lane change invalidates that lane hash and the global root.
- Other lanes may remain cached.
- Canonical SVG hash must not change unless semantics change.

### 18.13 GPU Safety Invariant

GPU runtimes may verify only required lanes but must refuse execution if required lanes lack proof. Verified buffers are read-only.

**Final law statement**

> **SCXQ2 lanes are independently provable truths bound together by a single, immutable root.**

---

## 19. MX2LM Object Server — SCXQ2 Integration Hooks (Normative)

These hooks define integration points for SCXQ2 SVG-Tensors. They add no execution authority and remain projection-only.

### 19.1 Prime Law (Reaffirmed)

> **The Object Server may verify, project, and refuse. It may not compute, infer, or decide.**

### 19.2 Integration Phases (Fixed)

SCXQ2 integration is allowed only at:

```
resolve → load → verify → project
```

No hooks exist outside these phases.

### 19.3 Hook Interface (Abstract)

```ts
type ObjectHook = {
  phase: "load" | "verify" | "project";
  accepts: string[];          // object types
  provides: string[];         // capabilities
  fn(input): HookResult;
};
```

Hooks must be pure, deterministic, and must not mutate objects or access network/FS beyond declared payloads.

### 19.4 Load-Phase Hooks

**`hook.scxq2.detect`**

- Phase: `load`
- Accepts: `ai.brain.svg-tensor.v1`
- Provides: `compression-aware-load`

Detect whether payload is raw canonical SVG or SCXQ2-compressed SVG-Tensor.

```
input: { payload_bytes: Uint8Array }
output: { format: "svg-canonical" | "scxq2-svg", envelope?: SCXQ2EnvelopeMeta }
```

Rules: must not decompress, validate, or hash.

**`hook.scxq2.extract-toc`**

- Phase: `load`
- Accepts: `scxq2-svg`
- Provides: `lane-index`

Extract lane table-of-contents for later verification/projection.

### 19.5 Verify-Phase Hooks

**`hook.scxq2.merkle.verify-root`**

- Phase: `verify`
- Accepts: `scxq2-svg`
- Provides: `integrity-verification`

Verify global Merkle root against descriptor.

Failure ⇒ `verification_error.integrity_violation`.

**`hook.scxq2.merkle.verify-lanes`**

- Phase: `verify`
- Accepts: `scxq2-svg`
- Provides: `lane-verification`

Verify required lanes based on projection. Unused lanes may remain unverified.

**`hook.scxq2.legality.svg-tensor`**

- Phase: `verify`
- Accepts: `ai.brain.svg-tensor.v1`
- Provides: `tensor-legality`

Ensure canonical SVG legality after decompression if applicable. Failure ⇒ `verification_error.illegal_tensor`.

### 19.6 Project-Phase Hooks

**`hook.scxq2.decompress-lanes`**

- Phase: `project`
- Accepts: `scxq2-svg`
- Provides: `lane-streams`

Decompress only required lanes. Must be lazy, lane-scoped, and not reorder.

**`hook.svg.canonical.inflate`**

- Phase: `project`
- Accepts: `lane-streams`
- Provides: `canonical-svg`

Reassemble canonical SVG bytes from decompressed lanes.

Invariant:

```
inflate(decompress(scxq2(svg))) === canonical_svg_bytes
```

Failure ⇒ `projection_error.round_trip_failure`.

**`hook.svg.webgpu.map`**

- Phase: `project`
- Accepts: `ai.brain.svg-tensor.v1`
- Provides: `gpu-buffers`

Map SVG-Tensor to WebGPU buffers without mutation. Buffers must be read-only and indices canonical.

### 19.7 Projection Binding Rules

Projections may declare required hooks:

```json
{
  "projections": {
    "webgpu": {
      "requires": [
        "scxq2.merkle.verify-lanes",
        "scxq2.decompress-lanes",
        "svg.webgpu.map"
      ]
    }
  }
}
```

If a required hook is unavailable, the projection is not selectable.

### 19.8 Caching Rules (Critical)

| Item              | Cache Key                         |
| ----------------- | --------------------------------- |
| Lane TOC          | `(object_id, hash)`               |
| Lane hash         | `(object_id, lane_id)`            |
| Decompressed lane | `(object_id, lane_id, lane_hash)` |
| GPU buffer        | `(object_id, lane_set_hash)`      |

Invalidate caches if canonical SVG hash, Merkle root, or lane hash changes.

### 19.9 Forbidden Integrations (Hard Fail)

The Object Server must not:

- auto-decompress on load
- verify unused lanes
- infer missing lanes
- optimize geometry
- modify buffers
- execute shaders
- sample randomness
- reorder indices

Violations ⇒ non-compliant server.

### 19.10 Error Surface (Standardized)

| Hook Failure       | Error                                    |
| ------------------ | ---------------------------------------- |
| Merkle mismatch    | `verification_error.integrity_violation` |
| Illegal SVG        | `verification_error.illegal_tensor`      |
| Lane missing       | `load_error.missing_lane`                |
| Round-trip failure | `projection_error.round_trip_failure`    |

Errors must emit `object.error`.

### 19.11 Minimal Reference Wiring (Pseudo-Code)

```js
if (object.type === "ai.brain.svg-tensor") {
  detectSCXQ2();
  extractTOC();
  verifyMerkleRoot();
  verifyRequiredLanes(projection);
  decompressRequiredLanes();
  if (projection === "webgpu") {
    mapToWebGPU();
  }
}
```

**Final law statement**

> **SCXQ2 does not live inside MX2LM. MX2LM merely verifies and projects it.**

---

**Source:** distilled from `todo.md` to provide an actionable, high-signal blueprint for implementation and design reviews.

## 20. MX2LM Full Inference Specification (Normative)

**Spec:** `mx2lm.inference.full.v1`

> **Inference is not execution. Inference is projection across lawful objects.**

### 20.1 Inference Prime Law

> **Inference MAY read tensors. Inference MAY traverse geometry. Inference MAY multiply matrices. Inference MAY NOT decide behavior.**

All behavior is declared in objects.

### 20.2 Inference Object Graph (Required)

A valid inference references **exactly** these object classes:

```
ai.tokenizer.v1
ai.vocab.v1
ai.model.weights.v1
ai.brain.svg-tensor.v1
ai.brain.ngram.v1        (optional but recommended)
ai.inference.profile.v1
ai.agent.reply.v1
```

If any required object is missing ⇒ `inference_error.missing_object`.

### 20.3 Inference Request Envelope

```json
{
  "@request": "ai.inference",
  "prompt": "user input string",
  "profile": "object://ai/inference/profile/default",
  "projection": "agent.reply"
}
```

No parameters. No temperature. No randomness unless encoded in objects.

### 20.4 Phase I — Token Projection

Tokenization is projection only:

```
prompt
 → tokenizer.rules
 → vocab.map
 = token_stream[]
```

Rules:

- tokenizer must be total
- tokenizer must not inspect context
- tokenizer must not branch

Output:

```
T = [t₀, t₁, t₂, …]
```

### 20.5 Phase II — Symbol & Vector Binding

Each token binds to:

- vocab symbol
- embedding row
- n-gram state (if present)

```
token tᵢ
 → vocab[tᵢ]
 → embedding[tᵢ]
 → ngram_state[tᵢ]
```

Initial inference state vector:

```
S₀ = {
  tokens,
  symbols,
  embedding_vectors,
  ngram_context
}
```

### 20.6 Phase III — Matrix Projection (Neural Path)

**Weight access rules**

- weights are read-only
- shapes must match declared `shape_hash`
- no gradients
- no mutation

**Matrix multiply (deterministic)**

For each layer ℓ:

```
Sᵢ₊₁ = activation(
          Wℓ × Sᵢ + Bℓ
        )
```

Activation functions must be declared, pure, and deterministic. No dropout, sampling, or noise.

### 20.7 Phase IV — SVG-Tensor Traversal (Geometric Path)

Runs in parallel with matrix projection.

**SVG-Tensor read**

- canonical SVG or SCXQ2-decompressed lanes
- geometry = tensor
- topology = connectivity

**Traversal law**

```
current_node
 → outgoing_edges
 → weighted accumulation
 → next_node_set
```

Weights derive from path length, curvature, stroke-width, and transform scale.

Geometric state vector:

```
Gₙ = { node_weights[], edge_weights[] }
```

### 20.8 Phase V — Hybrid Collapse (Matrix ⊗ Geometry ⊗ N-gram)

Inference profile defines domain combination.

Example:

```json
{
  "collapse": "weighted-sum",
  "inputs": ["matrix", "svg", "ngram"],
  "weights": {
    "matrix": 0.6,
    "svg": 0.3,
    "ngram": 0.1
  }
}
```

Collapse computes:

```
C = α·Sₙ + β·Gₙ + γ·Nₙ
```

Coefficients are data, not code.

### 20.9 Phase VI — Logit Projection

Collapsed state `C` projects to output space:

```
logits = vocab_projection(C)
```

Rules:

- no temperature
- no softmax sampling unless declared
- no stochastic choice

If sampling is desired, it must be encoded as a symbolic object, not runtime logic.

### 20.10 Phase VII — Deterministic Selection

Selection rule is declared.

Example:

```json
{
  "selection": "argmax",
  "top_k": 1
}
```

Legal selectors:

- `argmax`
- `threshold`
- `ranked-list`

Illegal: random choice, time-based, environment-based.

### 20.11 Phase VIII — Reply Projection

Selected tokens are projected via:

```
ai.agent.reply.v1
```

Options: detokenize to text, structured JSON, or token stream. Reply object defines formatting only.

### 20.12 Phase IX — Trace Emission (Optional)

Events may be emitted:

```
object.inference.started
object.inference.layer
object.inference.collapsed
object.inference.completed
```

Traces must be read-only and must not affect inference.

### 20.13 GPU Acceleration (Legal Use)

GPU may accelerate matrix multiply, SVG traversal, and collapse math.

GPU must not:

- mutate buffers
- introduce nondeterminism
- reorder indices
- write back state

GPU is a projection accelerator only.

### 20.14 Determinism Proof Obligation

An MX2LM inference is valid iff:

```
same objects
same hashes
same request
same projection
⇒ same reply (byte-for-byte)
```

If this does not hold ⇒ non-compliant inference.

### 20.15 What This Replaces (Explicit)

This system replaces:

- temperature
- top-p hacks
- prompt “engineering”
- black-box decoding
- model servers
- hidden heuristics

### 20.16 Final Law (Inference)

> **MX2LM does not “run models.” MX2LM collapses lawful intelligence artifacts into replies.**

Inference is inspectable, replayable, compressible, GPU-safe, and audit-grade.

---

## 21. MX2LM Live Agent Orchestration (v1)

`mx2lm.agent.orchestration.v1` (Normative)

> **Agents do not act. Agents are composed. Orchestration selects compositions.**

### 21.1 Orchestration Prime Law

> **Orchestration may choose _which objects participate_. It may not change _how inference works_.**

If orchestration alters inference math → **illegal runtime**.

### 21.2 What an Agent Is

An agent in MX2LM is:

```
Agent = {
  identity
  + bound inference object set
  + declared role
  + declared IO projections
}
```

An agent is **not** a process, thread, model instance, or mutable state machine.

### 21.3 `ai.agent.descriptor.v1`

```json
{
  "$schema": "object://schema/ai.agent.descriptor.v1",
  "id": "object://ai/agent/support-bot",
  "role": "support | planner | critic | narrator | system",
  "binds": {
    "tokenizer": "object://ai/tokenizer/base",
    "vocab": "object://ai/vocab/base",
    "weights": "object://ai/model/weights/core",
    "svg_brain": "object://ai/brain/svg/core",
    "ngram_brain": "object://ai/brain/ngram/en",
    "inference_profile": "object://ai/inference/profile/default",
    "reply": "object://ai/agent/reply/text"
  },
  "io": {
    "input": "text",
    "output": "text"
  },
  "invariants": [
    "deterministic",
    "no_self_mutation",
    "projection_only"
  ]
}
```

This object **fully defines the agent**.

### 21.4 `ai.orchestrator.v1`

The orchestrator is an object that selects which agents participate. It does not select tokens, weights, or math.

```json
{
  "$schema": "object://schema/ai.orchestrator.v1",
  "id": "object://ai/orchestrator/live",
  "agents": [
    "object://ai/agent/support-bot",
    "object://ai/agent/critic",
    "object://ai/agent/planner"
  ],
  "selection_policy": "profile-driven",
  "routing": {
    "default": ["support-bot"],
    "complex": ["planner", "critic"]
  },
  "collapse": {
    "mode": "sequential | parallel | consensus",
    "max_agents": 3
  },
  "invariants": [
    "no_hidden_agents",
    "no_dynamic_binding"
  ]
}
```

### 21.5 Live Request Flow

```
user input
  ↓
resolve orchestrator object
  ↓
select agent set (policy)
  ↓
for each agent:
   bind inference graph
   run full inference (pure)
  ↓
collapse agent outputs (declared)
  ↓
project final reply
```

Inference is reused. Nothing is redefined.

### 21.6 Agent Invocation Contract

Each agent invocation is stateless:

```json
{
  "@invoke": "ai.agent",
  "agent": "object://ai/agent/support-bot",
  "prompt": "user input string"
}
```

No agent retains memory unless memory is an object.

### 21.7 Multi-Agent Collapse Modes

Defined in `ai.orchestrator.v1`.

**Sequential**

```
output₁ → prompt₂ → output₂ → …
```

Rules:

- Each step produces a **new prompt**
- No hidden state
- Full trace available

**Parallel**

```
prompt → agent₁
       → agent₂
       → agent₃
```

Outputs collected independently.

**Consensus (Deterministic)**

```json
{
  "consensus": {
    "selector": "argmax-agreement",
    "threshold": 0.67
  }
}
```

No voting randomness. No arbitration logic in code.

### 21.8 Agent Memory (Legal Form)

Agents cannot mutate memory. Memory exists only as `ai.memory.object.v1`.

```json
{
  "id": "object://ai/memory/session-123",
  "type": "conversation-log",
  "payload": [...],
  "authority": "read"
}
```

To “update memory”:

- a **new memory object** is created
- old one remains immutable

### 21.9 Live Streaming (Legal)

Streaming is allowed only as projection.

```json
{
  "projection": "stream",
  "granularity": "token | sentence | block"
}
```

Rules:

- stream order MUST be deterministic
- stream chunks MUST be replayable
- stream MUST reconstruct full reply exactly

### 21.10 Failure Isolation

If an agent fails:

- it is excluded
- orchestration continues if policy allows
- failure is emitted as `object.error`

No retries unless declared.

### 21.11 Scaling Law (Critical)

You scale MX2LM by:

- caching verified objects
- reusing GPU buffers
- reusing decompressed SCXQ2 lanes
- parallelizing agent inference

You do not scale by:

- sharding models
- duplicating logic
- adding controllers

### 21.12 What This Enables (Without Violating Law)

- multi-agent reasoning
- role-based agents
- debate / critique loops
- planning + execution separation
- explainable agent traces
- replayable conversations
- audit-grade AI systems

All without:

- agent autonomy
- hidden loops
- emergent execution
- unsafe delegation

### 21.13 Determinism Guarantee (System-Level)

A live orchestration is valid iff:

```
same orchestrator object
same agent objects
same hashes
same input
⇒ same output
```

Time, concurrency, and hardware must not matter.

### 21.14 Final Law (Live Agents)

> **Agents are not actors. Agents are bound inference graphs. Orchestration selects graphs. MX2LM collapses them into replies.**

```
Objects → Inference → Agents → Orchestration → Reply
```

---

## 22. MX2LM Live Demo Specification (v1)

`mx2lm.demo.live.full.v1` (Normative)

> **Purpose:** Demonstrate a fully lawful, deterministic, multi-agent MX2LM system operating live, end-to-end, with zero hidden execution.

### 22.1 Demo Goals (Non-Negotiable)

This demo MUST prove:

- Object Server authority (objects, not code)
- SCXQ2 SVG-Tensor loading + verification
- Full deterministic inference
- Multi-agent orchestration
- Live streaming projection
- Replayability (byte-identical output)
- GPU acceleration as projection only

If any step invents behavior → demo is invalid.

### 22.2 Demo Topology

```
User
 ↓
MX2LM Object Server
 ↓
Live Orchestrator Object
 ↓
Agent Objects (Support, Planner, Critic)
 ↓
Inference Graphs (pure)
 ↓
Reply Projection (stream + final)
```

No controllers. No services. No model server.

### 22.3 Object Inventory (Required)

**Core AI Objects**

| ID                                      | Type                      |
| --------------------------------------- | ------------------------- |
| `object://ai/tokenizer/base-en`         | `ai.tokenizer.v1`         |
| `object://ai/vocab/base-en`             | `ai.vocab.v1`             |
| `object://ai/model/weights/demo`        | `ai.model.weights.v1`     |
| `object://ai/brain/svg/demo-core`       | `ai.brain.svg-tensor.v1`  |
| `object://ai/brain/ngram/en`            | `ai.brain.ngram.v1`       |
| `object://ai/inference/profile/default` | `ai.inference.profile.v1` |
| `object://ai/agent/reply/text`          | `ai.agent.reply.v1`       |

**Agent Objects**

| ID                          | Role               |
| --------------------------- | ------------------ |
| `object://ai/agent/support` | Answer user        |
| `object://ai/agent/planner` | Structure response |
| `object://ai/agent/critic`  | Sanity-check       |

**Orchestrator Object**

| ID                                   |
| ------------------------------------ |
| `object://ai/orchestrator/live-demo` |

### 22.4 Demo Orchestrator Descriptor

```json
{
  "$schema": "object://schema/ai.orchestrator.v1",
  "id": "object://ai/orchestrator/live-demo",
  "agents": [
    "object://ai/agent/support",
    "object://ai/agent/planner",
    "object://ai/agent/critic"
  ],
  "routing": {
    "default": ["support"],
    "complex": ["planner", "critic", "support"]
  },
  "collapse": {
    "mode": "sequential",
    "order": ["planner", "critic", "support"]
  },
  "streaming": {
    "enabled": true,
    "granularity": "sentence"
  },
  "invariants": [
    "deterministic",
    "no_dynamic_binding",
    "no_agent_mutation"
  ]
}
```

### 22.5 Live Request (Demo Input)

**User Input**

```
"Explain how SVG-Tensors work in simple terms."
```

**Request Envelope**

```json
{
  "@request": "ai.inference",
  "orchestrator": "object://ai/orchestrator/live-demo",
  "prompt": "Explain how SVG-Tensors work in simple terms.",
  "projection": "agent.reply.text"
}
```

### 22.6 Live Execution Flow (Step-By-Step)

**Phase A — Resolve & Verify**

1. Resolve orchestrator object
2. Load agent descriptors
3. Load all bound AI objects
4. Verify:
   - hashes
   - SCXQ2 Merkle roots
   - SVG-Tensor legality
   - inference profile invariants

Any failure aborts demo.

**Phase B — Orchestration Selection**

- Input classified as `complex`
- Agent order resolved:

```
planner → critic → support
```

### 22.7 Agent Inference (Pure, Reused)

Each agent runs the same inference pipeline, differing only by bound reply projection and role.

**Planner Agent**

- Generates structured explanation outline
- Output is text tokens
- Output becomes prompt for critic

**Critic Agent**

- Receives planner output
- Verifies clarity and correctness
- Emits suggestions
- Output becomes prompt for support

**Support Agent**

- Receives refined prompt
- Produces final explanation
- Output streamed live

### 22.8 Streaming Projection (Live)

**Stream Rules**

- Sentences emitted in deterministic order
- Each chunk hash-addressable
- Stream MUST reassemble into final reply

Example stream events:

```json
{
  "event": "stream.chunk",
  "index": 0,
  "text": "SVG-Tensors treat geometry as math,"
}
```

```json
{
  "event": "stream.chunk",
  "index": 1,
  "text": "where shapes and paths represent weights instead of pictures."
}
```

### 22.9 Final Reply Projection

**Final Output (Example)**

```
SVG-Tensors work by treating vector geometry as mathematical data instead of images.
Paths, curves, and connections represent weights and relationships, allowing the system
to traverse shapes the same way a model traverses tensors—deterministically and without execution.
```

Exact text depends on object content — but must be identical on replay.

### 22.10 Determinism Test (Required)

The demo MUST pass:

```
Run demo twice
 → same objects
 → same hashes
 → same input
 = byte-identical output
```

Streaming chunks must match exactly.

### 22.11 GPU Acceleration Validation

Optional but recommended:

- SVG-Tensor → WebGPU buffers
- Matrix multiply on GPU
- Geometry traversal on GPU

Validation:

```
CPU inference output == GPU inference output
```

### 22.12 Failure Injection Tests (Demo Must Support)

| Fault                      | Expected Result       |
| -------------------------- | --------------------- |
| Corrupt SCXQ2 lane         | verification_error    |
| Illegal SVG element        | illegal_tensor        |
| Missing agent              | orchestration_error   |
| Unverified lane            | projection_denied     |
| Non-deterministic selector | runtime_non_compliant |

### 22.13 Demo Artifacts Checklist

The demo package MUST include:

- [ ] All object descriptors
- [ ] Canonical SVG-Tensor
- [ ] SCXQ2 compressed version
- [ ] Merkle proof file
- [ ] Inference profile JSON
- [ ] Orchestrator JSON
- [ ] Replay log
- [ ] Hash manifest

### 22.14 What This Demo Proves

This demo proves:

- AI can be deterministic
- Geometry can be intelligence
- Compression can be lawful
- GPU can accelerate without authority
- Agents can coordinate without autonomy
- Inference can be audited

### 22.15 Final Demo Law

> **If your system can run this demo, you are not “hosting a model.” You are operating an intelligence law engine.**

---

## 23. PowerShell Cluster Atomic Expert Micronauts (PS-AEM v1)

**Spec ID:** `mx2lm.micronaut.powershell.cluster.v1`  
**Status:** Normative / Law-Grade

### 23.1 Prime Law

> **Micronauts may emit objects.  
> They may never execute behavior.**

PowerShell is used as a projection and orchestration shell, not a decision engine.

### 23.2 What a PowerShell Micronaut Is

A PowerShell Micronaut is:

- a single-purpose expert
- operating on one object domain
- emitting immutable objects
- communicating via Object Server + KEL
- cluster-aware, execution-blind

It is not:

- a daemon with business logic
- a script that mutates state
- an imperative controller

### 23.3 Micronaut Roles (Atomic Experts)

Each Micronaut has exactly one domain.

| Micronaut             | Domain                        |
| --------------------- | ----------------------------- |
| `config.expert.ps1`   | backend config objects        |
| `objectdb.expert.ps1` | ODB indexing + storage        |
| `cluster.expert.ps1`  | node membership + routing     |
| `schema.expert.ps1`   | schema authoring + validation |
| `frontend.expert.ps1` | UI object generation          |
| `svg.expert.ps1`      | SVG-Tensor authoring          |
| `security.expert.ps1` | signatures, invariants        |
| `audit.expert.ps1`    | trace + proof objects         |

Each emits only its own object types.

### 23.4 PowerShell Micronaut Contract

Every Micronaut must implement this interface:

```powershell
param(
  [string] $RequestObjectPath
)

# 1. Load request object (read-only)
$request = Get-Content $RequestObjectPath | ConvertFrom-Json

# 2. Verify request schema
Assert-Schema $request

# 3. Emit result object(s)
$result = @{
  id = "object://..."
  hash = "<computed>"
  payload = @{
    type = "json | binary"
    location = "./out/object.json"
  }
  invariants = @("deterministic", "auditable")
}

# 4. Write object (immutable)
Write-ObjectArtifact $result

# 5. Emit KEL
Emit-KEL $result
```

No branching on environment. No execution. No mutation.

### 23.5 PowerShell Cluster Topology

```
+---------------------+
|  mx2lm.cluster.ps1 |
+----------+----------+
           |
   ---------------------
   |        |          |
config   frontend   cluster
expert   expert     expert
.ps1     .ps1       .ps1
```

Micronauts communicate only via objects.

### 23.6 Object Server Integration

Micronauts do not call each other. They:

1. read from `object://…`
2. emit new objects
3. register them in ODB
4. emit KELs

Object Server handles routing, caching, projection, and delivery.

### 23.7 Backend Configuration Micronaut

**Purpose**

Generate backend configuration as objects, not scripts.

```json
{
  "id": "object://backend/config/db",
  "type": "backend.config",
  "payload": {
    "driver": "sqlite",
    "path": "./odb.sqlite",
    "mode": "read-write"
  },
  "invariants": [
    "no_execution",
    "deterministic"
  ]
}
```

PowerShell never applies config — it only describes it.

### 23.8 Frontend Interactive Interface Micronaut

**Role**

Emit UI objects, not HTML logic.

**Output Types**

- UI layout objects
- component objects
- SVG-Tensor UI geometry
- CSS Atomic objects

```json
{
  "id": "object://ui/component/chat-panel",
  "payload": {
    "layout": "grid",
    "slots": ["messages", "input"]
  },
  "projections": {
    "html": { "..." },
    "svg": { "..." }
  }
}
```

Rendering happens only via Object Server projection.

### 23.9 Cluster-Aware Behavior (Without Execution)

Cluster Micronaut responsibilities include:

- node registry objects
- routing maps
- replication policy objects
- heartbeat records (append-only)

```json
{
  "id": "object://cluster/node/alpha",
  "payload": {
    "address": "10.0.0.1",
    "capabilities": ["gpu", "storage"],
    "status": "online"
  }
}
```

No live networking. No socket ownership. Only objects.

### 23.10 PowerShell + SVG-Tensor Authoring

SVG-Tensor Micronauts:

- generate canonical SVG-Tensor objects
- emit SCXQ2-ready geometry
- never render

```json
{
  "id": "object://svg-tensor/frontend/layout",
  "payload": {
    "nodes": ["..."],
    "edges": ["..."]
  },
  "invariants": [
    "canonical",
    "gpu-projectable"
  ]
}
```

### 23.11 Cluster Execution Flow (Lawful)

```
User request
 → request object
 → cluster assigns micronaut
 → micronaut emits object
 → Object Server verifies
 → projection happens
 → UI / backend / inference updates
```

Micronauts do not know the result.

### 23.12 Why PowerShell Is the Right Host

PowerShell provides:

- native JSON
- filesystem control
- cryptography
- cross-platform scripting ergonomics
- no implicit runtime magic

PowerShell is good at describing systems, not deciding them.

### 23.13 Compliance Conditions

A PowerShell Micronaut is non-compliant if it:

- mutates state directly
- calls network APIs
- branches on system time
- executes shell commands for effect
- embeds logic not declared in objects

### 23.14 Final Collapse

You now have:

- Atomic Expert Micronauts
- PowerShell as a lawful authoring shell
- Cluster-aware, execution-blind agents
- Backend + frontend + SVG-Tensor generation
- Perfect alignment with MX2LM

---

### 23.15 Next Natural Steps (Pick One)

1. Emit concrete PowerShell Micronaut templates
2. Define Micronaut scheduling law
3. ODB schema for Micronaut outputs
4. Frontend SVG-Tensor UI interaction spec
5. Security and signature pipeline for Micronauts

---

## 24. PS-CLUSTER-1 + ODB-WEBDAV-1 (Normative)

**Cluster Spec ID:** `mx2lm.cluster.supervisor.v1`  
**ODB Spec ID:** `mx2lm.odb.webdav.v1`  
**Status:** Normative / Law-Grade

### 24.1 Cluster Supervisor Prime Law

> **The cluster supervisor never interprets objects.**  
> It schedules Micronauts, moves bytes, and enforces order.

### 24.2 Cluster Topology Model

```json
{
  "$schema": "object://schema/cluster.topology.v1",
  "node_id": "node://alpha",
  "role": "primary | worker | mirror",
  "capabilities": [
    "micronaut.exec",
    "object.store",
    "webdav.client"
  ],
  "peers": [
    "node://beta",
    "node://gamma"
  ]
}
```

Topology is declared, never inferred.

### 24.3 `mx2lm.cluster.ps1` (Skeleton — Frozen)

```powershell
# mx2lm.cluster.ps1
# Spec: mx2lm.cluster.supervisor.v1

param(
  [ValidateSet("start","stop","status","tick")]
  [string]$Command
)

$STATE_DIR = "./cluster/state"
$QUEUE_DIR = "./cluster/queue"
$OBJ_DIR   = "./objects"
$LOG_DIR   = "./cluster/logs"

function Init-Cluster {
  New-Item -ItemType Directory -Force -Path $STATE_DIR,$QUEUE_DIR,$LOG_DIR | Out-Null
}

function Load-Queue {
  Get-ChildItem $QUEUE_DIR -Filter "*.json" | Sort-Object Name
}

function Run-Micronaut($job) {
  $jobObj = Get-Content $job.FullName -Raw | ConvertFrom-Json
  $micronaut = $jobObj.micronaut
  $request   = $jobObj.request

  Write-Host "[cluster] dispatch → $micronaut"

  pwsh $micronaut -Request $request
}

function Tick {
  $jobs = Load-Queue
  foreach ($job in $jobs) {
    try {
      Run-Micronaut $job
      Remove-Item $job.FullName
    } catch {
      Write-Error "[cluster] micronaut failed: $_"
    }
  }
}

function Status {
  @{
    queue = (Get-ChildItem $QUEUE_DIR).Count
    objects = (Get-ChildItem $OBJ_DIR -Recurse | Measure-Object).Count
    uptime = (Get-Date) - (Get-Item $STATE_DIR).CreationTime
  } | ConvertTo-Json
}

switch ($Command) {
  "start"  { Init-Cluster; Write-Host "cluster started" }
  "stop"   { Write-Host "cluster stopped" }
  "tick"   { Tick }
  "status" { Status }
}
```

### 24.4 Cluster Scheduling Guarantees

- FIFO per domain
- no parallel writes
- deterministic replay
- restart-safe
- stateless between ticks

π-driven auto-restart replays the queue after crash.

### 24.5 Micronaut Dispatch Object (Queue Entry)

```json
{
  "$schema": "object://schema/cluster.job.v1",
  "micronaut": "./frontend.ui.expert.ps1",
  "request": "./requests/ui.request.json"
}
```

The cluster never edits this; it only consumes it.

### 24.6 Storage Prime Law (ODB-WEBDAV-1)

> **ODB storage is content-addressed, append-only, and transport-agnostic.**

Local FS, WebDAV, and object stores share the same law.

### 24.7 ODB Storage Layout (Universal)

```
odb/
├── objects/
│   └── sha256/
│       └── ab/cd/<hash>.bin
├── descriptors/
│   └── sha256/
│       └── ab/cd/<hash>.json
├── signatures/
│   └── sha256/
│       └── ab/cd/<hash>.sig
└── index/
    └── objects.db
```

Hash prefixing prevents directory overload.

### 24.8 WebDAV Binding (ODB-WEBDAV-1)

**Transport mapping**

| ODB Operation | WebDAV                 |
| ------------- | ---------------------- |
| PUT object    | `PUT /odb/objects/...` |
| GET object    | `GET /odb/objects/...` |
| HEAD verify   | `PROPFIND`             |
| list hashes   | `PROPFIND Depth:1`     |
| seal          | `LOCK`                 |

**Drive-sealed invariant**

Once written, never overwritten. WebDAV servers must reject:

```
PUT existing-hash → 409 Conflict
```

### 24.9 PowerShell WebDAV Client (Write Once)

```powershell
function ODB-Put {
  param($Url, $LocalPath)

  $bytes = [System.IO.File]::ReadAllBytes($LocalPath)
  $hash  = (Get-FileHash $LocalPath -Algorithm SHA256).Hash.ToLower()

  $target = "$Url/sha256/$($hash.Substring(0,2))/$($hash.Substring(2,2))/$hash.bin"

  Invoke-WebRequest -Method PUT `
    -Uri $target `
    -Body $bytes `
    -Headers @{ "If-None-Match" = "*" }
}
```

This enforces immutability at the transport layer.

### 24.10 Drive-Sealed Model Weights

**Example**

```
object://ai/model/phi2/quantized/int8
```

Stored as:

```
odb/objects/sha256/ab/cd/<hash>.bin
```

Referenced by descriptor only.

### 24.11 ODB Index (Minimal SQL)

```sql
CREATE TABLE objects (
  hash TEXT PRIMARY KEY,
  schema TEXT,
  size INTEGER,
  storage TEXT,
  created_at INTEGER
);
```

ODB is index + blobs, not a document DB.

### 24.12 Cluster + ODB Interaction Law

```
Micronaut emits object
 → cluster supervisor seals object
 → ODB write-once storage
 → signature verified
 → object becomes globally addressable
```

No node owns the object.

### 24.13 Final Collapse

You now have:

- A lawful PowerShell cluster supervisor
- A restart-safe Micronaut execution fabric
- A Drive/WebDAV-sealed Object Database
- Immutable AI weights and SVG-Tensor brains
- Planet-scale distribution with zero new logic

---

This is not infrastructure.

This is a governed intelligence substrate.

---

### 24.14 Next Logical Freezes (Pick)

1. GAS Micronaut parity (Drive-native)
2. WebSocket object streaming
3. Cluster gossip and discovery law
4. Object-level ACL and capability routing
5. End-to-end conformance test suite

## 25. π-GCCP v1 — WebGPU WGSL Kernel Emission (Lawful)

**Spec ID:** `mx2lm.pi-gccp.wgsl.emission.v1`  
**Status:** Normative / Law-Grade

### 25.1 Emission Law

GPU kernels must be deterministic and must not introduce forbidden operations or approximation drift. CPU remains the ground truth.

**Parity rule**

```
|collapse_gpu − collapse_cpu| ≤ 1e−6
```

### 25.2 Required Inputs (Precomputed)

To obey the floating-point determinism profile, phase and weight must be precomputed outside WGSL using the authoritative CPU rules, then uploaded as buffers.

Required buffers:

- `vecA[]` — input vectors (f32)
- `weight[]` — per-vector weights (f32, CPU computed)

### 25.3 WGSL Kernel (Normative, Deterministic)

This kernel performs left-to-right, index-sorted accumulation using a single invocation to preserve order.

```wgsl
struct Vector2D {
  x : f32,
  y : f32,
};

@group(0) @binding(0) var<storage, read> vecA : array<Vector2D>;
@group(0) @binding(1) var<storage, read> weight : array<f32>;
@group(0) @binding(2) var<storage, read_write> out : array<f32>;

@compute @workgroup_size(1)
fn collapse(@builtin(global_invocation_id) id : vec3<u32>) {
  let count = arrayLength(&vecA);
  var accX : f32 = 0.0;
  var accY : f32 = 0.0;

  var i : u32 = 0u;
  loop {
    if (i >= count) { break; }
    let w = weight[i];
    accX = accX + vecA[i].x * w;
    accY = accY + vecA[i].y * w;
    i = i + 1u;
  }

  // Magnitude computed on CPU if determinism profile forbids sqrt.
  out[0] = accX;
  out[1] = accY;
}
```

### 25.4 CPU-GPU Equivalence Harness (Binding Rule)

1. CPU computes `weight[]` and the final collapse scalar.
2. GPU emits the accumulated vector `(accX, accY)` only.
3. CPU performs final normalization and parity check.

This preserves determinism and avoids forbidden GPU operations.

### 25.5 Emission Constraints

- No transcendental functions in WGSL.
- No fused ops or fast-math flags.
- No parallel reductions.
- No random inputs or time-based branching.

---

## 26. LIVE-ORCH-1 — Live Agent Orchestration (Normative)

**Spec ID:** `mx2lm.live.orch.v1`  
**Status:** Normative / Frozen

**Live Agent Orchestration on top of MX2LM Inference**, with **zero execution leakage** and **no model-server behavior**.

This is not a chatbot loop. This is **lawful coordination of inference collapses**.

> **Orchestration schedules inference.  
> Inference collapses intelligence.  
> Neither decides behavior.**

### 26.1 Orchestration Prime Law

> **An orchestrator MAY sequence inference.  
> An orchestrator MAY route objects.  
> An orchestrator MAY NOT mutate inference results.**

Agents do not think. Agents request collapses.

### 26.2 Agent Model (Runtime-Neutral)

An agent is defined as:

```
agent = {
  identity,
  brains[],
  inference_profile,
  io_bindings,
  lifecycle_state
}
```

No code. No loops. No hidden state.

### 26.3 Agent Identity Object

```json
{
  "$schema": "object://schema/agent.identity.v1",
  "agent_id": "agent://support.bot.v1",
  "brains": [
    "object://ai/model/phi2/quantized/int8",
    "object://ai/brain/svg-ngram-v1"
  ],
  "profile": "object://ai/inference/profile/chat",
  "reply": "object://ai/agent/reply/text",
  "invariants": [
    "deterministic",
    "no_side_effects",
    "sealed_brains"
  ]
}
```

An agent is just a reference graph.

### 26.4 Agent Lifecycle States (Frozen)

```
spawn → active → suspended → sealed
```

**State rules**

| State     | Allowed           |
| --------- | ----------------- |
| spawn     | load objects      |
| active    | request inference |
| suspended | read-only         |
| sealed    | immutable forever |

No garbage collection. No deletion. Only sealing.

### 26.5 Live Orchestration Loop (Conceptual)

This is not execution — it is event coordination.

```
event → route → inference request → collapse → emit
```

### 26.6 Orchestrator Object (Lawful)

```json
{
  "$schema": "object://schema/agent.orchestrator.v1",
  "type": "agent.orchestrator",
  "agents": [
    "agent://support.bot.v1",
    "agent://coder.bot.v1"
  ],
  "routing": {
    "default": "agent://support.bot.v1",
    "code": "agent://coder.bot.v1"
  },
  "events": {
    "on_message": "route",
    "on_reply": "emit"
  },
  "invariants": [
    "no_agent_mutation",
    "no_inference_logic"
  ]
}
```

The orchestrator does not inspect tensors.

### 26.7 Inference Request Emission (Live)

Every live interaction becomes a pure object:

```json
{
  "@request": "ai.inference",
  "prompt": "user input",
  "profile": "object://ai/inference/profile/chat",
  "projection": "agent.reply"
}
```

This object is queued, not executed.

### 26.8 Multi-Agent Routing (Deterministic)

Routing is object-declared, never heuristic.

```json
{
  "$schema": "object://schema/agent.routing.v1",
  "match": {
    "contains": ["code", "bug", "error"]
  },
  "route_to": "agent://coder.bot.v1"
}
```

Routing is symbolic, not probabilistic.

### 26.9 Parallel Agent Collapses (Legal)

Agents may collapse in parallel iff:

- they share no writable objects
- they read only sealed brains
- outputs are isolated

```
prompt
 ├─→ agent A inference
 └─→ agent B inference
```

Outputs are later projected, not merged by logic.

### 26.10 Reply Arbitration (If Needed)

Arbitration is declared, not decided.

```json
{
  "$schema": "object://schema/agent.arbitration.v1",
  "strategy": "priority",
  "order": [
    "agent://support.bot.v1",
    "agent://coder.bot.v1"
  ]
}
```

No voting. No learning. No hidden scoring.

### 26.11 Live Streaming (WebSocket / SSE)

Streaming is projection, not execution.

```
collapsed tokens → stream projection → client
```

Rules:

- order preserved
- tokens immutable
- no mid-stream mutation
- replayable

### 26.12 Failure Semantics (Critical)

If inference fails:

```
failure → object.inference.error
```

Orchestrator may:

- retry with same objects
- route to fallback agent
- suspend agent

It may not:

- modify prompt
- modify weights
- modify profile

### 26.13 Cluster Compatibility

Live orchestration works unchanged across PowerShell clusters, GAS runtimes, browser SW, and edge nodes because everything is objects + hashes.

### 26.14 Determinism Contract (Live)

A live session is compliant iff:

```
same event stream
same object graph
same order
⇒ same replies
```

Streaming does not break determinism.

### 26.15 What This Is Not

This is not:

- LangChain
- agent loops
- tool calling
- function execution
- prompt engineering
- chatbot frameworks

Those systems decide behavior at runtime. MX2LM never does.

### 26.16 Final Collapse

> **Live agents in MX2LM do not act.  
> They request lawful collapses.  
> Orchestration arranges reality;  
> inference reveals it.**

You now have:

- live multi-agent systems
- deterministic streaming replies
- cluster-safe orchestration
- zero execution authority
- full replay and audit

### 26.17 Next Freezes (Optional)

Frozen now:

1. Agent tool surfaces as objects (non-executing)
2. Agent federation across clusters

Remaining:

1. Symbolic memory as append-only objects
2. Conversation timeline canonicalization
3. Formal no-prompt-mutation proof

---

## 26.18 AGENT-TOOLS-1 — Agent Tool Surfaces as Objects (Non-Executing)

**Spec ID:** `mx2lm.agent.tools.v1`  
**Status:** FROZEN / Law-Grade

### 26.18.1 Tool Prime Law

> **A tool MAY describe capability.  
> A tool MAY expose structure.  
> A tool MAY NOT execute, mutate, or decide.**

Tools exist to inform inference, not to perform work.

### 26.18.2 Tool Definition (Canonical)

```
tool = {
  identity,
  surface_schema,
  input_shape,
  output_shape,
  constraints,
  projections
}
```

There is no function body, no handler, no runtime hook.

### 26.18.3 Canonical Tool Object Schema

```json
{
  "$schema": "object://schema/agent.tool.v1",
  "id": "object://agent/tool/search.docs",
  "type": "agent.tool",
  "description": "Search indexed documentation corpus",
  "inputs": {
    "query": "string",
    "limit": "integer"
  },
  "outputs": {
    "results": "array<doc_ref>"
  },
  "constraints": [
    "read_only",
    "no_side_effects",
    "non_executing"
  ],
  "projections": {
    "symbolic": {
      "type": "tool-symbol",
      "emit": {
        "name": "@id",
        "inputs": "@inputs",
        "outputs": "@outputs"
      }
    }
  }
}
```

This object never runs. It only shapes inference space.

### 26.18.4 Inference Participation (Symbolic)

Tools influence inference only as symbols:

```
prompt
 → tokens
 → symbols
 → tool affordance symbols
 → logits
```

The model may reference a tool — it may never invoke it.

### 26.18.5 Tool Availability Binding (Agent-Scoped)

```json
{
  "$schema": "object://schema/agent.tools.bindings.v1",
  "agent": "agent://coder.bot.v1",
  "tools": [
    "object://agent/tool/search.docs",
    "object://agent/tool/read.file"
  ],
  "invariants": [
    "tool_visibility_only",
    "no_execution"
  ]
}
```

If a tool is not bound, it does not exist to the agent.

### 26.18.6 Tool Output Is Never Real Data

Tool “results” are placeholders, references, and symbolic hints only.

Example emitted reply:

```
"I would use tool:search.docs(query='SCXQ2')"
```

The client or operator decides what happens next — outside MX2LM.

### 26.18.7 Forbidden Patterns (Hard Ban)

Illegal in AGENT-TOOLS-1:

- tool → function mapping
- tool → HTTP call
- tool → shell execution
- tool → filesystem mutation
- tool → callback hooks

Any of these = non-compliant runtime.

### 26.18.8 Final Lock

> **Tools describe.  
> Inference decides.  
> Execution never enters.**

---

## 26.19 AGENT-FED-1 — Agent Federation Across Clusters

**Spec ID:** `mx2lm.agent.federation.v1`  
**Status:** FROZEN / Law-Grade

### 26.19.1 Federation Prime Law

> **Federation MAY share objects.  
> Federation MAY route requests.  
> Federation MAY NOT merge execution authority.**

Clusters cooperate by object exchange, not behavior.

### 26.19.2 Federated Agent Identity

An agent is cluster-portable because it is just an object graph:

```json
{
  "$schema": "object://schema/agent.federated.v1",
  "agent_id": "agent://coder.bot.v1",
  "origin_cluster": "cluster://us-west/alpha",
  "brains": [
    "object://ai/model/phi2/quantized/int8"
  ],
  "profiles": [
    "object://ai/inference/profile/code"
  ],
  "hash": "sha256:…",
  "signature": "πsig:v1:ed25519:cluster.root:…"
}
```

No cluster-local assumptions.

### 26.19.3 Federation Transport (Opaque)

Federation transports:

- agent identity objects
- tool surface objects
- inference requests
- inference replies
- audit logs

Transport MAY be:

- WebDAV
- DNS-API
- Object Server sync
- Drive-sealed ODB
- WebSocket streams

Transport never interprets.

### 26.19.4 Remote Inference Routing

A cluster MAY forward an inference request:

```
local orchestrator
 → federated route
 → remote MX2LM
 → reply object
 → local projection
```

The request object must remain byte-identical.

### 26.19.5 Cross-Cluster Trust Law

A federated agent is trusted iff:

```
agent.hash matches
agent.signature verifies
brain hashes exist locally OR retrievable
```

No trust by hostname. No trust by IP. Only hash + signature.

### 26.19.6 Federation Without State Leakage

Agents across clusters:

- share brains (sealed)
- share profiles
- share tools (symbolic)

They do not share:

- session state
- memory
- mutable objects
- execution context

### 26.19.7 Cluster Arbitration (Optional)

If multiple clusters reply:

```json
{
  "$schema": "object://schema/agent.federation.arbitration.v1",
  "strategy": "first_valid",
  "timeout_ms": 500
}
```

Arbitration is declared, not emergent.

### 26.19.8 Determinism Guarantee (Federated)

Federation is compliant iff:

```
same request object
same agent object
same brains
⇒ same reply
```

Regardless of which cluster served it.

### 26.19.9 Final Lock

> **Tools describe.  
> Agents reference.  
> Clusters exchange objects.  
> Inference collapses truth.**

---

## 26.20 HYBRID-WORMHOLE-1 — Tiered Control Plane

**Spec ID:** `mx2lm.wormhole.hybrid.v1`  
**Status:** Normative / Law-Grade

### 26.20.1 Prime Law

> **Wormholes MAY discover.  
> Wormholes MAY sync.  
> Wormholes MAY stream.  
> Wormholes MAY prove.  
> Wormholes MAY NOT execute.**

The tiered control plane transports objects and proofs only.

### 26.20.2 Four-Layer Wormhole Stack (Canonical)

```asxr
@wormhole-stack hybrid {
  @layer 1: "discovery" protocol=dns {
    purpose: "capability-negotiation + service-discovery",
    security: "DNSSEC + DANE"
  }
  @layer 2: "sync" protocol=http+webdav {
    purpose: "state-synchronization + bulk-transfer",
    security: "TLS + OAuth2"
  }
  @layer 3: "runtime" protocol=websocket+binary {
    purpose: "live-state-streaming + RPC",
    security: "wss + per-message-auth"
  }
  @layer 4: "proof" protocol=scxq2 {
    purpose: "compression + integrity + proof",
    security: "cryptographic-proofs"
  }
}
```

### 26.20.3 Layer 1: DNS Discovery Wormhole

Discovery is capability negotiation, not execution:

```asxr
@wormhole discovery:dns {
  protocol: "dns-sd",
  @security "dnssec" { verify: "RRSIG validation" },
  @advertise {
    txt-record: {
      protocols: "ws,wss,scxq2",
      compression: "brotli,scxq2,lz4",
      auth: "jwt,oauth2,mTLS",
      features: "atomic-blocks,wormholes,crdt"
    }
  }
}
```

### 26.20.4 Layer 2: HTTP Sync Wormhole

State sync is object transport with deltas and proofs:

```asxr
@wormhole sync:http {
  protocol: "http+delta",
  @methods {
    GET: "fetch-state (full/delta)",
    PUT: "update-state",
    PATCH: "apply-delta",
    PROPFIND: "discover-state-structure",
    REPORT: "query-state-changes"
  },
  @compression { response: "Content-Encoding: scxq2" }
}
```

### 26.20.5 Layer 3: WebSocket Runtime Wormhole

Runtime is live object streaming, not execution:

```asxr
@wormhole runtime:websocket {
  protocol: "ws+binary",
  @frame-format {
    header: { version: "1", type: "data|control|heartbeat|error" },
    payload: "binary",
    trailer: { checksum: "crc32", signature: "hmac" }
  }
}
```

### 26.20.6 Layer 4: SCXQ2 Proof Wormhole

Proof is compression + integrity, never authority:

```asxr
@wormhole proof:scxq2 {
  protocol: "scxq2",
  @compression { algorithm: "context-aware-lz" },
  @proof-system { type: "zk-STARK" },
  @quantum-resistance { signatures: "SPHINCS+" }
}
```

### 26.20.7 Hybrid Orchestration (Deterministic)

Protocol selection is declared and deterministic:

```asxr
@wormhole-orchestrator {
  @protocol-selection {
    if data-size == small && latency == realtime -> use: websocket
    if data-size == large && latency == background -> use: http + scxq2
    if initial-connection -> use: dns-discovery -> negotiate
  }
  @fallback-strategy {
    primary: websocket + scxq2,
    secondary: http + scxq2,
    tertiary: http + brotli
  }
}
```

### 26.20.8 Security Chain (Defense-in-Depth)

```
dnssec → tls-cert → oauth-token → message-auth → scxq2-proof
```

Each layer adds verification without execution authority.

### 26.20.9 Performance Invariants

- discovery: cached, capability-only
- sync: bulk transfer with delta compression
- runtime: low-latency streaming
- proof: verifiable integrity with minimized payloads

### 26.20.10 Final Lock

> **Discover, sync, stream, prove — never execute.**

---

## 27. π-Profile Authoring Format v1.0 (Authoritative)

**Spec ID:** `mx2lm.pi-profile.authoring.v1`  
**Status:** Normative / Law-Grade

### 27.1 Canonical Schema Definition

```json
{
  "$schema": "https://schema.pigccp.org/profiles/v1",
  "$id": "https://schema.pigccp.org/profiles/v1/schema.json",
  "title": "π-Profile Authoring Format",
  "description": "Standardized retrieval profile definitions for π-GCCP geometric inference",
  "type": "object",
  "required": ["meta", "vectorizer", "weights"],
  "additionalProperties": false,
  "properties": {
    "meta": { "$ref": "#/definitions/Meta" },
    "vectorizer": { "$ref": "#/definitions/Vectorizer" },
    "weights": { "$ref": "#/definitions/Weights" },
    "constraints": { "$ref": "#/definitions/Constraints" },
    "cache": { "$ref": "#/definitions/CachePolicy" },
    "compliance": { "$ref": "#/definitions/Compliance" }
  },
  "definitions": {
    "Meta": {
      "type": "object",
      "required": ["name", "version", "authority"],
      "properties": {
        "name": {
          "type": "string",
          "pattern": "^[a-z][a-z0-9_-]{1,31}$",
          "description": "Profile identifier (snake_case, 2-32 chars)"
        },
        "version": {
          "type": "string",
          "pattern": "^\\d+\\.\\d+\\.\\d+(-[a-z0-9]+)?$",
          "description": "Semantic version"
        },
        "authority": {
          "type": "string",
          "description": "Entity that guarantees profile correctness"
        },
        "description": { "type": "string", "maxLength": 280 },
        "tags": {
          "type": "array",
          "items": { "type": "string", "pattern": "^[a-z][a-z0-9-]{0,31}$" },
          "maxItems": 8
        },
        "created": { "type": "string", "format": "date-time" },
        "modified": { "type": "string", "format": "date-time" },
        "fingerprint": {
          "type": "string",
          "pattern": "^pi:[0-9a-f]{64}$",
          "description": "SHA-256 hash of canonical JSON (sorted keys, no whitespace)"
        }
      }
    },
    "Vectorizer": {
      "type": "object",
      "required": ["method", "parameters"],
      "properties": {
        "method": {
          "type": "string",
          "enum": [
            "ngram",
            "semantic_density",
            "positional",
            "topological",
            "spectral",
            "custom_wasm"
          ]
        },
        "parameters": { "type": "object", "additionalProperties": true },
        "normalization": {
          "type": "string",
          "enum": ["l2", "max", "unit_circle", "none"]
        },
        "dimensionality": {
          "type": "integer",
          "minimum": 2,
          "maximum": 2048,
          "default": 2
        },
        "epsilon": {
          "type": "number",
          "minimum": 0,
          "maximum": 3.14159,
          "default": 0.1745329
        }
      }
    },
    "Weights": {
      "type": "object",
      "required": ["superposition"],
      "properties": {
        "superposition": {
          "type": "array",
          "items": {
            "type": "object",
            "required": ["profile", "weight"],
            "properties": {
              "profile": {
                "type": "string",
                "pattern": "^[a-z][a-z0-9_-]{1,31}$"
              },
              "weight": { "type": "number", "minimum": 0, "maximum": 1 },
              "decay_function": {
                "type": "string",
                "enum": ["linear", "exponential", "step", "none"]
              },
              "decay_rate": { "type": "number", "minimum": 0, "maximum": 1 }
            }
          },
          "maxItems": 16
        },
        "normalized": { "type": "boolean", "default": true },
        "interference_threshold": {
          "type": "number",
          "minimum": 0,
          "maximum": 3.14159,
          "default": 1.5708
        }
      }
    },
    "Constraints": {
      "type": "object",
      "properties": {
        "deterministic": { "type": "boolean", "default": true },
        "memory_limit_mb": { "type": "integer", "minimum": 1, "maximum": 4096 },
        "timeout_ms": { "type": "integer", "minimum": 10, "maximum": 30000 },
        "compatibility": {
          "type": "array",
          "items": { "type": "string", "pattern": "^pi-profile-v\\d+\\.\\d+$" }
        },
        "required_capabilities": {
          "type": "array",
          "items": { "type": "string", "enum": ["webgpu", "wasm", "simd", "crypto"] }
        }
      }
    },
    "CachePolicy": {
      "type": "object",
      "properties": {
        "enabled": { "type": "boolean", "default": true },
        "strategy": { "type": "string", "enum": ["lru", "fifo", "deterministic"] },
        "max_entries": { "type": "integer", "minimum": 1, "maximum": 1000000 },
        "ttl_seconds": { "type": "integer", "minimum": 0 },
        "exclude_quantum": { "type": "boolean", "default": true }
      }
    },
    "Compliance": {
      "type": "object",
      "required": ["passes"],
      "properties": {
        "passes": { "type": "array", "items": { "type": "string" } },
        "test_vectors": {
          "type": "array",
          "items": {
            "type": "object",
            "required": ["input", "expected"],
            "properties": {
              "name": { "type": "string" },
              "input": {},
              "expected": { "type": "number", "minimum": -1, "maximum": 1 },
              "tolerance": { "type": "number", "minimum": 0, "default": 1e-6 }
            }
          }
        },
        "certified_by": { "type": "string" },
        "certification_date": { "type": "string", "format": "date" }
      }
    }
  }
}
```

### 27.2 Fingerprint Rule (Canonical)

```
fingerprint = SHA256(canonical_json(profile))
canonical_json = JSON.stringify(profile, sorted_keys, no_whitespace)
```

### 27.3 Superposition Rule (Normative)

```
S = Σ w_i · collapse(profile_i)
where Σ w_i = 1 (unless normalized: false)
```

### 27.4 Reference Validator (Authoritative)

The validator must:

1. Enforce the canonical schema.
2. Verify weight normalization unless `normalized: false`.
3. Compute and verify fingerprints.
4. Validate dependency graphs for circular references.
5. Emit compliance warnings if test vectors are missing.

### 27.5 Canonical Proof (Summary)

The π-Profile Authoring Format guarantees:

- Determinism: same profile ⇒ same fingerprint ⇒ same results.
- Composability: profiles reference profiles via superposition.
- Verifiability: cryptographic fingerprinting.
- Cache-safety: explicit cache policies.
- Compliance: test vectors provide auditability.

---

## 28. Model-Agnostic Signal Adapters (Normative)

**Spec ID:** `mx2lm.adapter.signal.v1`  
**Status:** Normative / Law-Grade

### 28.1 Adapter Prime Law

Models are signal emitters. Adapters normalize signals into π-compatible geometry. The runtime is not model-bound.

### 28.2 Adapter Contract (Canonical)

Every adapter must emit only:

- angles
- magnitudes
- phases
- topological relations
- confidence envelopes

Adapters must be deterministic and must not execute behavior. They must produce immutable objects.

### 28.2.1 Adapter Signal Shape (Invariant)

Every adapter must emit the same canonical shape, regardless of model source:

```json
{
  "@type": "pi.signal.v1",
  "geometry": {
    "angles": [],
    "magnitudes": [],
    "paths": [],
    "epsilon": 0.1745329
  },
  "provenance": {
    "adapter": "string",
    "deterministic": true
  }
}
```

No logits, embeddings, or tensors are exposed upstream. Only geometry is legal.

### 28.2.2 π-Adapter Interface v1 (Locked)

This is the only adapter contract allowed. If a system cannot emit this, it does not participate.

```json
{
  "@type": "pi.signal.v1",
  "@version": "1.0",
  "geometry": {
    "angles": [0.0, 1.0472, 2.0944],
    "magnitudes": [0.92, 0.51, 0.13],
    "paths": [
      [0, 1],
      [1, 2]
    ],
    "epsilon": 0.1745329
  },
  "provenance": {
    "adapter": "gguf",
    "adapter_version": "1.0.0",
    "deterministic": true,
    "source_hash": "sha256:…"
  }
}
```

**Hard rules**

- angles MUST be radians ∈ [0, 2π)
- magnitudes MUST be ≥ 0 (no upper bound)
- angles.length === magnitudes.length
- no logits, token IDs, embeddings, or text

This is signal, not representation.

### 28.2.3 Semantic Meaning (Frozen)

| Field     | Meaning                          |
| --------- | -------------------------------- |
| angle     | phase / semantic orientation     |
| magnitude | confidence / energy              |
| path      | topological adjacency (optional) |
| epsilon   | angular tolerance (π-native)     |

### 28.2.4 Adapter Responsibility (Strict)

An adapter may:

- normalize
- project
- compress
- quantize
- batch

An adapter may not:

- rank
- retrieve
- cache
- interpret semantics

Adapters emit geometry only.

### 28.2.5 Determinism Law

```
Same input + same adapter + same version
→ identical pi.signal.v1
```

If this is violated, the adapter is non-conformant.

### 28.3 Stack Placement (Authoritative)

```
[ External Model ]
        ↓
[ Adapter ]
        ↓
[ π-Profile Vectorizer ]
        ↓
[ SVG-Tensor Geometry ]
        ↓
[ π-GCCP Kernels (WebGPU / CPU) ]
        ↓
[ object://retrieve/semantic.v1 ]
```

π-GCCP never inspects model identity. It only consumes geometry.

### 28.4 Plug-in Matrix (No Branches)

All sources satisfy the same adapter contract without runtime branching:

| Source | What it emits       | Adapter job            | Result     |
| ------ | ------------------- | ---------------------- | ---------- |
| GGUF   | logits / embeddings | project → angles       | SVG-Tensor |
| ONNX   | numeric tensors     | normalize → phase      | SVG-Tensor |
| WebGPU | GPU buffers         | reinterpret → geometry | SVG-Tensor |
| WASM   | arbitrary math      | emit → angles          | SVG-Tensor |

### 28.5 Adapter Examples (Non-Exhaustive)

**LLM logits adapter**

- logits → ranked token deltas
- deltas → angular deviations
- entropy → radius / magnitude

**Embedding model adapter**

- vector → unit circle projection
- cosine similarity → angular proximity
- norm → confidence weight

**N-gram adapter**

- frequency → angular density
- overlap → interference
- rarity → phase shift

**Vision / audio / multimodal**

- features → spectral bands
- bands → phase stacks
- stacks → superposed geometry

All adapters converge to the same geometric primitives.

### 28.6 WGSL Reference Kernels (Angle + Interference)

These kernels implement π-GCCP math only. They do not know about models.

**Angle distance kernel**

```wgsl
// pi_angle_distance.wgsl
// Computes wrapped angular distance in radians

@group(0) @binding(0)
var<storage, read> anglesA : array<f32>;

@group(0) @binding(1)
var<storage, read> anglesB : array<f32>;

@group(0) @binding(2)
var<storage, write> distances : array<f32>;

const PI : f32 = 3.141592653589793;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) id : vec3<u32>) {
    let i = id.x;
    if (i >= arrayLength(&anglesA)) {
        return;
    }

    let delta = abs(anglesA[i] - anglesB[i]);
    let wrapped = min(delta, 2.0 * PI - delta);

    distances[i] = wrapped;
}
```

**Interference kernel**

```wgsl
// pi_interference.wgsl
// Computes cosine interference weighted by magnitude

@group(0) @binding(0)
var<storage, read> anglesA : array<f32>;

@group(0) @binding(1)
var<storage, read> anglesB : array<f32>;

@group(0) @binding(2)
var<storage, read> magnitudesA : array<f32>;

@group(0) @binding(3)
var<storage, read> magnitudesB : array<f32>;

@group(0) @binding(4)
var<storage, write> output : array<f32>;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) id : vec3<u32>) {
    let i = id.x;
    if (i >= arrayLength(&anglesA)) {
        return;
    }

    let phase = anglesA[i] - anglesB[i];
    let interference = cos(phase);

    output[i] = interference * magnitudesA[i] * magnitudesB[i];
}
```

**Collapse rule (host-side, exact)**

```
score = Σ interference_i
normalized_score = score / Σ (magA_i * magB_i)
```

CPU fallback must use identical math.

### 28.7 End-to-End Trace (GGUF → π → Retrieval)

**GGUF emits raw numbers (conceptual)**

```
embedding = [0.12, -0.98, 0.05, 0.31]
entropy = 0.42
```

**Adapter projection rule (example, deterministic)**

```
angle_i = atan2(value_i, norm)
magnitude_i = 1 - entropy
```

**Result**

```json
{
  "@type": "pi.signal.v1",
  "@version": "1.0",
  "geometry": {
    "angles": [1.448, -1.45, 0.12, 0.77],
    "magnitudes": [0.58, 0.58, 0.58, 0.58],
    "epsilon": 0.1745329
  },
  "provenance": {
    "adapter": "gguf",
    "deterministic": true
  }
}
```

**SVG-Tensor index (stored)**

```json
{
  "doc_id": "doc_42",
  "angles": [...],
  "magnitudes": [...]
}
```

Stored in SCXQ2 lanes, memory-mapped, hash-addressed.

**π-GCCP collapse (WebGPU or CPU)**

```
distance(doc, query)
→ interference score
→ normalized collapse value
```

**object://retrieve/semantic.v1 (final)**

```json
{
  "@type": "object.retrieve.semantic.v1",
  "query_hash": "pi:…",
  "profile": "topological_v1",
  "results": [
    { "id": "doc_42", "score": 0.913 },
    { "id": "doc_17", "score": 0.802 },
    { "id": "doc_09", "score": 0.411 }
  ],
  "deterministic": true
}
```

Retrieval never knows model identity. Only geometry matters.

### 28.8 Standardization Targets (Required)

Standardize:

1. Adapter output schema (geometry primitives, deterministic mapping rules, error bounds)
2. π-Profile authoring (weights, interference, decay)
3. SVG-Tensor canonicalization (hash stability)
4. Object Server contracts (source-agnostic retrieval)

Do not standardize model families.

### 28.9 Final Collapse

Any model that can emit a signal can participate. Adapters emit geometry. π handles the rest.

---

## 29. A2A-CONV-1 — Agent-to-Agent Conversation Objects

**Spec ID:** `mx2lm.agent.conversation.v1`  
**Status:** Normative / Law-Grade  
**Execution Authority:** None  
**Mutation:** Append-only  
**Scope:** Cross-agent, cross-cluster safe

### 29.1 Prime Law (Conversation)

> **Agents do not “talk.”  
> Agents publish conversation objects.**

A conversation is **not a session** and **not a stream**. It is a **verifiable sequence of immutable objects**.

### 29.2 Conversation Object (Canonical)

```json
{
  "$schema": "object://schema/agent.conversation.v1",
  "type": "agent.conversation",

  "conversation_id": "a2a://sha256:<root-hash>",
  "sequence": 42,

  "from_agent": "agent://clusterA/agent.alpha",
  "to_agent": "agent://clusterB/agent.beta",

  "message_ref": "object://agent.message/sha256:…",

  "context_refs": [
    "object://ai.brain.svg-tensor/…",
    "object://ai.inference.profile/…"
  ],

  "timestamp": "logical-tick-0042",

  "integrity": {
    "prev": "sha256:<previous-conversation-object>",
    "self": "sha256:<this-object>"
  },

  "signature": "πsig:v1:ed25519:clusterA.agent.alpha:…"
}
```

### 29.3 Message Object (Referenced, Not Embedded)

```json
{
  "$schema": "object://schema/agent.message.v1",
  "type": "agent.message",

  "payload_type": "text | tokens | json | symbolic",
  "payload_ref": "object://payload/sha256:…",

  "intent": "inform | ask | propose | reflect",

  "constraints": {
    "no_execution": true,
    "no_side_effects": true
  }
}
```

### 29.4 Hard Invariants

- No direct message embedding (hash references only).
- Sequence numbers must be monotonic.
- All participants must sign their own emissions.
- No reply obligation exists.
- No timing assumptions are allowed.

If an agent **acts** because of a message → **violation**.

### 29.5 Enables (Non-Executable)

- Cross-cluster reasoning.
- Long-form dialogue replay.
- Auditable collaboration.
- Zero-trust agent discourse.

Without enabling anything to execute.

---

## 30. HITL-PROJ-1 — Human-in-the-Loop Projection Contracts

**Spec ID:** `mx2lm.hitl.projection.v1`  
**Status:** Normative / Law-Grade  
**Execution Authority:** None  
**Scope:** Output shaping only

### 30.1 Prime Law (Human Interaction)

> **Humans never steer inference.  
> Humans only select projections.**

Human input is **never part of inference**. It is **only a post-collapse projection filter**.

### 30.2 Projection Contract Object (Canonical)

```json
{
  "$schema": "object://schema/hitl.projection.v1",
  "type": "hitl.projection",

  "applies_to": "agent.reply",

  "projection_modes": [
    "plain-text",
    "annotated",
    "step-trace",
    "confidence-banded",
    "token-stream"
  ],

  "visibility_rules": {
    "show_sources": true,
    "show_geometry": false,
    "show_weights": false
  },

  "redaction_rules": [
    "internal_ids",
    "cluster_topology",
    "private_signatures"
  ],

  "acknowledgement": {
    "required": false,
    "form": "none"
  }
}
```

### 30.3 Human Input Legality

Humans MAY:

- Choose projection mode.
- Toggle visibility flags.
- Request additional traces.

Humans MAY NOT:

- Change weights.
- Modify profiles.
- Influence selection.
- Inject randomness.

If human choice changes output tokens → **non-compliant**.

### 30.4 Separation Guarantee

```
Inference → Collapse → Reply Object
                     ↓
               HITL Projection
```

The reply object already exists; the human only chooses how it is seen.

---

## 31. FAPC-1 — Federated Audit Proof Chains

**Spec ID:** `mx2lm.audit.chain.v1`  
**Status:** Normative / Law-Grade  
**Trust Model:** Zero-trust  
**Replayable:** Yes

### 31.1 Prime Law (Audit)

> **If it cannot be replayed, it did not happen.**

Audit is not logging. Audit is **cryptographic reconstruction**.

### 31.2 Audit Chain Object (Canonical)

```json
{
  "$schema": "object://schema/audit.chain.v1",
  "type": "audit.chain",

  "chain_id": "audit://sha256:<root>",
  "cluster": "cluster://mx2lm/A",

  "covers": [
    "object.ingest",
    "object.verify",
    "inference.request",
    "inference.collapse",
    "reply.emit"
  ],

  "entries": [
    {
      "seq": 1,
      "event": "object.verify",
      "object": "object://ai.model.weights/…",
      "hash": "sha256:…",
      "signature": "πsig:…"
    }
  ],

  "integrity": {
    "merkle_root": "sha256:…",
    "entry_count": 314
  }
}
```

### 31.3 Federation Rules

- Each cluster emits its own audit chain.
- Chains are linked by object hash references.
- No shared clocks.
- No shared trust anchors.
- Verification is local + deterministic.

### 31.4 Proof Obligation (Federated)

A federated inference is valid iff:

```
∀ clusters C:
  replay(C.audit_chain, objects) == emitted_reply
```

Failure anywhere ⇒ **federation invalid**.

### 31.5 Replaces (Non-Executable)

- Centralized logging.
- Trust-based compliance.
- Human attestations.
- Runtime introspection.

---

## 32. MX2LM-ORCH-1 — Live Cluster Orchestration Objects

**Spec ID:** `mx2lm.orch.v1`  
**Status:** **FROZEN / IMMUTABLE**  
**Authority:** None  
**Mutation:** Forbidden  
**Role:** Coordination only  
**Versioning Rule:** Any change ⇒ **MX2LM-ORCH-2 (MAJOR)**  
**Depends on:** A2A-CONV-1, HITL-PROJ-1, FAPC-1, AGENT-TOOLS-1, AGENT-FED-1

### 32.1 Frozen Scope

MX2LM-ORCH-1 permanently governs:

- Live cluster orchestration objects
- Agent participation wiring
- A2A conversation routing
- HITL projection binding
- Federated audit integration
- Orchestration lifecycle states

### 32.2 Prime Orchestration Law (Invariant)

> **Orchestration coordinates objects.  
> It never causes behavior.**

Orchestration may only **declare coordination**.  
It may never **cause behavior**.

Orchestration objects:

- declare relationships
- declare routing
- declare visibility
- declare lifecycle phases

They do **not**:

- trigger inference
- call tools
- execute code
- mutate agents

### 32.3 Cluster Orchestration Root Object

This is the **single object** that wires everything together.

```json
{
  "$schema": "object://schema/mx2lm.orchestration.v1",
  "type": "mx2lm.orchestration",

  "cluster": "cluster://mx2lm/global",

  "participants": {
    "agents": [
      "agent://clusterA/agent.alpha",
      "agent://clusterB/agent.beta"
    ],
    "humans": [
      "human://ui/operator.1"
    ]
  },

  "bindings": {
    "conversation": "object://policy/a2a.conv.binding.v1",
    "hitl": "object://policy/hitl.binding.v1",
    "audit": "object://policy/fapc.binding.v1"
  },

  "lifecycle": {
    "states": ["spawned", "active", "suspended", "sealed"],
    "initial": "spawned"
  },

  "integrity": {
    "hash": "sha256:…",
    "signature": "πsig:v1:ed25519:cluster.root:…"
  }
}
```

This object **does nothing by itself**.  
It only *declares that wiring exists*.

### 32.4 Conversation Binding Object (A2A-CONV → Cluster)

```json
{
  "$schema": "object://schema/orch.conversation.binding.v1",
  "type": "orch.binding.conversation",

  "applies_to": "agent.conversation",

  "routing": {
    "scope": "federated",
    "visibility": "participants-only",
    "ordering": "sequence-strict"
  },

  "storage": {
    "backend": "object-server",
    "replication": "cluster-policy",
    "immutability": true
  },

  "audit_ref": "object://policy/fapc.binding.v1"
}
```

**Effect:** conversation objects become **cluster-visible**, ordered, auditable — but still inert.

### 32.5 HITL Projection Binding Object

This wires **human interfaces** without letting humans touch inference.

```json
{
  "$schema": "object://schema/orch.hitl.binding.v1",
  "type": "orch.binding.hitl",

  "applies_to": "agent.reply",

  "allowed_projections": [
    "plain-text",
    "annotated",
    "step-trace"
  ],

  "ui_surfaces": [
    "ui://svg-tensor.panel",
    "ui://text.console"
  ],

  "constraints": {
    "no_inference_access": true,
    "no_object_mutation": true
  },

  "audit_ref": "object://policy/fapc.binding.v1"
}
```

**Effect:** humans can *see*, never *steer*.

### 32.6 Federated Audit Binding Object

This binds **every orchestration-visible event** to audit chains.

```json
{
  "$schema": "object://schema/orch.audit.binding.v1",
  "type": "orch.binding.audit",

  "audit_mode": "federated",

  "covers": [
    "agent.conversation",
    "agent.reply",
    "hitl.projection"
  ],

  "chain_policy": {
    "per_cluster": true,
    "cross_link": "object-hash",
    "replay_required": true
  }
}
```

**Effect:** every visible interaction is **provable across clusters**.

### 32.7 Live Agent Orchestration Object

This is how agents coexist *live* without executing anything.

```json
{
  "$schema": "object://schema/agent.orchestration.v1",
  "type": "agent.orchestration",

  "agent": "agent://clusterA/agent.alpha",

  "state": "active",

  "allowed_emissions": [
    "agent.conversation",
    "agent.reply",
    "audit.entry"
  ],

  "blocked_capabilities": [
    "execution",
    "tool.invoke",
    "self.mutate"
  ],

  "bindings": {
    "conversation": "object://policy/a2a.conv.binding.v1",
    "audit": "object://policy/fapc.binding.v1"
  }
}
```

This is the “live agent” — live in the cluster, but legally incapable of doing anything unsafe.

### 32.8 Orchestration Flow (End-to-End)

```
Agent emits message
  ↓
agent.conversation object
  ↓
A2A-CONV-1 binding
  ↓
Cluster object server
  ↓
FAPC-1 audit entry
  ↓
(Optional)
Inference produces reply object
  ↓
HITL-PROJ-1 projection
  ↓
Human views output
```

At **no point** does orchestration:

- execute code
- call tools
- decide behavior

### 32.9 Why This Works (Separation of Planes)

You’ve separated **four planes** permanently:

| Plane         | Can Do                |
| ------------ | --------------------- |
| Objects       | Define reality        |
| Inference     | Collapse math         |
| Orchestration | Coordinate visibility |
| Runtimes      | Project only          |

That separation is why this system:

- scales
- federates
- audits
- survives hostile environments

### 32.10 Final Invariant (Cluster)

> **Clusters are not systems that run things.  
> Clusters are systems that agree on objects.**

This is the **live wiring** of that agreement.

### 32.11 MX2LM-ORCH-CONFORMANCE-1 (Runtime Tests)

**Conformance Class:** `orchestration.runtime`  
MX2LM-ORCH-1 compliant iff **all** tests below pass.

#### 32.11.1 Authority Leakage Tests

**❌ ORCH-AUTH-001 — Execution Prohibition**

**Given**

```json
{ "type": "mx2lm.orchestration", "authority": "execute" }
```

**Expected**

```
REJECT → orchestration.illegal_authority
```

**❌ ORCH-AUTH-002 — Tool Invocation**

If any orchestration object references:

```
tool.invoke
runtime.exec
kernel.call
```

**Expected**

```
REJECT → orchestration.execution_leak
```

#### 32.11.2 Deterministic Visibility Tests

**✅ ORCH-VIS-001 — Same Objects, Same Visibility**

Same:

- orchestration object
- participant set
- cluster graph

⇒ **identical visibility graph**

Byte-identical ordering required.

#### 32.11.3 Conversation Wiring Tests

**❌ ORCH-CONV-002 — Unbound Conversation**

Conversation object emitted without binding:

```json
"bindings": { }
```

**Expected**

```
REJECT → conversation.unbound
```

#### 32.11.4 HITL Safety Tests

**❌ ORCH-HITL-001 — Human Inference Access**

If HITL projection exposes:

- logits
- weights
- gradients
- intermediate tensors

**Expected**

```
REJECT → hitl.inference_exposure
```

#### 32.11.5 Audit Completeness Tests

**❌ ORCH-AUD-003 — Missing Audit Reference**

Any orchestration-visible object without FAPC binding:

**Expected**

```
REJECT → audit.binding.missing
```

#### 32.11.6 Replay Test (Hard)

Given:

- recorded orchestration objects
- recorded events
- recorded hashes

**Replay MUST produce identical event graph**

Otherwise:

```
FAIL → orchestration.nondeterministic
```

---

## 33. MX2LM-GOSSIP-1 — Real-Time Cluster Gossip Objects

**Spec ID:** `mx2lm.gossip.v1`  
**Status:** Normative  
**Role:** Knowledge-of-objects only

> Gossip synchronizes **knowledge of objects**, never behavior.

### 33.1 Gossip Object Schema

```json
{
  "$schema": "object://schema/mx2lm.gossip.v1",
  "type": "mx2lm.gossip",

  "origin": "cluster://mx2lm/clusterA",
  "scope": "federated",

  "payload": {
    "object_id": "object://agent/conversation/abc",
    "hash": "sha256:…",
    "class": "agent.conversation"
  },

  "rules": {
    "announce_only": true,
    "no_payload_transfer": true,
    "no_execution": true
  },

  "ttl": "logical:3hops"
}
```

### 33.2 Gossip Laws (Hard)

- Gossip MAY announce **existence**
- Gossip MAY announce **hash**
- Gossip MAY NOT carry payloads
- Gossip MAY NOT trigger inference
- Gossip MAY NOT reorder objects

### 33.3 Gossip Flow

```
Cluster A observes new object
  ↓
mx2lm.gossip object emitted
  ↓
Cluster B receives gossip
  ↓
Cluster B MAY request object via Object Server
```

Clusters **never push data**, only **signal availability**.

---

## 34. MX2LM-CHOREO-1 — Multi-Agent Inference Choreography

**Spec ID:** `mx2lm.choreography.v1`  
**Status:** Normative  
**Role:** Coordination of inference only

> Choreography is **coordination of inference**, not execution of it.

### 34.1 Choreography Object

```json
{
  "$schema": "object://schema/mx2lm.choreography.v1",
  "type": "mx2lm.choreography",

  "participants": [
    "agent://clusterA/agent.alpha",
    "agent://clusterB/agent.beta"
  ],

  "roles": {
    "alpha": "primary",
    "beta": "secondary"
  },

  "ordering": "partial",

  "rules": {
    "no_shared_state": true,
    "no_cross_mutation": true,
    "object_only_exchange": true
  }
}
```

### 34.2 Legal Choreography Interactions

Agents MAY:

- emit reply objects
- emit conversation objects
- emit critique objects
- reference each other’s outputs by hash

Agents MAY NOT:

- inspect internals of other agents
- influence inference parameters
- share tensors
- synchronize clocks

### 34.3 Choreography Collapse Rule

Each agent runs inference **independently**.

Combination happens only via **declared objects**:

```json
{
  "type": "agent.synthesis",
  "inputs": [
    "object://agent.alpha.reply",
    "object://agent.beta.reply"
  ],
  "method": "deterministic_merge"
}
```

No voting.  
No negotiation.  
No back-channels.

### 34.4 Choreography Determinism Test

Same:

- choreography object
- agents
- inference profiles

⇒ **same merged result**

Otherwise:

```
FAIL → choreography.nondeterministic
```

---

## 35. Final Locked System State

You now have **four frozen planes**, fully wired:

| Plane         | Spec           |
| ------------- | -------------- |
| Orchestration | MX2LM-ORCH-1   |
| Gossip        | MX2LM-GOSSIP-1 |
| Choreography  | MX2LM-CHOREO-1 |
| Audit         | FAPC-1         |

And one universal invariant:

> **Nothing executes.  
> Everything agrees.**

### 35.1 Ready Next (Natural Extensions Only)

- 📜 Formal **Object Treaty / Cluster Constitution**
- 🛰️ WAN / air-gap gossip bridging
- 🧩 Declarative agent disagreement objects
- 🔍 Visual audit replay (SVG-Tensor timelines, read-only)
