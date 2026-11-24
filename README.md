# Student Information & Academic Management System

This is my SAP ABAP project for managing student details and academic records. I worked on it using SAP ECC 6.0 and classic ABAP concepts.

The project uses a student master table to store personal and course details, and a separate academic table to store semester-wise marks, attendance and results.

## Features

- Add, search, update and delete student records
- Validate student details
- Display student records using ALV
- View semester-wise academic performance
- Count student records
- Use modular programming and object-oriented ABAP
- Search students by roll number and course
- Prepare an academic transcript using SAP Smart Forms

## Technologies used

- SAP ECC 6.0
- SAP ABAP
- ABAP Dictionary (SE11)
- Open SQL
- SAP GUI Screen Painter (SE51)
- Menu Painter (SE41)
- Table Maintenance Generator
- ALV Grid
- SAP Smart Forms

## ABAP programs

| Program | Description |
|---|---|
| `ZCH_STUDENT_INSERT` | Add a student record |
| `ZCH_STUDENT_SEARCH` | Search and display student records |
| `ZCH_STUDENT_UPDATE` | Update student details |
| `ZCH_STUDENT_DELETE` | Delete a student record |
| `ZCH_STUDENT_VALIDATE` | Validate student inputs |
| `ZCH_STUDENT_REUSABLE_VALIDATE` | Reusable validation routine |
| `ZCH_STUDENT_MODULAR` | Modular programming example |
| `ZCH_STUDENT_OOP` | Object-oriented ABAP example |
| `ZCH_STUDENT_ALV` | Display student data in ALV |
| `ZCH_STUDENT_COUNT` | Count student records |
| `ZCH_STUDENT_PARAMS` | Selection screen example |
| `ZCH_STUDENT_MARKS_REPORT` | Display semester marks |
| `ZCH_STUDENT_MGMT` | Combined student management report |

## Database tables

### ZSTU_MASTER

Stores the student's roll number, name, course, gender and email address.

### ZSTU_MARKS

Stores the student's semester, marks obtained, maximum marks, attendance percentage and result. Each academic record is linked to a student through the roll number.

See [Database Design](docs/database-design.md) for the table fields and relationship.

## Main SAP objects

| Object | Purpose |
|---|---|
| `Z_STUDENT_MAJOR_PROG` | Main module-pool program |
| `Z_STUDENT_TOP` | Global declarations |
| `Z_STUDENT_SEL` | Screen PBO and PAI modules |
| `Z_STUDENT_F01` | Processing routines |
| Screen 0100 | Student search screen |
| Screen 0200 | Student ALV screen |
| `ZSTUDENT_APP` | Transaction code |
| `Z_STUDENT_TRANSCRIPT_FORM` | Student transcript Smart Form |

## Project structure

- `src/` contains the ABAP programs.
- `docs/` contains database design and SAP screen setup details.
- `screenshots/` contains screenshots of the project in SAP GUI.

## Running the project

Create the Dictionary tables in SE11 first. Then create the executable programs in SE38 using the source files in `src/`. The module-pool screens, GUI statuses, transaction and Smart Form are created separately in SAP GUI. The setup instructions are available in the `docs/` folder.

Use sample student records while testing the programs.

## Author

**Chandu Raparthi**
