REPORT zch_student_search.

DATA: gs_student TYPE zstu_master,
      gt_students TYPE STANDARD TABLE OF zstu_master,
      gv_count TYPE i.

PARAMETERS: p_rollno TYPE zstu_master-rollno,
            p_course TYPE zstu_master-course,
            p_all AS CHECKBOX.

START-OF-SELECTION.
  IF p_all = 'X'.
    SELECT * FROM zstu_master INTO TABLE gt_students
      ORDER BY rollno.
  ELSE.
    IF p_rollno IS INITIAL AND p_course IS INITIAL.
      MESSAGE 'Enter a roll number or course, or select Display All'
        TYPE 'S' DISPLAY LIKE 'E'.
      RETURN.
    ENDIF.

    SELECT * FROM zstu_master INTO TABLE gt_students
      WHERE ( rollno = p_rollno OR p_rollno = space )
        AND ( course = p_course OR p_course = space )
      ORDER BY rollno.
  ENDIF.

  IF gt_students IS INITIAL.
    WRITE: / 'No student records found.'.
    RETURN.
  ENDIF.

  WRITE: / 'STUDENT MASTER LIST'.
  ULINE.
  LOOP AT gt_students INTO gs_student.
    PERFORM display_student USING gs_student.
  ENDLOOP.

  DESCRIBE TABLE gt_students LINES gv_count.
  WRITE: / 'Total students:', gv_count.

FORM display_student USING ps_student TYPE zstu_master.
  WRITE: / 'Roll Number:', ps_student-rollno,
         / 'Name       :', ps_student-firstname, ps_student-lastname,
         / 'Course     :', ps_student-course,
         / 'Gender     :', ps_student-gender,
         / 'Email      :', ps_student-email.
  ULINE.
ENDFORM.
