REPORT zch_student_count.

DATA gv_count TYPE i.

START-OF-SELECTION.
  SELECT COUNT( * ) FROM zstu_master INTO gv_count.
  WRITE: / 'Total Student Records:', gv_count.
