CREATE OR REPLACE PACKAGE PCKG_QAHUB_QSTN_ANS AS

TYPE QSTN_REC IS RECORD(
    QSTN_ID         VARCHAR2(32),
    CTLG_NAME       VARCHAR2(32),
    SUBCTLG_NAME    VARCHAR2(50),
    USER_ID         VARCHAR2(50),
    TITLE           VARCHAR2(90),
    STATUS          VARCHAR(1),
    REPLY_NO        NUMBER(10,0),
    ENT_DT          VARCHAR2(16),
    UPD_DT          VARCHAR2(16)
);

TYPE QSTN_DTL_REC IS RECORD(
    QSTN_ID         VARCHAR2(32),
    CTLG_NAME       VARCHAR2(32),
    SUBCTLG_NAME    VARCHAR2(50),
    USER_ID         VARCHAR2(50),
    TITLE           VARCHAR2(90),
    CONTENT         VARCHAR2(4000),
    STATUS          VARCHAR(1),
    REPLY_NO        NUMBER(10,0),
    ENT_DT          VARCHAR2(16),
    UPD_DT          VARCHAR2(16)
);

TYPE QSTN_UPD_REC IS RECORD(
    QSTN_ID         VARCHAR2(32),
    CTLG_ID         VARCHAR2(32),
    SUBCTLG_ID      VARCHAR2(32),
    USER_ID         VARCHAR2(50),
    TITLE           VARCHAR2(90),
    CONTENT         VARCHAR2(4000),
    STATUS          VARCHAR(1),
    REPLY_NO        NUMBER(10,0),
    ENT_DT          VARCHAR2(16),
    UPD_DT          VARCHAR2(16),
    ENT_TMS         TIMESTAMP,
    UPD_TMS         TIMESTAMP
);

TYPE ANS_REC IS RECORD(
    ANS_ID        VARCHAR2(32),
    USER_ID       VARCHAR2(10),
    CONTENT       VARCHAR2(4000),
    ENT_DT        VARCHAR2(16),
    UPD_DT        VARCHAR2(16)
);

TYPE QSTN_CUR IS REF CURSOR RETURN QSTN_REC;
TYPE QSTN_DTL_CUR IS REF CURSOR RETURN QSTN_DTL_REC;
TYPE ANS_CUR IS REF CURSOR RETURN ANS_REC;
TYPE QSTN_UPD_CUR IS REF CURSOR RETURN QSTN_UPD_REC;

PROCEDURE PROC_QSTN_NEW(
    IS_CTLG_ID        IN      VARCHAR2,
    IS_SUBCTLG_ID     IN      VARCHAR2,
    IS_USER_ID        IN      VARCHAR2,
    IS_TITLE          IN      VARCHAR2,
    IS_CONTENT        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
);

PROCEDURE PROC_QSTN_QRY_KWD(
    IS_KEYWORD        IN      VARCHAR2,
    IS_CTLG_ID        IN      VARCHAR2,
    IS_SUBCTLG_ID     IN      VARCHAR2,
    IS_START_DATE     IN      VARCHAR2,
    IS_END_DATE       IN      VARCHAR2,
    IS_USER_ID        IN      VARCHAR2,
    IS_OWNER_FLAG     IN      VARCHAR2,
    IS_FULLTXT_FLAG   IN      VARCHAR2,
    II_BEGIN_POS       IN      INTEGER,
    II_FETCH_NUM       IN      INTEGER,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OI_TOTALNUM       OUT     INTEGER,
    OC_QSTN_CUR       OUT     QSTN_CUR
);

PROCEDURE PROC_QSTN_QRY(
    IS_QSTN_ID        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OC_QSTN_DTL_CUR   OUT     QSTN_DTL_CUR
);

PROCEDURE PROC_QSTN_ANS_QRY(
    IS_QSTN_ID        IN      VARCHAR2,
    II_BEGIN_POS       IN      INTEGER,
    II_FETCH_NUM       IN      INTEGER,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OI_TOTALNUM       OUT     INTEGER,
    OC_QSTN_DTL_CUR   OUT     QSTN_DTL_CUR,
    OC_ANS_CUR        OUT     ANS_CUR
);


