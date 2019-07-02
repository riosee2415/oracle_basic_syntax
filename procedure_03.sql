/*
    ���ν����� ��Ű��
    - ���α׷� ���� ������ ������ ���� ���� �ϱ� ���ؼ� ���α׷� �ڵ带 �������� ������ ��.
    - 1���� ��Ű�� ���� �������� ���ν����� �����Ѵ�.
    
    ������ ���ν���
    - �����ͺ��̽� ���� �����ϵǾ� ����� ���ν���
    - �����ͺ��̽��� ����� ���ν����� ������Ʈ�� �����ȴ�.
    
    ���ν����� ����ϴ� ����
    - Ư�� ������ �۾��� �ذ��ϱ� ���ؼ� ���ȴ�.
    - Ư�� ����� ����ϴ� ��� ������ �Ǿ��ִ�.
    - ������ �����ϴ�.
    - ������ ���ν����� ���ؼ��� �����͸� �������� �� �־� ������ ���ȴ�.
    - ���ν����� ������ �޸� �ڿ��� �̿��Ѵ�.
    
    ���ν����� �Լ�
    - ���� ����� ������ �ٸ���.
    - ���ν��� : ���� ���� ������ ó���Ѵ�.
    - �Լ�    : �ϳ��� ���� Return �Ѵ�.
    
        ******************************************************************************************************
        �� OR REPLACE    : ���ν����� �̹� ������ ��� �����. �׻� ����ϴ� ���� ����
        �� IN            : ȣ��Ǵ� ���ν����� ���� �����ϴ� ���� ����
        �� OUT           : ���ν����� ȣ���� ���α׷����� ���� ��ȯ�Ѵٴ� ���� ����
        �� INOUT         : IN + OUT
        ******************************************************************************************************
*/



/*
    CREATE OR REPLACE PROCEDURE ���ν����̸�
    (
        IN
        OUT
        INOUT
    )
    IS
        [����, ��� �� ����;]
    BEGIN
        PL/SQL ����;
    [ESCEPTION
        ����ó����]
    END [���ν����̸�];
*/


CREATE TABLE JOBS
(
    JOB_ID      NUMBER          PRIMARY KEY,
    JOB_TITLE   VARCHAR2(30)    NOT NULL,
    MIN_SALARY  NUMBER(10)      NOT NULL,
    MAX_SALARY  NUMBER(10)      NOT NULL,
    CREATE_DATE DATE,
    UPDATE_DATE DATE            NOT NULL  
);


CREATE SEQUENCE JOBS_SEQ
START WITH      1
INCREMENT BY    1;



CREATE OR REPLACE PROCEDURE NEW_JOB_PROC
(
    P_JOB_ID        IN      JOBS.JOB_ID%TYPE,
    P_JOB_TITLE     IN      JOBS.JOB_TITLE%TYPE,
    P_MIN_SAL       IN      JOBS.MIN_SALARY%TYPE,
    P_MAX_SAL       IN      JOBS.MAX_SALARY%TYPE
)
IS

BEGIN
    INSERT INTO JOBS
    (
        JOB_ID,
        JOB_TITLE,
        MIN_SALARY,
        MAX_SALARY,
        CREATE_DATE,
        UPDATE_DATE
    )
    VALUES
    (
        P_JOB_ID,
        P_JOB_TITLE,
        P_MIN_SAL,
        P_MAX_SAL,
        SYSDATE,
        SYSDATE
    );
    COMMIT;
END;


EXECUTE NEW_JOB_PROC(1, 'aaa', 1000, 3000);

SELECT * FROM JOBS;


CREATE OR REPLACE PROCEDURE NEW_JOB_PROC
(
    P_JOB_ID        IN      JOBS.JOB_ID%TYPE,
    P_JOB_TITLE     IN      JOBS.JOB_TITLE%TYPE,
    P_MIN_SAL       IN      JOBS.MIN_SALARY%TYPE,
    P_MAX_SAL       IN      JOBS.MAX_SALARY%TYPE    
)
IS
    vn_cnt NUMBER := 0;
BEGIN
    -- ������ ������ �ִ��� Ȯ��
    SELECT
            COUNT(JOB_ID)
      INTO  vn_cnt      
      FROM  JOBS
     WHERE  JOB_ID = P_JOB_ID;

    -- ������ INSERT
    IF vn_cnt = 0 THEN
        INSERT INTO JOBS
        (
            JOB_ID,
            JOB_TITLE,
            MIN_SALARY,
            MAX_SALARY,
            CREATE_DATE,
            UPDATE_DATE
        )
        VALUES
        (
            P_JOB_ID,
            P_JOB_TITLE,
            P_MIN_SAL,
            P_MAX_SAL,
            SYSDATE,
            SYSDATE
        );
    -- ������ ������Ʈ
    ELSE
        UPDATE  JOBS
           SET  JOB_TITLE    = P_JOB_TITLE,
                MIN_SALARY   = P_MIN_SAL,
                MAX_SALARY   = P_MAX_SAL,
                UPDATE_DATE  = SYSDATE
         WHERE  JOB_ID       = P_JOB_ID;
    END IF;
    COMMIT;
END;
    

SELECT * FROM JOBS;

EXECUTE NEW_JOB_PROC(3, 'ccc', 2000, 3100);



