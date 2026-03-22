## Storage Systems

To build an AI-powered data system with four goals of a hospital architecture, I selected different storage systems because each goal has different data and performance needs.

For **predicting patient readmission risk**, **data lake/lakehouse** and the **relational data warehouse (OLAP)** is used. The lakehouse stores raw and cleaned historical treatment data from EHR, labs, and billing systems. The warehouse stores structured and reporting-ready data that can be used for model features and business analysis. This is useful because machine learning models need large volumes of historical data, but also benefit from cleaned and organized datasets.

For **natural language doctor queries on patient history**, I would use a **vector database**. Patient notes, discharge summaries, event history, and clinical text can be converted into embeddings and stored in the vector database. This allows semantic search, so a question like “Has this patient had a cardiac event before?” can return relevant meaning-based results rather than just exact keyword matches.

For **monthly management reports(bed occupancy, costs)** such as bed occupancy and department-wise costs, I would use a **relational data warehouse**. This is the best choice for OLAP-style reporting because it supports structured schemas, aggregation, trends, and dashboard queries efficiently.

For **real-time ICU vitals**, I would use a **time-series database** along with **real-time ingestion**. ICU devices generate continuous streams of timestamped data, and a time-series database is better than a normal relational database for storing and querying this kind of fast, frequent sensor data.

## OLTP vs OLAP Boundary

In this design, the **transactional system (OLTP)** ends at the hospital’s operational systems such as **EHR/EMR, lab systems, billing systems, and ICU monitoring systems**. These systems are responsible for recording day-to-day transactions such as diagnoses, medication updates, lab entries, admissions, discharges, and billing activity.

The **analytical system (OLAP)** begins after data is extracted through batch ETL or real-time ingestion pipelines and moved into the **lakehouse, warehouse, vector database, and time-series database**. At this stage, the purpose changes from running hospital operations to supporting analytics, AI, reporting, and decision-making.

Thus, OLTP is where the hospital runs its daily work, and OLAP is where the hospital analyzes that data for insights, forecasting, semantic search, and management reporting.

## Trade-offs

In this design, the **transactional system (OLTP)** ends at the hospital’s operational systems such as **EHR/EMR, lab systems, billing systems, and ICU monitoring systems**. These systems are responsible for recording day-to-day transactions such as diagnoses, medication updates, lab entries, admissions, discharges, and billing activity.

The **analytical system (OLAP)** begins after data is extracted through batch ETL or real-time ingestion pipelines and moved into the **Data lakehouse, warehouse, vector database, and time-series database**. At this stage, the purpose changes from running hospital operations to supporting analytics, AI, reporting, and decision-making.

So, in simple terms, OLTP is where the hospital runs its daily work, and OLAP is where the hospital analyzes that data for insights, forecasting, semantic search, and management reporting.
