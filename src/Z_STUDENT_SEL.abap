MODULE status_0100 OUTPUT.
  SET PF-STATUS 'S100'.
  SET TITLEBAR 'T100'.
ENDMODULE.

MODULE user_command_0100 INPUT.
  gv_save_ok = gv_ok_code.
  CLEAR gv_ok_code.
  CASE gv_save_ok.
    WHEN 'SEARCH'.
      PERFORM search_students.
    WHEN 'PRINT'.
      PERFORM print_transcript USING gv_rollno.
    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE PROGRAM.
    WHEN OTHERS.
  ENDCASE.
ENDMODULE.

MODULE status_0200 OUTPUT.
  SET PF-STATUS 'S200'.
  SET TITLEBAR 'T200'.
ENDMODULE.

MODULE display_alv_grid OUTPUT.
  PERFORM display_student_alv.
ENDMODULE.

MODULE user_command_0200 INPUT.
  gv_save_ok = gv_ok_code.
  CLEAR gv_ok_code.
  CASE gv_save_ok.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'EXIT' OR 'CANCEL'.
      LEAVE PROGRAM.
    WHEN OTHERS.
  ENDCASE.
ENDMODULE.
