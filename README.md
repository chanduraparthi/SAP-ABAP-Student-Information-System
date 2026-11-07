# SAP ABAP Student Information & Academic Management System

A classic SAP ABAP module-pool application for maintaining student master data and academic marks in SAP ECC 6.0.

> **Development status:** This repository documents the current implementation. The database tables, table maintenance dialogs, module-pool program structure, dynpro screens, GUI statuses, title bars, and transaction code have been created. The Screen 0200 ALV display is currently under debugging, and SmartForm transcript generation is not yet complete. Features marked pending must not be considered tested or production-ready.

## Project overview

The application is designed to let users search student records and inspect academic results through a SAP GUI transaction.

### Technology

- SAP ECC 6.0
- ABAP (Module Pool / Dynpro)
- ABAP Dictionary (SE11)
- Table Maintenance Generator (SM30)
- SAP GUI Screen Painter (SE51)
- Menu Painter (SE41)
- OO ALV using `CL_GUI_ALV_GRID`
- SAP Smart Forms (planned / in progress)

## Repository structure

```text
.
├── README.md
├── docs/
│   ├── architecture.md
│   ├── database-design.md
│   ├── implementation-status.md
│   └── testing.md
├── src/
│   └── README.md
└── screenshots/
    └── README.md
```

## Data model

### `ZSTU_MASTER`

| Field | Purpose |
|---|---|
| MANDT | SAP client |
| ROLLNO | Student roll number (key) |
| FIRSTNAME | First name |
| LASTNAME | Last name |
| COURSE | Course / department |
| GENDER | Gender code |
| EMAIL | Email address |

### `ZSTU_MARKS`

| Field | Purpose |
|---|---|
| MANDT | SAP client |
| ROLLNO | Student roll number (key; foreign key to `ZSTU_MASTER`) |
| SEMESTER | Semester number (key) |
| TOT_MARKS | Marks obtained |
| MAX_MARKS | Maximum marks |
| ATT_PCT | Attendance percentage |
| ZRESULT | Result |

## ABAP objects created

| Object | Description |
|---|---|
| `Z_STUDENT_MAJOR_PROG` | Main module-pool program |
| `Z_STUDENT_TOP` | Global declarations and event-handler definition |
| `Z_STUDENT_SEL` | PBO / PAI modules |
| `Z_STUDENT_F01` | Forms and event-handler implementation |
| Screen `0100` | Student search screen |
| Screen `0200` | Academic records screen with custom control `MY_CONTAINER` |
| GUI statuses `S100`, `S200` | Screen-specific function statuses |
| Title bars `T100`, `T200` | Screen titles |
| Transaction `ZSTUDENT_APP` | Starts screen 0100 |
| `ZFG_STUDENT` | Table maintenance function group for student master |
| `ZFG_STUMARKS` | Table maintenance function group for marks |

## Current implementation status

See [docs/implementation-status.md](docs/implementation-status.md) for the detailed status and known issues.

## Running the project

This project was developed in a SAP ECC 6.0 training system. It is not a standalone application. To reproduce it, create/transport the Dictionary objects, ABAP module pool, dynpro screens, GUI statuses, and transaction in an SAP system with the required authorizations.

The source files for the ABAP objects will be added under `src/` after export from the SAP system. Screen and runtime evidence will be added under `screenshots/`.

## Security and data

- Do not commit SAP passwords, connection details, access tokens, or other credentials.
- Use synthetic student data in screenshots and examples.
- Do not publish real student personal information.

## Author

Chandu Raparthi

## License

No license has been added yet. All rights remain with the author unless a license is added.