PROCEDURE PROC_QSTN_PRE_UPD(
    IS_QSTN_ID        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OC_QSTN_UPD_CUR   OUT     QSTN_UPD_CUR
);

PROCEDURE PROC_QSTN_UPD(
    IS_QSTN_ID        IN      VARCHAR2,
    IS_CTLG_ID        IN      VARCHAR2,
    IS_SUBCTLG_ID     IN      VARCHAR2,
    IS_TITLE          IN      VARCHAR2,
    IS_CONTENT        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
);

PROCEDURE PROC_QSTN_DEL(
    IS_QSTN_ID        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
);

PROCEDURE PROC_ANS_NEW(
    IS_QSTN_ID        IN      VARCHAR2,
    IS_USER_ID        IN      VARCHAR2,
    IS_CONTENT        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
);


PROCEDURE PROC_ANS_QRY(
    IS_ANS_ID         IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OC_ANS_CUR        OUT     ANS_CUR
);

PROCEDURE PROC_ANS_PRE_UPD(
    IS_ANS_ID         IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OC_ANS_CUR        OUT     ANS_CUR
);

PROCEDURE PROC_ANS_UPD(
    IS_ANS_ID         IN      VARCHAR2,
    IS_CONTENT        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
);

PROCEDURE PROC_ANS_DEL(
    IS_ANS_ID         IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
);

END PCKG_QAHUB_QSTN_ANS;
/


