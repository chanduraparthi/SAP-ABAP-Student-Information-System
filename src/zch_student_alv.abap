REPORT zch_student_alv.

TYPE-POOLS slis.
DATA: gt_students TYPE STANDARD TABLE OF zstu_master,
      gt_fieldcat TYPE slis_t_fieldcat_alv,
      gs_fieldcat TYPE slis_fieldcat_alv.

START-OF-SELECTION.
  SELECT * FROM zstu_master INTO TABLE gt_students
    ORDER BY rollno.

  IF gt_students IS INITIAL.
    MESSAGE 'No student records available for ALV' TYPE 'S' DISPLAY LIKE 'E'.
    RETURN.
  ENDIF.

  PERFORM build_fieldcat.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
      it_fieldcat        = gt_fieldcat
      i_grid_title       = 'Student Master ALV Report'
    TABLES
      t_outtab           = gt_students
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.

  IF sy-subrc <> 0.
    MESSAGE 'ALV display failed' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.

FORM build_fieldcat.
  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'ROLLNO'.
  gs_fieldcat-seltext_m = 'Roll Number'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'FIRSTNAME'.
  gs_fieldcat-seltext_m = 'First Name'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'LASTNAME'.
  gs_fieldcat-seltext_m = 'Last Name'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'COURSE'.
  gs_fieldcat-seltext_m = 'Course'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'EMAIL'.
  gs_fieldcat-seltext_m = 'Email'.
  APPEND gs_fieldcat TO gt_fieldcat.
ENDFORM.
