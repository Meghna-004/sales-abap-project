# sales-abap-project
# 📊 Sales Analytics Report (SAP ABAP)

## 📌 Overview

This project implements a simple sales analytics system using SAP ABAP in Eclipse ADT. It demonstrates how structured data can be stored, transformed, and analyzed using a layered approach involving a database table, CDS view, and ABAP logic.

The objective is to convert raw sales records into meaningful analytical output.

---

## ❗ Problem Statement

Raw transactional data does not directly provide insights for analysis. The goal of this project is to:

* Store sales data in a structured format
* Apply business logic to compute key metrics
* Present results in a clear and readable report

---

## ⚙️ Core Features

* Custom database table (`ZSALES`) for persistent storage
* Programmatic generation of sample sales data (40 records)
* CDS View (`ZC_SALES`) for data abstraction
* Business calculations:

  * Total Amount = Quantity × Price
  * Discount = 10%
  * Net Amount = Total − Discount
* Sorting of sales data based on highest net value
* Structured console-based reporting
* Separation of data generation and reporting logic

---

## 🏗️ Architecture

```text id="56pdrx"
Database Layer   → ZSALES (Custom Table)
Data Layer       → ZC_SALES (CDS View)
Application Layer→ ABAP Classes (Logic & Reporting)
```

---

## 🛠️ Technologies Used

* SAP ABAP (Eclipse ADT)
* Open SQL
* Core Data Services (CDS)
* Custom Transparent Table

---

## 📊 Output

The application generates a structured sales report displaying:

* Sales ID
* Customer Name
* Product
* Region
* Net Sales Amount

It also includes:

* Total number of records
* Aggregated net sales value

---

## 🚀 Future Improvements

* ALV Grid for interactive reporting
* Filtering and sorting options
* Parameterized report execution
* Integration with SAP Fiori UI
* Expansion of dataset for deeper analytics

---

## ✨ Highlights

* End-to-end data pipeline (DB → CDS → ABAP)
* Dynamic data generation instead of static entries
* Clean separation of responsibilities
* Use of CDS for better data modeling
* Structured and readable output formatting

---

## 👩‍💻 Author

Arpita Paul (23052311)
