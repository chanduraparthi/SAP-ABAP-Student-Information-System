# Project Setup

Follow these steps to create the project objects in SAP.

## 1. Create the database tables

Create the roll-number domain and data element, then create the transparent tables:

- `ZSTU_MASTER`
- `ZSTU_MARKS`

Set the foreign key from `ZSTU_MARKS-ROLLNO` to `ZSTU_MASTER-ROLLNO`. Refer to [Phase 1: Database Setup](phase-1-database-setup.md).

## 2. Create the ABAP reports

Open SE38 and create the programs listed in [the ABAP program catalogue](core-abap-program-catalog.md). Copy the matching source from the `src/` folder and activate the program.

## 3. Create the module pool

Create `Z_STUDENT_MAJOR_PROG` as a module-pool program. Add the includes `Z_STUDENT_TOP`, `Z_STUDENT_SEL` and `Z_STUDENT_F01`.

Create screens 0100 and 0200 using the [Dynpro Screen Specification](dynpro-screen-specification.md). Add the GUI statuses, title bars and custom control described there.

## 4. Create the transaction

In SE93, create transaction `ZSTUDENT_APP` and connect it to program `Z_STUDENT_MAJOR_PROG`, screen 0100.

## 5. Create the transcript form

Create `Z_STUDENT_TRANSCRIPT_FORM` in Smart Forms using the fields described in the [SmartForm Specification](smartform-specification.md).

## 6. Test the programs

Use sample student records to try the insert, search, update, delete, validation and ALV reports. Check the semester-wise marks and transcript output as well.
