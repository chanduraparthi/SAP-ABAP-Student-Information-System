# Architecture

## Application flow

1. Transaction `ZSTUDENT_APP` starts module pool `Z_STUDENT_MAJOR_PROG` at screen 0100.
2. Screen 0100 accepts a roll number and/or course search criterion.
3. The PAI module `USER_COMMAND_0100` routes the SEARCH action to `FORM search_students`.
4. The search form reads matching entries from `ZSTU_MASTER` into `GT_STUDENTS`.
5. The application calls screen 0200.
6. Screen 0200 is designed to host an OO ALV grid in custom control `MY_CONTAINER`.
7. The ALV double-click handler is designed to read semester marks from `ZSTU_MARKS` and show them in a dialog ALV.
8. The PRINT action is designed to call a SmartForm transcript.

## Main program structure

```abap
PROGRAM z_student_major_prog.

INCLUDE z_student_top.
INCLUDE z_student_sel.
INCLUDE z_student_f01.
```

## Dynpro flow

### Screen 0100

```abap
PROCESS BEFORE OUTPUT.
  MODULE status_0100.
PROCESS AFTER INPUT.
  MODULE user_command_0100.
```

### Screen 0200

```abap
PROCESS BEFORE OUTPUT.
  MODULE status_0200.
PROCESS AFTER INPUT.
  MODULE user_command_0200.
```

## Important implementation note

The ALV flow is not yet verified end-to-end. The intended design is documented here, but the current Screen 0200 runtime still shows a blank grid and requires debugging.
