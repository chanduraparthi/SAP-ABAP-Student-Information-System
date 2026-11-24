# Database design

This document records the database design for the SAP ECC 6.0 Student Information & Academic Management System. It follows the supplied major-project specification while preserving the field name already documented for the existing SAP table.

## Design decision: result field name

The supplied project brief names the marks status field `RESULT`. The existing repository's implementation notes name the created field `ZRESULT`. To avoid silently changing an existing SAP Dictionary object, this repository uses **`ZRESULT` as the current SAP object name**. If the active table in the SAP system actually contains `RESULT`, update the source and documentation consistently before importing any code. Do not create both fields.

## Relationship

- Parent / check table: `ZSTU_MASTER`
- Child / foreign-key table: `ZSTU_MARKS`
- Parent key: `MANDT + ROLLNO`
- Child key: `MANDT + ROLLNO + SEMESTER`
- Foreign-key mapping: `ZSTU_MARKS-MANDT -> ZSTU_MASTER-MANDT` and `ZSTU_MARKS-ROLLNO -> ZSTU_MASTER-ROLLNO`
- One student can have zero or many semester records; each marks record must refer to one student.

The roll-number fields use the same reusable data element `ZDE_ROLLNO`, based on domain `ZDM_ROLLNO` (CHAR 10). The foreign key itself is defined in the child table field maintenance in SE11; using the same domain alone does not create a relationship.

## ZSTU_MASTER — Student Master

| Field | Key | Dictionary type / definition | Meaning |
|---|---:|---|---|
| MANDT | Yes | Standard data element `MANDT`, CLNT 3 | SAP client |
| ROLLNO | Yes | `ZDE_ROLLNO`, domain `ZDM_ROLLNO`, CHAR 10 | Student roll number |
| FIRSTNAME | No | CHAR 30 | First name |
| LASTNAME | No | CHAR 30 | Last name |
| COURSE | No | CHAR 20 | Course / programme |
| GENDER | No | CHAR 1 | Gender code |
| EMAIL | No | CHAR 50 | Email address |

Primary key: `MANDT + ROLLNO`.

## ZSTU_MARKS — Academic Performance

| Field | Key | Dictionary type / definition | Meaning |
|---|---:|---|---|
| MANDT | Yes | Standard data element `MANDT`, CLNT 3 | SAP client |
| ROLLNO | Yes | `ZDE_ROLLNO`, domain `ZDM_ROLLNO`, CHAR 10 | Student roll number; foreign key |
| SEMESTER | Yes | NUMC 2 | Semester number |
| TOT_MARKS | No | INT4 | Marks obtained |
| MAX_MARKS | No | INT4 | Maximum marks |
| ATT_PCT | No | DEC 5,2 | Attendance percentage |
| ZRESULT | No | CHAR 10 | PASS / FAIL result status |

Primary key: `MANDT + ROLLNO + SEMESTER`.

## Dictionary object inventory

| Object | Type | Status recorded in repository |
|---|---|---|
| `ZDM_ROLLNO` | Domain, CHAR 10 | Previously reported activated by developer |
| `ZDE_ROLLNO` | Data Element | Existing design reference; verify in SE11 |
| `ZSTU_MASTER` | Transparent table | Previously recorded created; verify active version |
| `ZSTU_MARKS` | Transparent table | Previously recorded created; verify active version |
| `ZSTU_MARKS-ROLLNO` foreign key | Foreign-key relationship | Previously recorded created; verify mapping |

## Recommended technical settings

For both tables, use delivery class `A` (application data) and data maintenance/display as required by the training project. Choose the appropriate data class and size category according to the target SAP system's standards; do not assume these values replace the system's transport or database administration conventions. Keep the tables client-dependent with `MANDT` as the first key field.

## Integrity and validation notes

- Both tables must have the same client field and compatible roll-number definitions.
- In SE11, define the foreign key on `ZSTU_MARKS-ROLLNO` with `ZSTU_MASTER` as the check table and map the client field as well.
- The foreign-key relationship is an ABAP Dictionary relationship. It supports semantic documentation and classic screen input checks; do not describe it as a database-level constraint enforced by the underlying database.
- Use synthetic student records only in development and public screenshots.
- See [phase-1-database-setup.md](phase-1-database-setup.md) for the SE11 build and verification procedure.
