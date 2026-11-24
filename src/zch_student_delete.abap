REPORT zch_student_delete.

DATA gs_student TYPE zstu_master.

PARAMETERS p_rollno TYPE zstu_master-rollno OBLIGATORY.

START-OF-SELECTION.
  SELECT SINGLE * FROM zstu_master INTO gs_student
    WHERE rollno = p_rollno.
  IF sy-subrc <> 0.
    MESSAGE 'Student record not found' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  "Marks rows are dependent records. Delete them before the master row.
  DELETE FROM zstu_marks WHERE rollno = p_rollno.
  DELETE FROM zstu_master WHERE rollno = p_rollno.

  IF sy-subrc = 0.
    COMMIT WORK.
    MESSAGE 'Student and related academic records deleted' TYPE 'S'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Delete operation failed' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
