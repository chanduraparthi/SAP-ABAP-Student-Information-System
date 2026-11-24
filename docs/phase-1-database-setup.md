# Phase 1 — Database layer (SE11)

## Goal

Prepare and verify the two transparent tables used by the Student Information & Academic Management System:

1. `ZSTU_MASTER` — one row per student per SAP client.
2. `ZSTU_MARKS` — one row per student and semester per SAP client.

This is a classic SAP ECC 6.0 / SE11 build guide. The Markdown files in this repository are design and build documentation, not importable SAP table definitions. Create or verify the Dictionary objects in the target SAP system and record their actual activation status.

## Phase 1 deliverables

- [x] Database field specifications documented
- [x] Parent-child relationship documented
- [x] Existing `ZDM_ROLLNO` activation recorded from developer confirmation
- [ ] Verify `ZDE_ROLLNO` in SE11
- [ ] Verify / activate `ZSTU_MASTER`
- [ ] Verify / activate `ZSTU_MARKS`
- [ ] Verify foreign-key mapping in SE11
- [ ] Verify table entries with SE16N / SM30
- [ ] Capture sanitized SAP screenshots

## 1. Reusable roll-number type

The project uses one custom domain for the shared key field:

| Object | Setting | Value |
|---|---|---|
| Domain | Name | `ZDM_ROLLNO` |
| Domain | Data type | CHAR |
| Domain | Length | 10 |
| Data Element | Name | `ZDE_ROLLNO` |
| Data Element | Domain | `ZDM_ROLLNO` |
| Data Element | Short text | Student Roll Number |

The developer has reported that `ZDM_ROLLNO` is activated. In SE11, display `ZDE_ROLLNO`; if it does not exist, create it using the domain above, maintain field labels, save and activate it.

Do not create a separate domain for every field merely to make a foreign key. The important point for this relationship is that the corresponding roll-number fields have compatible technical definitions; using the same data element/domain is a clean reusable design.

## 2. Create or verify ZSTU_MASTER

Transaction: `SE11` → Database table → `ZSTU_MASTER`.

Short description: `Student Master Table`.

| Field | Key | Type / data element | Length |
|---|---:|---|---:|
| MANDT | Yes | MANDT (standard) | 3 |
| ROLLNO | Yes | ZDE_ROLLNO | 10 |
| FIRSTNAME | No | CHAR | 30 |
| LASTNAME | No | CHAR | 30 |
| COURSE | No | CHAR | 20 |
| GENDER | No | CHAR | 1 |
| EMAIL | No | CHAR | 50 |

Keep the key fields together at the beginning of the field list. Save and activate the table. Maintain technical settings according to the training system's conventions; a typical application-data table uses delivery class A.

## 3. Create or verify ZSTU_MARKS

Transaction: `SE11` → Database table → `ZSTU_MARKS`.

Short description: `Student Academic Marks`.

| Field | Key | Type / data element | Length / decimals |
|---|---:|---|---|
| MANDT | Yes | MANDT (standard) | 3 |
| ROLLNO | Yes | ZDE_ROLLNO | 10 |
| SEMESTER | Yes | NUMC | 2 |
| TOT_MARKS | No | INT4 | 4-byte integer |
| MAX_MARKS | No | INT4 | 4-byte integer |
| ATT_PCT | No | DEC | 5 / 2 |
| ZRESULT | No | CHAR | 10 |

**Naming note:** The supplied brief calls the last field `RESULT`; the existing repository records the SAP field as `ZRESULT`. This guide keeps `ZRESULT` to match the existing repository design. Confirm the actual active table in SE11 before changing it.

Save the table before defining its foreign key. Activate after the relationship is maintained.

## 4. Define the foreign key

In `ZSTU_MARKS` field maintenance:

