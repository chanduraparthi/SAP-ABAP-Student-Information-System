REPORT zch_student_update.

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
  IF sy-subrc <> 0.
    MESSAGE 'Student record does not exist' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  UPDATE zstu_master
    SET firstname = p_fname
        lastname  = p_lname
        course    = p_course
        gender    = p_gender
        email     = p_email
    WHERE rollno = p_rollno.

  IF sy-subrc = 0.
    COMMIT WORK.
    MESSAGE 'Student record updated successfully' TYPE 'S'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Student update failed' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
