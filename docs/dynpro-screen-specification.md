# Dynpro screen specification

## Module pool objects
- Main program: `Z_STUDENT_MAJOR_PROG` (program type M)
- Includes: `Z_STUDENT_TOP`, `Z_STUDENT_SEL`, `Z_STUDENT_F01`
- Screen 0100: search / print / exit
- Screen 0200: student OO ALV
- Screen 0200 custom control: `MY_CONTAINER`

## Screen 0100
Create input fields `GV_ROLLNO` and `GV_COURSE`. Add pushbuttons with function codes `SEARCH`, `PRINT`, `EXIT`. Assign `GV_OK_CODE` as the OK-code field.

Flow logic:
```abap
PROCESS BEFORE OUTPUT.
  MODULE status_0100.
PROCESS AFTER INPUT.
  MODULE user_command_0100.
```

Create GUI status `S100` and title bar `T100`.

## Screen 0200
Add a Custom Control named exactly `MY_CONTAINER`.

Flow logic:
```abap
PROCESS BEFORE OUTPUT.
  MODULE status_0200.
  MODULE display_alv_grid.
PROCESS AFTER INPUT.
  MODULE user_command_0200.
```

Create GUI status `S200` with BACK and EXIT function codes, and title bar `T200`.

## Transaction
Create transaction `ZSTUDENT_APP` in SE93 as a dialog transaction that starts program `Z_STUDENT_MAJOR_PROG`, screen 0100.

Dynpros, GUI statuses, title bars and transactions are SAP repository objects. These instructions are not substitutes for creating and activating those objects in SAP.
