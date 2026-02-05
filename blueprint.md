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

**Source:** distilled from `todo.md` to provide an actionable, high-signal blueprint for implementation and design reviews.
