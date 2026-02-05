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
