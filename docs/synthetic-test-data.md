# Synthetic test data

Use only these fictitious records in the development system and in public demonstrations. SAP supplies the client field (`MANDT`).

## ZSTU_MASTER

| ROLLNO | FIRSTNAME | LASTNAME | COURSE | GENDER | EMAIL |
|---|---|---|---|---|---|
| STU0000001 | Asha | Rao | B.Tech CSE | F | asha.rao@example.test |
| STU0000002 | Kiran | Kumar | B.Tech ECE | M | kiran.kumar@example.test |
| STU0000003 | Meera | Das | MCA | F | meera.das@example.test |

## ZSTU_MARKS

| ROLLNO | SEMESTER | TOT_MARKS | MAX_MARKS | ATT_PCT | ZRESULT |
|---|---:|---:|---:|---:|---|
| STU0000001 | 01 | 850 | 1000 | 92.50 | PASS |
| STU0000001 | 02 | 875 | 1000 | 94.00 | PASS |
| STU0000002 | 01 | 780 | 1000 | 81.25 | PASS |
| STU0000003 | 01 | 640 | 1000 | 68.50 | PASS |
| STU0000003 | 02 | 420 | 1000 | 72.00 | FAIL |

## Test scenarios

1. Search roll number `STU0000001`: expect one student and two semester rows.
2. Search course `B.Tech CSE`: expect Asha Rao.
3. Double-click a student with no marks rows (after adding such a student): expect an empty detail result handled without a dump.
4. Attempt to create a marks row for a nonexistent roll number using a classic screen with foreign-key checking: expect the Dictionary check to reject the invalid reference.
5. Confirm that semester 01 and semester 02 for the same student are both accepted, while a duplicate key for the same client, roll number and semester is rejected.
