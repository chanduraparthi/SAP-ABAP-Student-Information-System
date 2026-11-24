REPORT zch_student_oop.

CLASS lcl_student_report DEFINITION.
  PUBLIC SECTION.
    METHODS:
      get_data,
      display_data.
  PRIVATE SECTION.
    DATA mt_students TYPE STANDARD TABLE OF zstu_master.
ENDCLASS.

DATA go_report TYPE REF TO lcl_student_report.

CLASS lcl_student_report IMPLEMENTATION.
  METHOD get_data.
    SELECT * FROM zstu_master INTO TABLE mt_students
      ORDER BY rollno.
  ENDMETHOD.

  METHOD display_data.
    DATA ls_student TYPE zstu_master.
    IF mt_students IS INITIAL.
      WRITE: / 'No student records available.'.
      RETURN.
    ENDIF.
    WRITE: / 'STUDENT REPORT USING LOCAL CLASS'.
    ULINE.
    LOOP AT mt_students INTO ls_student.
      WRITE: / ls_student-rollno,
               ls_student-firstname,
               ls_student-lastname,
               ls_student-course.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  CREATE OBJECT go_report.
  go_report->get_data( ).
  go_report->display_data( ).
