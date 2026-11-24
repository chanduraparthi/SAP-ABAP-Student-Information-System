REPORT zch_student_params.

DATA: gt_students TYPE STANDARD TABLE OF zstu_master,
      gs_student TYPE zstu_master.

SELECT-OPTIONS s_roll FOR gs_student-rollno.
PARAMETERS p_course TYPE zstu_master-course.

START-OF-SELECTION.
  IF p_course IS INITIAL.
    SELECT * FROM zstu_master INTO TABLE gt_students
      WHERE rollno IN s_roll
      ORDER BY rollno.
  ELSE.
    SELECT * FROM zstu_master INTO TABLE gt_students
      WHERE rollno IN s_roll
        AND course = p_course
      ORDER BY rollno.
  ENDIF.

  IF gt_students IS INITIAL.
    WRITE: / 'No records match the selection criteria.'.
  ELSE.
    LOOP AT gt_students INTO gs_student.
      WRITE: / gs_student-rollno,
               gs_student-firstname,
               gs_student-lastname,
               gs_student-course.
    ENDLOOP.
  ENDIF.
