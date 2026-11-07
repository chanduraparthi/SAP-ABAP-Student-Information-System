# Database design

## ZSTU_MASTER

Student master table fields:

| Field | Type / data element notes | Key |
|---|---|---|
| MANDT | Standard SAP client field | Yes |
| ROLLNO | `ZDE_ROLLNO`, domain `ZDM_ROLLNO`, CHAR 10 | Yes |
| FIRSTNAME | CHAR 30 | No |
| LASTNAME | CHAR 30 | No |
| COURSE | CHAR 20 | No |
| GENDER | CHAR 1 | No |
| EMAIL | CHAR 50 | No |

## ZSTU_MARKS

Student academic marks fields:

| Field | Type | Key |
|---|---|---|
| MANDT | Standard SAP client field | Yes |
| ROLLNO | Same roll number data element as master | Yes |
| SEMESTER | NUMC 2 | Yes |
| TOT_MARKS | INT4 | No |
| MAX_MARKS | INT4 | No |
| ATT_PCT | DEC(5,2) | No |
| ZRESULT | CHAR 10 | No |

A foreign-key relationship is defined from `ZSTU_MARKS-ROLLNO` to `ZSTU_MASTER-ROLLNO`.

## Sample data policy

Use only synthetic records when documenting or demonstrating this project. SAP client field `MANDT` is assigned by SAP and should not be manually entered in ordinary maintenance.
