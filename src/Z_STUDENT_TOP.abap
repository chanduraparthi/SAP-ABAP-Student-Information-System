*& Global declarations for the academic management module pool.

CLASS lcl_event_handler DEFINITION.
  PUBLIC SECTION.
    METHODS on_double_click
      FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING e_row e_column es_row_no.
ENDCLASS.

TABLES: zstu_master, zstu_marks.

DATA: gv_ok_code TYPE sy-ucomm,
      gv_save_ok TYPE sy-ucomm,
      gv_rollno TYPE zstu_master-rollno,
      gv_course TYPE zstu_master-course,
      gt_students TYPE STANDARD TABLE OF zstu_master,
      gs_student TYPE zstu_master,
      gt_marks TYPE STANDARD TABLE OF zstu_marks,
      go_container TYPE REF TO cl_gui_custom_container,
      go_grid TYPE REF TO cl_gui_alv_grid,
      go_event_handler TYPE REF TO lcl_event_handler,
      gt_fieldcat TYPE lvc_t_fcat,
      gs_layout TYPE lvc_s_layo.
