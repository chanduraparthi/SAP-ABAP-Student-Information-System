REPORT zch_student_search.

DATA: gs_student TYPE zstu_master,
      gt_students TYPE STANDARD TABLE OF zstu_master.

PARAMETERS: p_rollno TYPE zstu_master-rollno,
            p_all AS CHECKBOX DEFAULT 'X'.

START-OF-SELECTION.
  IF p_all = 'X'.
    SELECT * FROM zstu_master INTO TABLE gt_students
      ORDER BY rollno.
    IF gt_students IS INITIAL.
      WRITE: / 'No student records found.'.
      RETURN.
    ENDIF.
    WRITE: / 'STUDENT MASTER LIST'.
    ULINE.
    LOOP AT gt_students INTO gs_student.
      PERFORM display_student USING gs_student.
    ENDLOOP.
    WRITE: / 'Total students:', lines( gt_students ).
  ELSE.
    IF p_rollno IS INITIAL.
      MESSAGE 'Enter a roll number or select Display All' TYPE 'S' DISPLAY LIKE 'E'.
      RETURN.
    ENDIF.
    SELECT SINGLE * FROM zstu_master INTO gs_student
      WHERE rollno = p_rollno.
    IF sy-subrc = 0.
      WRITE: / 'STUDENT DETAILS'.
      ULINE.
      PERFORM display_student USING gs_student.
    ELSE.
      WRITE: / 'Student not found.'.
    ENDIF.
  ENDIF.

FORM display_student USING ps_student TYPE zstu_master.
  WRITE: / 'Roll Number:', ps_student-rollno,
         / 'Name       :', ps_student-firstname, ps_student-lastname,
         / 'Course     :', ps_student-course,
         / 'Gender     :', ps_student-gender,
         / 'Email      :', ps_student-email.
  ULINE.
ENDFORM.
