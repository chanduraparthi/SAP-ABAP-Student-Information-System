REPORT zch_student_modular.

DATA: gt_students TYPE STANDARD TABLE OF zstu_master,
      gs_student TYPE zstu_master.

PARAMETERS p_course TYPE zstu_master-course.

START-OF-SELECTION.
  PERFORM get_students.
  PERFORM print_students.

FORM get_students.
  IF p_course IS INITIAL.
    SELECT * FROM zstu_master INTO TABLE gt_students
      ORDER BY rollno.
  ELSE.
    SELECT * FROM zstu_master INTO TABLE gt_students
      WHERE course = p_course
      ORDER BY rollno.
  ENDIF.
ENDFORM.

FORM print_students.
  IF gt_students IS INITIAL.
    WRITE: / 'No matching students found.'.
    RETURN.
  ENDIF.
  WRITE: / 'STUDENT LIST'.
  ULINE.
  LOOP AT gt_students INTO gs_student.
    WRITE: / gs_student-rollno,
             gs_student-firstname,
             gs_student-lastname,
             gs_student-course,
             gs_student-email.
  ENDLOOP.
ENDFORM.
