# 🚲 ECOBICI — Bicycle Loan Service Database

> A relational database system designed to manage ECOBICI's bicycle loan service, supporting membership-based rentals and full administrative control over the fleet and operations.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Database Design](#database-design)
  - [Conceptual Model](#conceptual-model)
  - [Relational Model](#relational-model)
- [Scripts](#scripts)
- [Data Dictionary](#data-dictionary)
- [Entity-Relationship Diagram](#entity-relationship-diagram)
- [Technologies Used](#technologies-used)
- [How to Use](#how-to-use)

---

## Overview

This project is the final assignment for the **Database Fundamentals** course. It consists of a fully functional relational database built for **ECOBICI**, a public bicycle loan company that operates through a membership-based model.

The system is divided into two main modules:

| Module | Description |
|--------|-------------|
| 🚴 **Membership Service** | Handles user registration, active memberships, bicycle loans, and returns |
| 🛠️ **Administrative Module** | Manages the bicycle fleet, stations, staff, maintenance records, and service reporting |

---

## Project Structure

```
Proyecto-DB-EcoBici/
│
├── 📄 README.md
│
├── 📁 documentation/
│   ├── conceptual_model.png        # Conceptual (ER) diagram
│   ├── relational_model.jpg        # Relational schema
│   └── Proyecto-DB-EcoBici.pdf     # Full documentation in Spanish
│
└── 📁 scripts/
    ├── crearBase.sql        # Database and schema creation
    ├── seguridad.sql        # Users and privileges
    ├── cargaInicial.sql     # Sample data population
    ├── dml.sql              # Remaining inserts, views, and triggers
    └── informes.sql         # Functional queries
```

---

## Database Design

### Conceptual Model

The conceptual model was built using an **Entity-Relationship (ER)** diagram that identifies the main entities, their attributes, and the relationships between them.

### Relational Model

The relational model was derived from the conceptual design and defines all **tables**, **primary keys**, **foreign keys**, and **integrity constraints** that ensure data consistency across the system.

---

## Scripts

The project includes SQL scripts organized by function, compatible with **Microsoft SQL Server**:

| Script | Purpose |
|--------|---------|
| `crearBase.sql` | Creates the database and defines schemas |
| `seguridad.sql` | Defines all Users and privileges |
| `cargaInicial.sql` | Populates tables with sample/test data |
| `dml.sql` | Includes remaining inserts, views, and triggers |
| `informes.sql` | Includes representative queries for data retrieval and reporting |

---

## Data Dictionary

The **data dictionary** provides a detailed description of every table and column in the database, including:

- Column names and data types
- Constraints (PK, FK, NOT NULL, UNIQUE, etc.)
- Descriptions of what each field represents

📄 See [`documentation/Proyecto-DB-EcoBici.pdf`](./documentation/Proyecto-DB-EcoBici.pdf) for the full reference.

---

## Entity-Relationship Diagram

The following diagram was generated directly from **Microsoft SQL Server Management Studio (SSMS)** and reflects the final implemented structure of the database, including all relationships between tables.

> For a more detailed view, refer to the full documentation in the [`documentation/`](./documentation/) folder.

---

## Technologies Used

- **Microsoft SQL Server** — database engine

---

## How to Use

1. **Clone this repository:**
   ```bash
   git clone https://github.com/RedoMarshallX/Proyecto-DB-EcoBici.git
   cd Proyecto-DB-EcoBici
   ```

2. **Open SQL Server Management Studio (SSMS)** and connect to your local or remote SQL Server instance.

3. **Run the scripts in order:**
   ```
   crearBase.sql
   seguridad.sql
   cargaInicial.sql
   dml.sql
   informes.sql
   ```

4. **Explore the database** using the queries provided or by browsing the generated SSMS diagram.

---

## 📚 Academic Context

> **Course:** *Bases De Datos*
> **Institution:** *Universidad Nacional Autónoma De México - Facultad de Ingeniería*  
> **Semester:** *2024-2*  
> **Author:** *Isaias Rosas Meza*

---

*This project was developed for academic purposes as a final assignment demonstrating the design, implementation, and management of a relational database system.*
