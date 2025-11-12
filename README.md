# Assignment_3_DB 
# E-commerce Data Warehouse

---


## Architecture
```
RAW (JSON)  →  STAGE (Normalized)  →  MART (Star Schema)
  3 tables        4 tables                1 fact + 3 dimensions
```

<img width="657" height="352" alt="Знімок екрана 2025-11-12 о 17 17 35" src="https://github.com/user-attachments/assets/eb19e6a9-a8f7-46c7-bc5b-4ecae793f7c3" />

---

## Design Decisions

3-layer data warehouse (RAW → STAGE → MART) for e-commerce data

- **raw**: Preserve original JSON data (source of truth)
- **stage**: Parse JSON once, reuse for multiple MART tables (efficiency)
- **mart**: Star schema optimized for analytics (performance)


## Data Model

**Star Schema:**
```
date_dimension ─┐
                ├─ day_fact ─ product_dimension
channel_dimension ─┘
```

**Fact:** `day_fact` (grain: day × product × channel)  
**Measures:** quantity, revenue, orders



