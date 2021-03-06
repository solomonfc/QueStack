CREATE OR REPLACE PACKAGE PCKG_QAHUB_TEST AS 

  PROCEDURE QAHUB_QSTN_LST;
  PROCEDURE QAHUB_QSTN_ANS_LST;

END PCKG_QAHUB_TEST;
/


CREATE OR REPLACE PACKAGE BODY PCKG_QAHUB_TEST AS

  PROCEDURE QAHUB_QSTN_LST AS
  
    IS_KEYWORD VARCHAR2(200);
    IS_CTLG_ID VARCHAR2(200);
    IS_SUBCTLG_ID VARCHAR2(200);
    IS_START_DATE VARCHAR2(200);
    IS_END_DATE VARCHAR2(200);
    IS_USER_ID VARCHAR2(200);
    IS_OWNER_FLAG VARCHAR2(200);
    IS_FULLTXT_FLAG VARCHAR2(200);
    II_BEGIN_POS NUMBER;
    II_FETCH_NUM NUMBER;
    OI_FLAG NUMBER;
    OS_ERRCODE VARCHAR2(200);
    OS_MSG VARCHAR2(200);
    OI_TOTALNUM NUMBER;
    OC_QSTN_CUR PCKG_QAHUB_QSTN_ANS.QSTN_CUR;
    
    V_QSTN_ID         VARCHAR2(32);
    V_CTLG_NAME       VARCHAR2(32);
    V_SUBCTLG_NAME    VARCHAR2(50);
    V_USER_ID         VARCHAR2(50);
    V_TITLE           VARCHAR2(90);
    V_STATUS          VARCHAR(1);
    V_REPLY_NO        NUMBER(10,0);
    V_ENT_DT          VARCHAR2(16);
    V_UPD_DT          VARCHAR2(16);
  
  BEGIN
  
    IS_KEYWORD := 'ab';
    IS_CTLG_ID := NULL;
    IS_SUBCTLG_ID := NULL;
    IS_START_DATE := '20130606';
    IS_END_DATE := '20130806';
    IS_USER_ID := NULL;
    IS_OWNER_FLAG := NULL;
    IS_FULLTXT_FLAG := NULL;
    II_BEGIN_POS := '1';
    II_FETCH_NUM := '10';
  
    PCKG_QAHUB_QSTN_ANS.PROC_QSTN_QRY_KWD(
      IS_KEYWORD => IS_KEYWORD,
      IS_CTLG_ID => IS_CTLG_ID,
      IS_SUBCTLG_ID => IS_SUBCTLG_ID,
      IS_START_DATE => IS_START_DATE,
      IS_END_DATE => IS_END_DATE,
      IS_USER_ID => IS_USER_ID,
      IS_OWNER_FLAG => IS_OWNER_FLAG,
      IS_FULLTXT_FLAG => IS_FULLTXT_FLAG,
      II_BEGIN_POS => II_BEGIN_POS,
      II_FETCH_NUM => II_FETCH_NUM,
      OI_FLAG => OI_FLAG,
      OS_ERRCODE => OS_ERRCODE,
      OS_MSG => OS_MSG,
      OI_TOTALNUM => OI_TOTALNUM,
      OC_QSTN_CUR => OC_QSTN_CUR
    );
    
    LOOP FETCH OC_QSTN_CUR INTO 
      V_QSTN_ID,
      V_CTLG_NAME,
      V_SUBCTLG_NAME,
      V_USER_ID,
      V_TITLE,
      V_STATUS,
      V_REPLY_NO,
      V_ENT_DT,
      V_UPD_DT;
      
    EXIT WHEN OC_QSTN_CUR%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(V_QSTN_ID);
      DBMS_OUTPUT.PUT_LINE(V_TITLE);
      DBMS_OUTPUT.PUT_LINE(V_CTLG_NAME);
      DBMS_OUTPUT.PUT_LINE(V_SUBCTLG_NAME);
      DBMS_OUTPUT.PUT_LINE(V_ENT_DT);
      
    END LOOP;
    CLOSE OC_QSTN_CUR;

      DBMS_OUTPUT.PUT_LINE(OI_TOTALNUM);
      
--      DBMS_OUTPUT.PUT_LINE(SYSTIMESTAMP);
--      DBMS_OUTPUT.PUT_LINE((TO_TIMESTAMP('','YYYYMMDD')+1));
  
  END QAHUB_QSTN_LST;

  PROCEDURE QAHUB_QSTN_ANS_LST AS

    IS_QSTN_ID VARCHAR2(200);
    II_BEGIN_POS NUMBER;
    II_FETCH_NUM NUMBER;
    OI_FLAG NUMBER;
    OS_ERRCODE VARCHAR2(200);
    OS_MSG VARCHAR2(200);
    OI_TOTALNUM NUMBER;
    OC_QSTN_DTL_CUR PCKG_QAHUB_QSTN_ANS.QSTN_DTL_CUR;
    OC_ANS_CUR PCKG_QAHUB_QSTN_ANS.ANS_CUR;


    V_ANS_ID        VARCHAR2(32);
    V_USER_ID       VARCHAR2(10);
    V_CONTENT       VARCHAR2(4000);
    V_ENT_DT        VARCHAR2(16);
    V_UPD_DT        VARCHAR2(16);

  BEGIN

    IS_QSTN_ID := 'E33779F8905942EB8BB9A01CD74CE2E0';
  
    PCKG_QAHUB_QSTN_ANS.PROC_QSTN_ANS_QRY(
        IS_QSTN_ID => IS_QSTN_ID,
        II_BEGIN_POS => II_BEGIN_POS,
        II_FETCH_NUM => II_FETCH_NUM,
        OI_FLAG => OI_FLAG,
        OS_ERRCODE => OS_ERRCODE,
        OS_MSG => OS_MSG,
        OI_TOTALNUM => OI_TOTALNUM,
        OC_QSTN_DTL_CUR => OC_QSTN_DTL_CUR,
        OC_ANS_CUR => OC_ANS_CUR
      );
  
    LOOP FETCH OC_ANS_CUR INTO 
      V_ANS_ID,
      V_USER_ID,
      V_CONTENT,
      V_ENT_DT,
      V_UPD_DT;
    EXIT WHEN OC_ANS_CUR%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(V_ANS_ID);
      DBMS_OUTPUT.PUT_LINE(V_CONTENT);
    END LOOP;

--    DBMS_OUTPUT.PUT_LINE(DBMS_RANDOM.VALUE*DBMS_RANDOM.VALUE);
--    DBMS_OUTPUT.PUT_LINE(DBMS_RANDOM.VALUE*DBMS_RANDOM.VALUE);
--    DBMS_OUTPUT.PUT_LINE(DBMS_RANDOM.VALUE*DBMS_RANDOM.VALUE);
--    DBMS_OUTPUT.PUT_LINE(DBMS_RANDOM.VALUE*DBMS_RANDOM.VALUE);

  END QAHUB_QSTN_ANS_LST;

END PCKG_QAHUB_TEST;
/
