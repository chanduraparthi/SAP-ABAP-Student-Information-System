REPORT zch_student_mgmt.

DATA: gv_choice TYPE c LENGTH 1,
      gv_count TYPE i.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
PARAMETERS:
  p_list RADIOBUTTON GROUP g1 DEFAULT 'X',
  p_count RADIOBUTTON GROUP g1,
  p_marks RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK b1.
PARAMETERS p_rollno TYPE zstu_master-rollno.

START-OF-SELECTION.
  IF p_list = 'X'.
    SUBMIT zch_student_search AND RETURN.
  ELSEIF p_count = 'X'.
    SELECT COUNT( * ) FROM zstu_master INTO gv_count.
    WRITE: / 'Total Student Records:', gv_count.
  ELSEIF p_marks = 'X'.
    IF p_rollno IS INITIAL.
      MESSAGE 'Enter a roll number to view academic records' TYPE 'S' DISPLAY LIKE 'E'.
    ELSE.
      SUBMIT zch_student_marks_report WITH p_rollno = p_rollno AND RETURN.
    ENDIF.
  ENDIF.
