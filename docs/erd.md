# Entity Relationship Diagram

## Logical relationship

```mermaid
erDiagram
    ZSTU_MASTER ||--o{ ZSTU_MARKS : "has semester records"
    ZSTU_MASTER {
        CLNT MANDT PK
        CHAR10 ROLLNO PK
        CHAR30 FIRSTNAME
        CHAR30 LASTNAME
        CHAR20 COURSE
        CHAR1 GENDER
        CHAR50 EMAIL
    }
    ZSTU_MARKS {
        CLNT MANDT PK, FK
        CHAR10 ROLLNO PK, FK
        NUMC2 SEMESTER PK
        INT4 TOT_MARKS
        INT4 MAX_MARKS
        DEC5_2 ATT_PCT
        CHAR10 ZRESULT
    }
```

## Key interpretation

- `ZSTU_MASTER` primary key: `MANDT + ROLLNO`.
- `ZSTU_MARKS` primary key: `MANDT + ROLLNO + SEMESTER`.
- `ZSTU_MARKS` references `ZSTU_MASTER` using both client and roll number.
- One student may have zero or many semester rows.

The diagram describes the intended logical model. Verify the actual active SE11 table definitions and foreign-key assignment in the SAP system before treating it as runtime evidence.
