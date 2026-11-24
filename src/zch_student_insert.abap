REPORT zch_student_insert.

DATA gs_student TYPE zstu_master.

PARAMETERS:
  p_rollno TYPE zstu_master-rollno OBLIGATORY,
  p_fname  TYPE zstu_master-firstname OBLIGATORY,
  p_lname  TYPE zstu_master-lastname OBLIGATORY,
  p_course TYPE zstu_master-course,
  p_gender TYPE zstu_master-gender,
  p_email  TYPE zstu_master-email.

START-OF-SELECTION.
  SELECT SINGLE * FROM zstu_master INTO gs_student
    WHERE rollno = p_rollno.
  IF sy-subrc = 0.
    MESSAGE 'Student roll number already exists' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  CLEAR gs_student.
  gs_student-mandt     = sy-mandt.
  gs_student-rollno    = p_rollno.
  gs_student-firstname = p_fname.
  gs_student-lastname  = p_lname.
  gs_student-course    = p_course.
  gs_student-gender    = p_gender.
  gs_student-email     = p_email.

  INSERT zstu_master FROM gs_student.
  IF sy-subrc = 0.
    COMMIT WORK.
    MESSAGE 'Student record inserted successfully' TYPE 'S'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Student record could not be inserted' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
