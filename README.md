# MyAnimeList-16M-ETL-Dashboard
Memory-safe ETL pipeline engineered in R (tidyverse/readr) to aggregate 16M+ interaction records on constrained local compute ($0 Cloud Cost). End-to-end data transformation to executive PDF dashboard.
🎬 MyAnimeList 16M+ Interactions Analytics Engine

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Tidyverse](https://img.shields.io/badge/Tidyverse-1A237E?style=for-the-badge&logo=R&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=Tableau&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

An **end-to-end, high-performance data pipeline** designed to ingest, clean, aggregate, and visualize **16 Million+ user interaction records** from MyAnimeList. Engineered with memory-safe streaming techniques, this pipeline executed on constrained local hardware with **$0 Cloud Infrastructure Cost ($0 OpEx)** and zero Out-of-Memory (OOM) failures.

---

## 📌 Executive Summary & Key Insights

Analyzing user consumption patterns across **16M+ records** reveals key behavioral dynamics for media streaming platforms, content recommendation engines, and licensing teams:

* **Massive Completion Bias (Retention Strength):** Over **34.77 Million total score points** and **398.89 Million episodes seen** belong to the `Completed` status. Users who complete series form the bedrock of engagement.
* **High-Risk Churn Zone (`Dropped` vs. `Watching`):** Total episodes consumed in the `Dropped` category (**22.23 Million episodes**) exceed the `Watching` category (**20.12 Million episodes**). Viewers decide to abandon content relatively late in their consumption cycle, indicating a critical window for re-engagement strategies.
* **Score Realism:** The linear progression between Total Score and Total Anime volume confirms consistent rating behavior across active users, validating user rating data for collaborative filtering and recommendation engines.

---

## 📊 Key Business & Operations Dashboard

| Metric / Category | Volume / Value | Business Impact |
| :--- | :--- | :--- |
| **Total Aggregated Score** | **36.25M Points** | Benchmark for platform content satisfaction. |
| **Total Tracked Anime Entries** | **5.46M Entries** | Unique user-item interaction scale. |
| **Completed Episode Volume** | **398.90M Episodes** | Primary driver of platform streaming bandwidth & retention. |
| **Dropped Episode Volume** | **22.23M Episodes** | Revenue leak & churn analysis target. |

---

## 💻 Hardware & Infrastructure Constraints ($0 OpEx Architecture)

Unlike standard big data pipelines that rely on expensive cloud compute clusters (e.g., AWS EMR, Databricks), this entire processing pipeline was engineered and executed locally without dedicated server infrastructure:

* **Processor:** Intel® Core™ i3 @ 1.20 GHz
* **Memory (RAM):** 4 GB Physical Memory
* **Storage / Execution:** Local Disk Streaming & In-Memory Chunk Processing
* **Cloud Infrastructure Cost:** **$0.00 (Zero OpEx)**
* **Pipeline Stability:** **0 Out-Of-Memory (OOM) Crashes**

---

## 🛠️ Data Pipeline & Technical Architecture

The project follows a rigorous 3-tier architecture:

[ Kaggle Raw Dataset ] ➔ [ R (tidyverse/readr) Memory-Safe ETL ] ➔ [ Aggregated CSV Output ] ➔ [ Tableau Visual Dashboard ]


### 1. Data Ingestion & Memory Optimization
* Utilized `readr::read_csv()` for stream-parsing the 16M+ row raw dataset directly into low-overhead data structures.
* Applied `distinct()` deduplication to eliminate duplicate user-interaction records.

### 2. Defensive Transformation & Filtering
* **Defensive Type-Casting:** Cleaned non-numeric characters (`'na'`) and safely cast `score`, `episodes_seen`, and `anime_id` to integers.
* **Anomaly Filtering:** Filtered for valid activity (`score > 0` & `episodes_seen > 0`) to remove inactive/unrated noise.

### 3. Aggregation & Export
* Grouped by user `status` (`Completed`, `Watching`, `Dropped`, `On-Hold`, `NA`) to compute `Total_Score`, `Total_Episodes_seen`, and `Total_Anime`.
* Exported clean, structured metrics into lightweight CSV format for visualization.

---

## 📁 Repository Structure

```text
├── Data/
│   └── New_dataset_Myanime_list_1.6B_data.csv   # Aggregated summary CSV output
├── Scripts/
│   └── ETL_Anime_Processing.R                    # Memory-optimized R transformation script
├── Dashboard/
│   └── New_dataset_Myanime_list_1.6B_data_dashboard.pdf  # Executive visual dashboard
└── README.md                                     # Project documentation
