# SAP rebuild checklist

This repository is designed to preserve source and project documentation outside the short-lived SAP practice environment. It is not a transport request or one-click installer.

## Dictionary objects
- Domain `ZDM_ROLLNO`, CHAR 10
- Data element `ZDE_ROLLNO`
- Transparent table `ZSTU_MASTER`
- Transparent table `ZSTU_MARKS`
- Foreign key from marks to student master

See [database setup](phase-1-database-setup.md).

## Core reports
Create executable programs in SE38 using the matching source files under `src/zch_*.abap`. Activate one at a time. Test CRUD programs only with synthetic records in a development client.

## Module pool
1. Create program `Z_STUDENT_MAJOR_PROG` (type M).
2. Create the three includes and copy their matching source files.
3. Create screens 0100 and 0200 using the dynpro specification.
4. Create GUI statuses `S100`, `S200` and title bars `T100`, `T200`.
5. Add custom control `MY_CONTAINER` on screen 0200.
6. Create transaction `ZSTUDENT_APP` in SE93.
7. Build and activate the SmartForm using the documented interface.

## Final verification
- Activate all Dictionary and program objects.
- Execute insert, search, update and delete using disposable test records.
- Verify ALV columns and double-click marks popup.
- Preview a transcript with multiple semester rows.
- Capture real SAP GUI screenshots only after successful execution.
- Update implementation status to distinguish completed, pending and failed tests.

The ABAP source templates have not been syntax-checked against the user's expired SAP system. Release-specific corrections may be needed in a fresh ECC environment.
