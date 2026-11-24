# Synthetic test data

Use only these fictitious records in the development system. SAP supplies the client field (`MANDT`).

## ZSTU_MASTER

| ROLLNO | FIRSTNAME | LASTNAME | COURSE | GENDER | EMAIL |
|---|---|---|---|---|---|
| 101 | Chandu | Raparthi | CSE | M | chandu101@example.test |
| 102 | Mahesh | Kumar | CSE | M | mahesh102@example.test |
| 103 | Raju | Kumar | CSE | M | raju103@example.test |
| 104 | Ajay | Kumar | CSE | M | ajay104@example.test |
| 105 | Samantha | Devi | CSE | F | samantha105@example.test |

## ZSTU_MARKS

| ROLLNO | SEMESTER | TOT_MARKS | MAX_MARKS | ATT_PCT | ZRESULT |
|---|---:|---:|---:|---:|---|
| 101 | 01 | 850 | 1000 | 92.00 | PASS |
| 101 | 02 | 780 | 1000 | 88.00 | PASS |
| 102 | 01 | 850 | 1000 | 92.50 | PASS |
| 103 | 01 | 790 | 1000 | 86.00 | PASS |
| 104 | 01 | 810 | 1000 | 90.00 | PASS |
| 105 | 01 | 900 | 1000 | 95.00 | PASS |

## Test scenarios

1. Search roll number `101`: expect Chandu Raparthi and two semester rows.
2. Search course `CSE`: expect all five students.
3. Search roll number `105`: expect Samantha Devi and one semester row.
4. Double-click a student with no marks rows (after adding such a student): expect an empty detail result handled without a dump.
5. Attempt to create a marks row for a nonexistent roll number using a classic screen with foreign-key checking: expect the Dictionary check to reject the invalid reference.
6. Confirm that semester 01 and semester 02 for the same student are both accepted, while a duplicate key for the same client, roll number and semester is rejected.

All names and email addresses above are fictitious examples. The `example.test` domain is reserved for testing and is not intended for real email delivery.
