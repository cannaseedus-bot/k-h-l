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

## 9. GGUF Embeddings via Object Server (Lawful Wiring)

**Invariant:** π-LM never consumes vectors. It consumes **retrieved context objects** prepared by the Object Server.

### 9.1 Canonical Object Types

**Embedding Vector Object** (`object://embedding/vector.v1`)

```json
{
  "@object": "embedding.vector",
  "@version": "v1",
  "@source": {
    "type": "gguf",
    "model": "Qwen3-VL-Embedding-2B",
    "path": "C:/public_html/MX2LM SERVER/QwenVLGGUF/Qwen.Qwen3-VL-Embedding-2B.Q2_K.gguf"
  },
  "@input": {
    "type": "text",
    "content": "hello world"
  },
  "@vector": {
    "dim": 1024,
    "values": []
  },
  "@hash": "sha256:..."
}
```

**Embedding Index Object** (`object://embedding/index.v1`)

```json
{
  "@object": "embedding.index",
  "@version": "v1",
  "@metric": "cosine",
  "@dim": 1024,
  "@entries": [
    {
      "@ref": "sha256:...",
      "@text": "π-LM uses deterministic collapse..."
    }
  ]
}
```

**Retrieved Context Object** (`object://context/retrieved.v1`)

```json
{
  "@object": "context.retrieved",
  "@version": "v1",
  "@query": "Explain π inference",
  "@results": [
    {
      "score": 0.92,
      "text": "π-LM generates text via low-rank geometry..."
    }
  ]
}
```

### 9.2 Provider Integration (GGUF Embedder)

The GGUF embedder outputs a **pure JSON embedding object** so the Object Server can ingest it directly.

```python
print(json.dumps({
    "@object": "embedding.vector",
    "@version": "v1",
    "@source": {
        "type": "gguf",
        "model": model_name
    },
    "@input": {
        "type": "text",
        "content": text
    },
    "@vector": {
        "dim": len(embedding),
        "values": embedding
    }
}))
```

### 9.3 Object Server Flow (Minimal)

1. **Embed input** to create `embedding.vector`.
2. **Store vectors** in `embedding.index`.
3. **Retrieve top-K** with cosine (or future geometry).
4. **Emit `context.retrieved`** and pass only text to π-LM.

### 9.4 π-LM Integration (Only Allowed Path)

π-LM consumes retrieved text context, never vectors:

```json
{
  "@pi.state": {
    "prompt": "Explain π inference",
    "retrieved_context": [
      "π-LM generates text via low-rank geometry...",
      "π schedules modulate attention, phase, and time..."
    ]
  }
}
```

**One-line summary:** GGUF embeddings are routed through the Object Server as external semantic objects; π-LM remains independent and consumes only retrieved context.

---

**Source:** distilled from `todo.md` to provide an actionable, high-signal blueprint for implementation and design reviews.
