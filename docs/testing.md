# Testing notes

## Verified manually

| Test | Result |
|---|---|
| Execute transaction `ZSTUDENT_APP` | Screen 0100 opens |
| Screen 0100 EXIT command | Works |
| Screen 0100 SEARCH command | Reaches `FORM search_students` |
| SEARCH navigation | Screen 0200 opens |
| Screen 0200 title bar | Displays `Student Academic Records` |
| Read `ZSTU_MASTER` in SE16N | 5 records found |

## Pending tests

| Test | Expected result |
|---|---|
| Search by roll number | Matching student appears in Screen 0200 ALV |
| Search by course | Matching students appear in ALV |
| Search with both fields blank | All student master records appear |
| Double-click student row | Semester marks popup opens |
| Print transcript | SmartForm generates a transcript |

## Evidence to add

Place sanitized screenshots in `screenshots/`. Remove or obscure SAP system addresses, user names, client identifiers, and any real personal data before publishing.
