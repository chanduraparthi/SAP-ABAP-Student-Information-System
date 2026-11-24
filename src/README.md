# ABAP Programs

The programs in this folder are part of my Student Information & Academic Management System.

| File name | Program name | Purpose |
|---|---|---|
| `zch_student_insert.abap` | `ZCH_STUDENT_INSERT` | Add a student |
| `zch_student_search.abap` | `ZCH_STUDENT_SEARCH` | Search or display students |
| `zch_student_update.abap` | `ZCH_STUDENT_UPDATE` | Update student details |
| `zch_student_delete.abap` | `ZCH_STUDENT_DELETE` | Delete a student |
| `zch_student_validate.abap` | `ZCH_STUDENT_VALIDATE` | Validate student details |
| `zch_student_reusable_validate.abap` | `ZCH_STUDENT_REUSABLE_VALIDATE` | Reusable validation routine |
| `zch_student_modular.abap` | `ZCH_STUDENT_MODULAR` | Modular programming |
| `zch_student_oop.abap` | `ZCH_STUDENT_OOP` | Local class and methods |
| `zch_student_alv.abap` | `ZCH_STUDENT_ALV` | ALV report |
| `zch_student_count.abap` | `ZCH_STUDENT_COUNT` | Student record count |
| `zch_student_params.abap` | `ZCH_STUDENT_PARAMS` | Parameters and select-options |
| `zch_student_marks_report.abap` | `ZCH_STUDENT_MARKS_REPORT` | Semester-wise marks |
| `zch_student_mgmt.abap` | `ZCH_STUDENT_MGMT` | Combined report |

The reports use the tables `ZSTU_MASTER` and `ZSTU_MARKS`. Create these tables in SE11 before running the programs. Their field details are available in [Database Design](../docs/database-design.md).

The module-pool program is kept separately because it also uses screens, GUI statuses and a transaction code.
