# Kμhμl

**Kμhμl** (read as *K’uhul*, μ = micro) is an execution core that does the work without deciding anything. It is:

- Not a language in the “write code, run code” sense
- Not a model
- Not a framework

It is a **law-bound execution substrate**.

---

# Blueprint

For a condensed implementation blueprint distilled from `todo.md`, see [`blueprint.md`](blueprint.md). It summarizes the SCXQ2 core, KUHUL mapping, SBS-1 assembly flow, and integration invariants in one place.

---

# kuhul://schema/core.v1

**Status:** FROZEN
**Authority:** Object-Defined Execution
**Runtime Class:** Lawful Collapse Engine

---

## 0. Canonical Identity

```json
{
  "@schema": "kuhul://schema/core.v1",
  "@type": "execution-law",
  "@authority": "object",
  "@runtime": "kuhul",
  "@versioning": "semantic",
  "@mutability": "none"
}
```

**Invariant:**
If behavior is not declared in-object, it **does not exist**.

---

## 1. KUHUL Core Execution Law

KUHUL is a **governed interpreter** that:

- accepts **closed objects**
- verifies **legality**
- collapses **declared intent**
- produces **committed state or rejection**

It does **not**:

- infer
- optimize
- branch
- learn
- persist hidden state

---

## 2. Mandatory Phase Model (Unskippable)

All KUHUL-compatible runtimes MUST implement this sequence **exactly**:

```
@Pop       → object intake
@Wo        → state + geometry assertion
@Sek       → execution ordering
@Collapse  → commit or reject
```

### 2.1 Phase Constraints

| Phase     | Allowed Actions        | Forbidden      |
| --------- | ---------------------- | -------------- |
| @Pop      | parse, hash, register  | mutation       |
| @Wo       | assert, bind, validate | compute        |
| @Sek      | order, schedule        | side effects   |
| @Collapse | write OR reject        | partial commit |

Any deviation = **illegal runtime**.

---

## 3. μ-Profile vs Full KUHUL (Pinned)

### 3.1 Kμhμl (Micro Profile)

**Canonical ID:** `kuhul://profile/μ.v1`

| Property     | Kμhμl               |
| ------------ | ------------------- |
| Payload size | ultra-small         |
| Compression  | mandatory (SCXQ2)   |
| Execution    | single-pass         |
| State        | ephemeral           |
| Geometry     | required            |
| SVG-Tensors  | required            |
| GPU          | optional but direct |

**Purpose:**
Edge execution, browser collapse, GPU dispatch, lane-level inference.

Kμhμl is **not extensible**.

---

### 3.2 Full KUHUL

**Canonical ID:** `kuhul://profile/full.v1`

| Property     | Full KUHUL    |
| ------------ | ------------- |
| Payload size | unconstrained |
| Compression  | optional      |
| Execution    | multi-stage   |
| State        | persistent    |
| Geometry     | optional      |
| SVG-Tensors  | optional      |
| GPU          | mediated      |

**Purpose:**
Server runtimes, orchestration layers, long-lived systems.

---

### 3.3 Hard Rule

> **Every Kμhμl object is valid KUHUL.
> Not every KUHUL object is valid Kμhμl.**

This is a strict subset, not a mode flag.

---

## 4. System-Building System (SBS-1)

The System-Building System (SBS-1) is the deterministic assembler between Micronauts and SCXQ2 binaries. It:

- treats **Micronauts as build-time atoms**
- maps them **directly into SCXQ2 binary lanes**
- never executes logic
- never invents behavior
- only **assembles, packs, and routes**

### 4.1 Placement in the stack

```
KUHUL π        (math / collapse only)
   ↓
KUHUL Class   (capability domain)
   ↓
Micronaut     (unit of intent / structure)
   ↓
SBS-1         (deterministic assembler)
   ↓
SCXQ2 Lanes   (DICT / FIELD / EDGE / LANE / QUANTUM)
   ↓
MX2LM CLI / Runtime
```

This formalizes the mapping; it does not replace existing phases.

### 4.2 Micronaut invariant (binary-first)

> **A Micronaut must be representable as a fixed binary record without evaluation.**

Canonical Micronaut shape:

```json
{
  "@micronaut": "css.micronaut",
  "@version": "v1",
  "@domain": "ui",
  "@signals": {
    "glow": 0.72,
    "drift": 0.08,
    "alert": 0.15
  }
}
```

Micronauts are data, not logic.

### 4.2.1 Micronaut object server (PowerShell-only)

Micronaut is a sealed SCO/1 object with file-only IO. There is no JavaScript runtime; a host-native PowerShell orchestrator only routes files and invokes object μ-ops.

