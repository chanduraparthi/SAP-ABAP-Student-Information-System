REPORT zch_student_validate.

PARAMETERS:
  p_rollno TYPE zstu_master-rollno OBLIGATORY,
  p_email  TYPE zstu_master-email,
  p_gender TYPE zstu_master-gender.

START-OF-SELECTION.
  IF p_rollno IS INITIAL.
    MESSAGE 'Roll number is required' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  IF p_email IS NOT INITIAL AND p_email NS '@'.
    MESSAGE 'Email address must contain @' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  IF p_gender IS NOT INITIAL AND
     p_gender <> 'M' AND p_gender <> 'F' AND p_gender <> 'O'.
    MESSAGE 'Gender must be M, F or O' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  WRITE: / 'Input validation passed.'.
