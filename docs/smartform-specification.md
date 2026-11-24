# SmartForm specification

## Form
- Form name: `Z_STUDENT_TRANSCRIPT_FORM`
- Purpose: official-looking academic transcript preview
- Driver routine: `FORM PRINT_TRANSCRIPT` in `Z_STUDENT_F01`

## Interface expected by driver
- Import parameter `IS_STUDENT`, type `ZSTU_MASTER`
- Table parameter `IT_MARKS`, line type `ZSTU_MARKS`

## Suggested layout
1. Header: institute name, optional approved logo, title "OFFICIAL ACADEMIC TRANSCRIPT".
2. Student details: roll number, first name, last name, course and email.
3. Semester table: semester, marks obtained, maximum marks, attendance percentage and result.
4. Footer: issue date and authorized signature placeholder. Add grading scale only when actual institution rules are known.

Use `SSF_FUNCTION_MODULE_NAME` to obtain the generated function module. Do not hard-code the generated function module name.

Activate and test the SmartForm in SAP. Verify that the interface parameter names exactly match the driver code. This file is a build specification, not an exported SmartForm object.
