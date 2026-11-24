REPORT zch_student_reusable_validate.

PARAMETERS:
  p_rollno TYPE zstu_master-rollno OBLIGATORY,
  p_email  TYPE zstu_master-email,
  p_gender TYPE zstu_master-gender.

DATA gv_valid TYPE c LENGTH 1.

START-OF-SELECTION.
  PERFORM validate_student
    USING p_rollno p_email p_gender
    CHANGING gv_valid.

  IF gv_valid = 'X'.
    WRITE: / 'Student input is valid.'.
  ELSE.
    WRITE: / 'Student input is invalid. Check the entered values.'.
  ENDIF.

FORM validate_student
  USING    p_id TYPE zstu_master-rollno
           p_mail TYPE zstu_master-email
           p_sex TYPE zstu_master-gender
  CHANGING p_valid TYPE c.

  p_valid = 'X'.
  IF p_id IS INITIAL.
    p_valid = space.
  ENDIF.
  IF p_mail IS NOT INITIAL AND p_mail NS '@'.
    p_valid = space.
  ENDIF.
  IF p_sex IS NOT INITIAL AND
     p_sex <> 'M' AND p_sex <> 'F' AND p_sex <> 'O'.
    p_valid = space.
  ENDIF.
ENDFORM.
