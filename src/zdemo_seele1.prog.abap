*&---------------------------------------------------------------------*
*& Report ZDEMO_SEELE1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDEMO_SEELE1.

START-OF-SELECTION.

SELECT *
  FROM makt
  WHERE spras = 'E'
  INTO TABLE @DATA(gt_data).

*显示内表中的数据
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_structure_name = 'makt'
  TABLES
    t_outtab         = gt_data
  EXCEPTIONS
    program_error    = 1
    OTHERS           = 2.
IF sy-subrc <> 0.
  MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
ENDIF.
