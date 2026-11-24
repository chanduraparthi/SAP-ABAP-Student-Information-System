FORM search_students.
  CLEAR gt_students.
  SELECT * FROM zstu_master INTO TABLE gt_students
    WHERE ( rollno = gv_rollno OR gv_rollno = space )
      AND ( course = gv_course OR gv_course = space )
    ORDER BY rollno.
  IF gt_students IS INITIAL.
    MESSAGE 'No student records found' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.
  CALL SCREEN 0200.
ENDFORM.

FORM display_student_alv.
  IF go_container IS INITIAL.
    CREATE OBJECT go_container
      EXPORTING container_name = 'MY_CONTAINER'.
    CREATE OBJECT go_grid
      EXPORTING i_parent = go_container.
    CREATE OBJECT go_event_handler.
    SET HANDLER go_event_handler->on_double_click FOR go_grid.

    PERFORM add_fcat USING 'ROLLNO' 'Roll Number'.
    PERFORM add_fcat USING 'FIRSTNAME' 'First Name'.
    PERFORM add_fcat USING 'LASTNAME' 'Last Name'.
    PERFORM add_fcat USING 'COURSE' 'Course'.
    PERFORM add_fcat USING 'GENDER' 'Gender'.
    PERFORM add_fcat USING 'EMAIL' 'Email'.

    gs_layout-zebra = 'X'.
    gs_layout-cwidth_opt = 'X'.
    CALL METHOD go_grid->set_table_for_first_display
      EXPORTING is_layout = gs_layout
      CHANGING it_outtab = gt_students
               it_fieldcatalog = gt_fieldcat.
  ELSE.
    CALL METHOD go_grid->refresh_table_display.
  ENDIF.
ENDFORM.

FORM add_fcat USING p_field TYPE lvc_fname p_text TYPE lvc_txt.
  DATA ls_fcat TYPE lvc_s_fcat.
  CLEAR ls_fcat.
  ls_fcat-fieldname = p_field.
  ls_fcat-coltext = p_text.
  APPEND ls_fcat TO gt_fieldcat.
ENDFORM.

FORM show_marks USING p_rollno TYPE zstu_master-rollno.
  DATA: lt_marks TYPE STANDARD TABLE OF zstu_marks,
        lo_dialog TYPE REF TO cl_gui_dialogbox_container,
        lo_marks_grid TYPE REF TO cl_gui_alv_grid,
        lt_marks_fcat TYPE lvc_t_fcat,
        ls_fcat TYPE lvc_s_fcat,
        ls_layout TYPE lvc_s_layo.

  SELECT * FROM zstu_marks INTO TABLE lt_marks
    WHERE rollno = p_rollno ORDER BY semester.
  IF lt_marks IS INITIAL.
    MESSAGE 'No semester marks found' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  CREATE OBJECT lo_dialog
    EXPORTING width = 760 height = 280 top = 80 left = 80
              caption = 'Semester Academic Records'.
  CREATE OBJECT lo_marks_grid
    EXPORTING i_parent = lo_dialog.

  CLEAR ls_fcat.
  ls_fcat-fieldname = 'SEMESTER'.
  ls_fcat-coltext = 'Semester'.
  APPEND ls_fcat TO lt_marks_fcat.
  CLEAR ls_fcat.
  ls_fcat-fieldname = 'TOT_MARKS'.
  ls_fcat-coltext = 'Marks Obtained'.
  APPEND ls_fcat TO lt_marks_fcat.
  CLEAR ls_fcat.
  ls_fcat-fieldname = 'MAX_MARKS'.
  ls_fcat-coltext = 'Maximum Marks'.
  APPEND ls_fcat TO lt_marks_fcat.
  CLEAR ls_fcat.
  ls_fcat-fieldname = 'ATT_PCT'.
  ls_fcat-coltext = 'Attendance %'.
  APPEND ls_fcat TO lt_marks_fcat.
  CLEAR ls_fcat.
  ls_fcat-fieldname = 'ZRESULT'.
  ls_fcat-coltext = 'Result'.
  APPEND ls_fcat TO lt_marks_fcat.

  ls_layout-zebra = 'X'.
  ls_layout-cwidth_opt = 'X'.
  CALL METHOD lo_marks_grid->set_table_for_first_display
    EXPORTING is_layout = ls_layout
    CHANGING it_outtab = lt_marks
             it_fieldcatalog = lt_marks_fcat.
ENDFORM.

FORM print_transcript USING p_rollno TYPE zstu_master-rollno.
  DATA: ls_student TYPE zstu_master,
        lt_marks TYPE STANDARD TABLE OF zstu_marks,
        lv_function TYPE rs38l_fnam.

  IF p_rollno IS INITIAL.
    MESSAGE 'Enter a roll number first' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  SELECT SINGLE * FROM zstu_master INTO ls_student
    WHERE rollno = p_rollno.
  IF sy-subrc <> 0.
    MESSAGE 'Student not found' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  SELECT * FROM zstu_marks INTO TABLE lt_marks
    WHERE rollno = p_rollno ORDER BY semester.

  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING formname = 'Z_STUDENT_TRANSCRIPT_FORM'
    IMPORTING fm_name = lv_function
    EXCEPTIONS no_form = 1 no_function_module = 2 OTHERS = 3.
  IF sy-subrc <> 0.
    MESSAGE 'SmartForm is not active or was not found' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  CALL FUNCTION lv_function
    EXPORTING is_student = ls_student
    TABLES it_marks = lt_marks
    EXCEPTIONS formatting_error = 1 internal_error = 2
               send_error = 3 user_canceled = 4 OTHERS = 5.
  IF sy-subrc <> 0.
    MESSAGE 'Transcript generation failed' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
ENDFORM.

CLASS lcl_event_handler IMPLEMENTATION.
  METHOD on_double_click.
    DATA ls_student TYPE zstu_master.
    READ TABLE gt_students INTO ls_student INDEX e_row-index.
    IF sy-subrc = 0.
      PERFORM show_marks USING ls_student-rollno.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