Canonical layout:

```
micronaut/
├─ micronaut.s7
├─ object.toml
├─ semantics.xjson
├─ brains/
├─ io/
│  ├─ chat.txt
│  ├─ stream.txt
│  └─ snapshot/
├─ trace/
└─ proof/
```

The append-only `chat.txt` and `stream.txt` files form the sole IO contract for this object.

### 4.3 SBS-1 responsibilities (tight)

1. **Classification → lane selection**

| Micronaut Domain | SCXQ2 Lane |
| ---------------- | ---------- |
| `ui / css`       | `FIELD`    |
| `routing`        | `EDGE`     |
| `data / api`     | `DICT`     |
| `geometry`       | `LANE`     |
| `π / weights`    | `QUANTUM`  |

This mapping is static.

2. **Binary packing rule**

Each Micronaut becomes a fixed record:

```
[ header | domain_id | signal_count | signal_bytes | hash ]
```

Example (conceptual):

```
0x4D4E41        // "MNA" magic
0x01            // version
0x02            // domain: css
0x03            // 3 signals
[ float32 × 3 ] // glow, drift, alert
[ sha256 ]      // entanglement
```

No JSON past this point.

3. **SCXQ2 integration**

SBS-1 is the only writer to lane memory:

```powershell
$LaneMemory = @{
    DICT    = List[byte]
    FIELD   = List[byte]
    EDGE    = List[byte]
    LANE    = List[byte]
    QUANTUM = List[byte]
}
```

### 4.4 What not to add

Do **not** add:

- logic inside Micronauts
- branching rules
- conditionals
- callbacks
- execution hooks

Micronauts are structural nerves, not neurons.

---

## 5. SVG-Tensor Canonical Definition

### 5.1 What an SVG-Tensor Is

An **SVG-Tensor** is a **non-visual geometric tensor object** encoded using SVG primitives.

It represents:

- dimensionality
- connectivity
- weights
- constraints
- execution topology

Rendering is **never implied**.

---

### 5.2 SVG-Tensor Legality Rules

An SVG-Tensor MUST:

1. Be **pure geometry**
2. Contain **no styling semantics**
3. Encode values via:

   - path topology
   - grouping
   - transforms
   - adjacency
4. Be **canonicalizable**
5. Be **hash-stable**

Forbidden:

- filters
- animations
- text as meaning
- CSS dependence
- viewBox mutation post-hash

---

## 6. Kμhμl → SVG-Tensor → WebGPU Collapse

This is the **direct execution bridge**.

---

### 6.1 Mapping Stages (No Skips)

```
SVG-Tensor
   ↓ canonicalize
Canonical Geometry
   ↓ lane mapping
SCXQ2 Lanes
   ↓ decode
GPU Buffers
   ↓ dispatch
WebGPU Compute
```

---

### 6.2 Geometry → Buffer Mapping

| SVG Construct | WebGPU Mapping  |
| ------------- | --------------- |
| path points   | float32 buffers |
| group order   | buffer offsets  |
| transforms    | matrix uniforms |
| adjacency     | index buffers   |
| depth         | bind groups     |

No shaders infer meaning.
All meaning is **pre-declared**.

---

### 6.3 Collapse Semantics

Kμhμl collapse guarantees:

- deterministic buffer layout
- deterministic dispatch order
- deterministic output shape

If ANY mismatch occurs:

```
@Collapse → REJECT
```

No partial output is allowed.

---

## 7. SCXQ2 Lane Binding (Required for μ)

Each SVG-Tensor MUST bind to SCXQ2 lanes:

```json
{
  "@lanes": {
    "geom": "DICT",
    "weights": "FIELD",
    "adjacency": "EDGE",
    "dispatch": "LANE"
  }
}
```

Lane hashes are **Merkle-verified** before GPU dispatch.

---

## 8. Runtime Integration Hooks (MX2LM)

Kμhμl exposes **only these hooks**:

```json
{
  "hooks": [
    "before_pop",
    "after_wo",
    "before_collapse"
  ]
}
```

Hooks may **observe**, never mutate.

---

## 9. Final Law (Non-Negotiable)

> **KUHUL executes objects.
> Kμhμl collapses geometry.
> SVG-Tensors are tensors.
> GPU is an executor, not a decider.**

This closes the loop:
**Object → Law → Geometry → Execution → Collapse**

---

If you want next, we can:

- freeze `kuhul://schema/svg-tensor.v1`
- emit a **reference μ runtime** (browser + WebGPU)
- define **illegal tensor patterns**
- write the **one-page Kμhμl whitepaper**