CREATE OR REPLACE PACKAGE BODY PCKG_QAHUB_QSTN_ANS AS

  PROCEDURE PROC_QSTN_NEW(
    IS_CTLG_ID        IN      VARCHAR2,
    IS_SUBCTLG_ID     IN      VARCHAR2,
    IS_USER_ID        IN      VARCHAR2,
    IS_TITLE          IN      VARCHAR2,
    IS_CONTENT        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
) AS
  BEGIN
      OI_FLAG  :=0;
      
      INSERT INTO QAHUB_QSTN (
        QSTN_ID,
        CTLG_ID,
        SUBCTLG_ID,
        USER_ID,
        TITLE,
        CONTENT,
        ATTMNT
      )
      VALUES (
        SYS_GUID,
        IS_CTLG_ID,
        IS_SUBCTLG_ID,
        IS_USER_ID,
        IS_TITLE,
        IS_CONTENT,
        ''
      );
      
  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_QSTN_NEW;


  PROCEDURE PROC_QSTN_QRY_KWD(
    IS_KEYWORD        IN      VARCHAR2,
    IS_CTLG_ID        IN      VARCHAR2,
    IS_SUBCTLG_ID     IN      VARCHAR2,
    IS_START_DATE     IN      VARCHAR2,
    IS_END_DATE       IN      VARCHAR2,
    IS_USER_ID        IN      VARCHAR2,
    IS_OWNER_FLAG     IN      VARCHAR2,
    IS_FULLTXT_FLAG   IN      VARCHAR2,
    II_BEGIN_POS       IN      INTEGER,
    II_FETCH_NUM       IN      INTEGER,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OI_TOTALNUM       OUT     INTEGER,
    OC_QSTN_CUR       OUT     QSTN_CUR
) AS

  BEGIN

    OI_FLAG :=0;

      OPEN  OC_QSTN_CUR FOR
        SELECT QSTN_ID,CTLG_NAME,SUBCTLG_NAME,USER_ID,TITLE,STATUS,REPLY_NO,ENT_DT,UPD_DT
        FROM(
            SELECT A.*, ROWNUM AS RN
            FROM(
              SELECT  Q.QSTN_ID,
                      C.CTLG_NAME,
                      SC.SUBCTLG_NAME,
                      Q.USER_ID,
                      Q.TITLE,
                      Q.STATUS,
                      Q.REPLY_NO,
                      Q.ENT_DT,
                      Q.UPD_DT
              FROM  QAHUB_QSTN Q, QAHUB_CTLG C, QAHUB_SUBCTLG SC
              WHERE (Q.TITLE LIKE '%'||IS_KEYWORD||'%' OR
                    Q.CONTENT LIKE '%'||IS_KEYWORD||'%')AND
                    Q.ENT_TMS >= NVL(TO_TIMESTAMP(IS_START_DATE,'YYYYMMDD'), Q.ENT_TMS) AND
                    Q.ENT_TMS <= NVL((TO_TIMESTAMP(IS_END_DATE,'YYYYMMDD')+1), Q.ENT_TMS) AND
                    Q.CTLG_ID = NVL(IS_CTLG_ID, Q.CTLG_ID) AND
                    Q.SUBCTLG_ID = NVL(IS_SUBCTLG_ID, Q.SUBCTLG_ID) AND
                    Q.CTLG_ID = C.CTLG_ID AND
                    Q.SUBCTLG_ID = SC.SUBCTLG_ID
                    ORDER BY Q.ENT_TMS
              ) A
              WHERE ROWNUM<II_BEGIN_POS+II_FETCH_NUM
          )
          WHERE RN>=II_BEGIN_POS;

    SELECT COUNT(*) INTO OI_TOTALNUM
    FROM QAHUB_QSTN Q, QAHUB_CTLG C, QAHUB_SUBCTLG SC
    WHERE (Q.TITLE LIKE '%'||IS_KEYWORD||'%' OR
          Q.CONTENT LIKE '%'||IS_KEYWORD||'%')AND
          Q.ENT_TMS >= NVL(TO_TIMESTAMP(IS_START_DATE,'YYYYMMDD'), Q.ENT_TMS) AND
          Q.ENT_TMS <= NVL((TO_TIMESTAMP(IS_END_DATE,'YYYYMMDD')+1), Q.ENT_TMS) AND
          Q.CTLG_ID = NVL(IS_CTLG_ID, Q.CTLG_ID) AND
          Q.SUBCTLG_ID = NVL(IS_SUBCTLG_ID, Q.SUBCTLG_ID) AND
          Q.CTLG_ID = C.CTLG_ID AND
          Q.SUBCTLG_ID = SC.SUBCTLG_ID;

  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      OI_TOTALNUM :=0;
    
  END PROC_QSTN_QRY_KWD;


  PROCEDURE PROC_QSTN_QRY(
      IS_QSTN_ID        IN      VARCHAR2,
      OI_FLAG           OUT     INTEGER,
      OS_ERRCODE        OUT     VARCHAR2,
      OS_MSG            OUT     VARCHAR2,
      OC_QSTN_DTL_CUR   OUT     QSTN_DTL_CUR
  ) AS
  BEGIN
    
    OI_FLAG :=0;
    
    OPEN OC_QSTN_DTL_CUR FOR
    SELECT Q.QSTN_ID,
           C.CTLG_NAME,
           SC.SUBCTLG_NAME,
           Q.USER_ID,
           Q.TITLE,
           Q.CONTENT,
           Q.STATUS,
           Q.REPLY_NO,
           Q.ENT_DT,
           Q.UPD_DT
    FROM  QAHUB_QSTN Q, QAHUB_CTLG C, QAHUB_SUBCTLG SC
    WHERE Q.QSTN_ID = IS_QSTN_ID AND
          Q.CTLG_ID = C.CTLG_ID AND
          Q.SUBCTLG_ID = SC.SUBCTLG_ID;
    
  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_QSTN_QRY;

  PROCEDURE PROC_QSTN_ANS_QRY(
    IS_QSTN_ID        IN      VARCHAR2,
    II_BEGIN_POS       IN     INTEGER,
    II_FETCH_NUM       IN     INTEGER,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OI_TOTALNUM       OUT     INTEGER,
    OC_QSTN_DTL_CUR   OUT     QSTN_DTL_CUR,
    OC_ANS_CUR        OUT     ANS_CUR
  ) AS
  BEGIN

    OI_FLAG :=0;
  
    PROC_QSTN_QRY(
        IS_QSTN_ID,
        OI_FLAG,
        OS_ERRCODE,
        OS_MSG,
        OC_QSTN_DTL_CUR
    );
    
    OPEN OC_ANS_CUR FOR
    SELECT ANS_ID,USER_ID,CONTENT,ENT_DT,UPD_DT
      FROM
      (
          SELECT A.*, ROWNUM RN
            FROM
            (
              SELECT ANS_ID,
                     USER_ID,
                     CONTENT,
                     ENT_DT,
                     UPD_DT
                FROM QAHUB_ANS
                WHERE QSTN_ID = IS_QSTN_ID
            ) A WHERE ROWNUM<II_BEGIN_POS+II_FETCH_NUM
      ) WHERE RN>=II_BEGIN_POS;


    SELECT COUNT(*)
    INTO OI_TOTALNUM
    FROM QAHUB_ANS
    WHERE QSTN_ID = IS_QSTN_ID;

  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;

  END PROC_QSTN_ANS_QRY;

