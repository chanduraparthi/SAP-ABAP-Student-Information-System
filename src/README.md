# ABAP source package

All standalone reports use the custom Dictionary tables `ZSTU_MASTER` and `ZSTU_MARKS`. The source filenames use the project prefix `zch_` to distinguish this implementation.

## Standalone Core ABAP reports

| File | SAP executable program | Purpose |
|---|---|---|
| `zch_student_insert.abap` | `ZCH_STUDENT_INSERT` | Insert student master data |
| `zch_student_search.abap` | `ZCH_STUDENT_SEARCH` | Search one student or list all |
| `zch_student_update.abap` | `ZCH_STUDENT_UPDATE` | Update student details |
| `zch_student_delete.abap` | `ZCH_STUDENT_DELETE` | Delete student and related marks |
| `zch_student_validate.abap` | `ZCH_STUDENT_VALIDATE` | Basic input validation |
| `zch_student_reusable_validate.abap` | `ZCH_STUDENT_REUSABLE_VALIDATE` | Reusable FORM validation |
| `zch_student_modular.abap` | `ZCH_STUDENT_MODULAR` | Modularization with FORM routines |
| `zch_student_oop.abap` | `ZCH_STUDENT_OOP` | Local class and methods |
| `zch_student_alv.abap` | `ZCH_STUDENT_ALV` | ALV Grid report |
| `zch_student_count.abap` | `ZCH_STUDENT_COUNT` | Count student records |
| `zch_student_params.abap` | `ZCH_STUDENT_PARAMS` | PARAMETERS and SELECT-OPTIONS |
| `zch_student_marks_report.abap` | `ZCH_STUDENT_MARKS_REPORT` | Semester-wise academic records |
| `zch_student_mgmt.abap` | `ZCH_STUDENT_MGMT` | Combined demonstration |

## Advanced module-pool sources

The original academic-management module pool and its screen design are documented in the root README and `docs/`. Its SAP object names are retained from the existing project design pending a coordinated rename of the dynpros, transaction and GUI objects.

## Dependencies and validation

- Master table: `ZSTU_MASTER`
- Academic table: `ZSTU_MARKS`
- Result field currently documented: `ZRESULT`

These sources have not yet been activated or syntax-checked in the target ECC system. Check the target release, table definitions and program attributes before activation. Use only synthetic student data.
