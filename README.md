# Chandu's SAP ABAP Student Information & Academic Management System

A classic SAP ECC 6.0 student management project built around ABAP Dictionary, Open SQL, modular programming, local classes, ALV reporting and a module-pool application.

> **Project status:** This repository contains ABAP source templates and build documentation. The source has not yet been activated or syntax-tested in the user's current SAP system. SAP GUI screens, GUI statuses, SmartForms and runtime screenshots must be recreated or verified in a live SAP system before they are marked complete.

## Project features

### Core ABAP program suite

| Feature | Program |
|---|---|
| Insert student | `ZCH_STUDENT_INSERT` |
| Search / display all | `ZCH_STUDENT_SEARCH` |
| Update student | `ZCH_STUDENT_UPDATE` |
| Delete student and dependent marks | `ZCH_STUDENT_DELETE` |
| Basic input validation | `ZCH_STUDENT_VALIDATE` |
| Reusable validation routine | `ZCH_STUDENT_REUSABLE_VALIDATE` |
| Modular programming | `ZCH_STUDENT_MODULAR` |
| Object-oriented ABAP | `ZCH_STUDENT_OOP` |
| ALV report | `ZCH_STUDENT_ALV` |
| Student count | `ZCH_STUDENT_COUNT` |
| Parameters and selection options | `ZCH_STUDENT_PARAMS` |
| Semester-wise marks report | `ZCH_STUDENT_MARKS_REPORT` |
| Combined demonstration | `ZCH_STUDENT_MGMT` |

### Advanced academic management application

The larger project design includes:
- Student master data and semester-wise academic records
- Search by roll number / course
- OO ALV display using `CL_GUI_ALV_GRID`
- Double-click navigation to semester marks
- Official transcript preview using SAP Smart Forms
- Module-pool screens and transaction code

## Technology

- SAP ECC 6.0
- Classic ABAP / Open SQL
- ABAP Dictionary (SE11)
- SAP GUI Screen Painter (SE51)
- Menu Painter (SE41)
- Table Maintenance Generator (SE54 / SM30)
- ALV Grid / Control Framework
- Smart Forms

## Repository layout

```text
.
├── README.md
├── src/
│   ├── zch_student_insert.abap
│   ├── zch_student_search.abap
│   ├── zch_student_update.abap
│   ├── zch_student_delete.abap
│   ├── zch_student_validate.abap
│   ├── zch_student_reusable_validate.abap
│   ├── zch_student_modular.abap
│   ├── zch_student_oop.abap
│   ├── zch_student_alv.abap
│   ├── zch_student_count.abap
│   ├── zch_student_params.abap
│   ├── zch_student_marks_report.abap
│   ├── zch_student_mgmt.abap
│   └── module-pool source files
├── docs/
│   ├── architecture.md
│   ├── database-design.md
│   ├── core-abap-program-catalog.md
│   ├── phase-1-database-setup.md
│   ├── dynpro-screen-specification.md
│   ├── smartform-specification.md
│   ├── rebuild-checklist.md
│   ├── sap-object-inventory.md
│   ├── erd.md
│   └── testing.md
└── screenshots/
    └── README.md
```

## Database design

The application uses two client-dependent transparent tables:

- `ZSTU_MASTER`: student roll number, name, course, gender and email.
- `ZSTU_MARKS`: roll number, semester, marks obtained, maximum marks, attendance percentage and result.

The roll number is represented by `ZDE_ROLLNO` based on `ZDM_ROLLNO`. The child table's foreign key points to the student master. See [database design](docs/database-design.md) and [ER diagram](docs/erd.md).

## Getting started

1. Read [the database setup guide](docs/phase-1-database-setup.md).
2. Confirm the active Dictionary definitions in the target SAP system.
3. Copy the required report source from `src/` into matching executable programs in SE38 / SE80.
4. Activate and test each report using synthetic records.
5. Follow the [module-pool rebuild checklist](docs/rebuild-checklist.md) for screens, statuses, transaction and SmartForm objects.
6. Capture genuine SAP GUI screenshots and add them under `screenshots/`.

## Important notes

- These files are source templates, not a transport request or automatic installer.
- Classic SAP repository objects such as transparent tables, dynpros, GUI statuses and SmartForms must be created in SAP.
- The standalone CRUD reports change database data. Test only in a development client with synthetic data.
- Never commit credentials or real student personal information.
- Do not label a feature as tested until it has been activated and executed successfully in SAP.

## Author

**Chandu Raparthi**
