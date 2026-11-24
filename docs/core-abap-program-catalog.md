# Core ABAP program catalogue

This repository includes a Core ABAP practice suite alongside the Student Information & Academic Management module-pool project.

## Learning sequence

1. Parameters and selection screens: `ZCH_STUDENT_PARAMS`
2. Read operations: `ZCH_STUDENT_SEARCH`
3. Create operation: `ZCH_STUDENT_INSERT`
4. Update operation: `ZCH_STUDENT_UPDATE`
5. Delete operation: `ZCH_STUDENT_DELETE`
6. Validation: `ZCH_STUDENT_VALIDATE`
7. Reusable FORM routine: `ZCH_STUDENT_REUSABLE_VALIDATE`
8. Modularization: `ZCH_STUDENT_MODULAR`
9. Local class / methods: `ZCH_STUDENT_OOP`
10. ALV output: `ZCH_STUDENT_ALV`
11. Aggregate query: `ZCH_STUDENT_COUNT`
12. Academic records: `ZCH_STUDENT_MARKS_REPORT`
13. Combined demonstration: `ZCH_STUDENT_MGMT`

## Table dependencies

- Student master data: `ZSTU_MASTER`
- Semester marks: `ZSTU_MARKS`

The table definitions are documented in [database-design.md](database-design.md).

## Data safety

The insert, update and delete reports change database records. Use a development client and synthetic data. The delete report removes dependent semester rows before deleting the master record. Test it only with disposable records and confirm the foreign-key design in SE11.
