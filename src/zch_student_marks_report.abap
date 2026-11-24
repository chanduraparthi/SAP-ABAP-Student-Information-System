REPORT zch_student_marks_report.

DATA: gt_marks TYPE STANDARD TABLE OF zstu_marks,
      gs_mark TYPE zstu_marks.

PARAMETERS p_rollno TYPE zstu_marks-rollno OBLIGATORY.

START-OF-SELECTION.
  SELECT * FROM zstu_marks INTO TABLE gt_marks
    WHERE rollno = p_rollno
    ORDER BY semester.

  IF gt_marks IS INITIAL.
    WRITE: / 'No academic records found for this student.'.
    RETURN.
  ENDIF.

  WRITE: / 'SEMESTER-WISE ACADEMIC PERFORMANCE'.
  ULINE.
  LOOP AT gt_marks INTO gs_mark.
    WRITE: / 'Semester:', gs_mark-semester,
             'Marks:', gs_mark-tot_marks, '/', gs_mark-max_marks,
             'Attendance:', gs_mark-att_pct,
             'Result:', gs_mark-zresult.
  ENDLOOP.