1. Select field `ROLLNO`.
2. Choose **Foreign Keys**.
3. Enter check table `ZSTU_MASTER`.
4. Confirm the field assignment maps `MANDT` to `MANDT` and `ROLLNO` to `ROLLNO`.
5. Set the relationship cardinality to express that one master student may have zero or many marks rows, while each marks row refers to one master student (commonly represented as 1:N from check table to foreign-key table in classic SE11).
6. Save and activate.
7. Reopen the foreign-key definition and verify the mapping.

The foreign key is defined at the ABAP Dictionary level. It does not mean that a database-level referential constraint has automatically been created. It can provide documentation and input checks in classic SAP screens.

## 5. Test data (synthetic only)

Use these sample values when testing in the development client. SAP assigns the client field; do not manually copy a client number from another system.

### Student master examples

| ROLLNO | FIRSTNAME | LASTNAME | COURSE | GENDER | EMAIL |
|---|---|---|---|---|---|
| 101 | Chandu | Raparthi | CSE | M | chandu101@example.test |
| 102 | Mahesh | Kumar | CSE | M | mahesh102@example.test |
| 103 | Raju | Kumar | CSE | M | raju103@example.test |
| 104 | Ajay | Kumar | CSE | M | ajay104@example.test |
| 105 | Samantha | Devi | CSE | F | samantha105@example.test |

### Marks examples

| ROLLNO | SEMESTER | TOT_MARKS | MAX_MARKS | ATT_PCT | ZRESULT |
|---|---:|---:|---:|---:|---|
| 101 | 01 | 850 | 1000 | 92.00 | PASS |
| 101 | 02 | 780 | 1000 | 88.00 | PASS |
| 102 | 01 | 850 | 1000 | 92.50 | PASS |
| 103 | 01 | 790 | 1000 | 86.00 | PASS |
| 104 | 01 | 810 | 1000 | 90.00 | PASS |
| 105 | 01 | 900 | 1000 | 95.00 | PASS |

The examples are fictitious and use the same roll-number format/length as the domain.

## 6. Verification checklist

| Check | How to verify | Expected |
|---|---|---|
| Domain | SE11 → Domain → ZDM_ROLLNO | Active, CHAR 10 |
| Data element | SE11 → Data Type → ZDE_ROLLNO | Active, uses ZDM_ROLLNO |
| Master table | SE11 → Database table → ZSTU_MASTER | Active, MANDT + ROLLNO key |
| Marks table | SE11 → Database table → ZSTU_MARKS | Active, MANDT + ROLLNO + SEMESTER key |
| Foreign key | ZSTU_MARKS → ROLLNO → Foreign Keys | Check table ZSTU_MASTER and correct field mapping |
| Master data | SE16N → ZSTU_MASTER | Synthetic student rows visible |
| Marks data | SE16N → ZSTU_MARKS | Semester rows visible and tied to existing students |

## Interview explanation

**Why do we use a separate marks table?**

A student can have multiple semester records. Keeping master information in `ZSTU_MASTER` and semester-specific information in `ZSTU_MARKS` avoids repeating the student's name, course and email for every semester. The composite key `MANDT + ROLLNO + SEMESTER` ensures that a student has at most one marks record per semester in a client.

**What is the difference between a primary key and a foreign key?**

A primary key uniquely identifies a row in its own table. A foreign key relates fields in a dependent table to the key fields of a check table. Here, `ZSTU_MASTER` is the check table and `ZSTU_MARKS` is the foreign-key table.

**Does a domain create a foreign key relationship?**

No. A domain defines technical attributes such as data type and length. The relationship must be explicitly defined in the table's foreign-key maintenance in SE11.

## Reference

- SAP Help Portal, [Foreign Keys in the ABAP Dictionary](https://help.sap.com/saphelp_snc700_ehp04/helpdata/en/cf/21ea77446011d189700000e8322d00/content.htm)
- SAP Learning, [Defining Relationships Between Database Tables](https://learning.sap.com/courses/building-data-models-with-the-abap-dictionary-and-abap-core-data-services/defining-relationships-between-database-tables_e55dbd61-6083-4747-bb5d-905ba29ab662)