PROCEDURE PROC_QSTN_PRE_UPD(
    IS_QSTN_ID        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OC_QSTN_UPD_CUR   OUT     QSTN_UPD_CUR
) AS

  V_CTL_FLAG VARCHAR2(1);
  
  V_QSTN_ID         VARCHAR2(32);
  V_CTLG_ID         VARCHAR2(32);
  V_SUBCTLG_ID      VARCHAR2(32);
  V_USER_ID         VARCHAR2(50);
  V_TITLE           VARCHAR2(90);
  V_CONTENT         VARCHAR2(4000);
  V_STATUS          VARCHAR(1);
  V_REPLY_NO        NUMBER(10,0);
  V_ENT_DT          VARCHAR2(16);
  V_UPD_DT          VARCHAR2(16);
  V_ENT_TMS         TIMESTAMP;
  V_UPD_TMS         TIMESTAMP;

  BEGIN
  
    SELECT CTL_FLAG INTO V_CTL_FLAG
    FROM QAHUB_QSTN_DTL
    WHERE QSTN_ID = IS_QSTN_ID;
    
    IF V_CTL_FLAG ='1' THEN
      OI_FLAG     :=-1;
    ELSE

    SELECT  QSTN_ID,CTLG_ID,SUBCTLG_ID,USER_ID,TITLE,CONTENT,STATUS,
            REPLY_NO,ENT_DT,UPD_DT,ENT_TMS,UPD_TMS
      INTO  V_QSTN_ID,V_CTLG_ID,V_SUBCTLG_ID,V_USER_ID,V_TITLE,V_CONTENT,
            V_STATUS,V_REPLY_NO,V_ENT_DT,V_UPD_DT,V_ENT_TMS,V_UPD_TMS
      FROM QAHUB_QSTN WHERE QSTN_ID=IS_QSTN_ID;

    INSERT INTO QAHUB_QSTN_DTL (QSTN_SEQ,QSTN_ID,CTLG_ID,SUBCTLG_ID,USER_ID,TITLE,CONTENT,ATTMNT,STATUS,REC_TMS)
      VALUES(
            SYS_GUID,
            V_QSTN_ID,
            V_CTLG_ID,
            V_SUBCTLG_ID,
            V_USER_ID,
            V_TITLE,
            V_CONTENT,
            V_STATUS,
            V_REPLY_NO,
            V_ENT_TMS
            );
      
    OPEN  OC_QSTN_UPD_CUR FOR
      SELECT  QSTN_ID,CTLG_ID,SUBCTLG_ID,USER_ID,TITLE,CONTENT,
              STATUS,REPLY_NO,ENT_DT,UPD_DT,ENT_TMS,UPD_TMS
        FROM  QAHUB_QSTN WHERE QSTN_ID=IS_QSTN_ID;
    
    COMMIT;
    
    END IF;
    
  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_QSTN_PRE_UPD;

PROCEDURE PROC_QSTN_UPD(
    IS_QSTN_ID        IN      VARCHAR2,
    IS_CTLG_ID        IN      VARCHAR2,
    IS_SUBCTLG_ID     IN      VARCHAR2,
    IS_TITLE          IN      VARCHAR2,
    IS_CONTENT        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
) AS
  BEGIN

    OI_FLAG := 0;

    UPDATE QAHUB_QSTN SET 
      CTLG_ID     = IS_CTLG_ID,
      SUBCTLG_ID  = IS_SUBCTLG_ID,
      TITLE       = IS_TITLE,
      CONTENT     = IS_CONTENT
    WHERE QSTN_ID = IS_QSTN_ID;
    
  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_QSTN_UPD;

PROCEDURE PROC_QSTN_DEL(
    IS_QSTN_ID        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
) AS
  BEGIN
  
    OI_FLAG := 0;

    UPDATE QAHUB_QSTN SET 
      DEL_FLAG = '1'
    WHERE QSTN_ID = IS_QSTN_ID;
     
  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_QSTN_DEL;


PROCEDURE PROC_ANS_NEW(
    IS_QSTN_ID        IN      VARCHAR2,
    IS_USER_ID        IN      VARCHAR2,
    IS_CONTENT        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
) AS
  BEGIN
  
    OI_FLAG := 0;
    
    INSERT INTO QAHUB_ANS(
      QSTN_ID,
      ANS_ID,
      USER_ID,
      CONTENT
    )
    VALUES(
      IS_QSTN_ID,
      SYS_GUID,
      IS_USER_ID,
      IS_CONTENT
    );
    
  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_ANS_NEW;

PROCEDURE PROC_ANS_QRY(
    IS_ANS_ID         IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OC_ANS_CUR        OUT     ANS_CUR
) AS
  BEGIN
    
    OI_FLAG := 0;
    
    OPEN OC_ANS_CUR FOR
      SELECT ANS_ID,USER_ID,CONTENT,ENT_DT,UPD_DT
        FROM QAHUB_ANS
          WHERE ANS_ID = IS_ANS_ID;

  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_ANS_QRY;


PROCEDURE PROC_ANS_PRE_UPD(
    IS_ANS_ID         IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2,
    OC_ANS_CUR        OUT     ANS_CUR
) AS
  BEGIN

    PROC_ANS_QRY(
      IS_ANS_ID => IS_ANS_ID,
      OI_FLAG => OI_FLAG,
      OS_ERRCODE => OS_ERRCODE,
      OS_MSG => OS_MSG,
      OC_ANS_CUR => OC_ANS_CUR
    );
    
  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_ANS_PRE_UPD;

PROCEDURE PROC_ANS_UPD(
    IS_ANS_ID         IN      VARCHAR2,
    IS_CONTENT        IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
) AS
  BEGIN
    
    OI_FLAG := 0;
    
    UPDATE QAHUB_ANS SET CONTENT = IS_CONTENT
    WHERE ANS_ID = IS_ANS_ID;
    
  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_ANS_UPD;
  
PROCEDURE PROC_ANS_DEL(
    IS_ANS_ID         IN      VARCHAR2,
    OI_FLAG           OUT     INTEGER,
    OS_ERRCODE        OUT     VARCHAR2,
    OS_MSG            OUT     VARCHAR2
) AS
  BEGIN

    OI_FLAG := 0;

    UPDATE QAHUB_ANS SET DEL_FLAG = '1'
      WHERE ANS_ID = IS_ANS_ID;
      
  EXCEPTION
    WHEN OTHERS THEN
      OI_FLAG     :=-1;
      OS_ERRCODE  :=SQLCODE;
      OS_MSG      :=SQLERRM;
      
  END PROC_ANS_DEL;

END PCKG_QAHUB_QSTN_ANS;
/
