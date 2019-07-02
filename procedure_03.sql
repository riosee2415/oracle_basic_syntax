/*
    프로시저와 패키지
    - 프로그램 유지 보수와 실행을 보다 쉽게 하기 위해서 프로그램 코드를 논리적으로 구성한 것.
    - 1개의 패키지 내에 여러개의 프로시저가 존재한다.
    
    스토어드 프로시저
    - 데이터베이스 내에 컴파일되어 저장된 프로시저
    - 데이터베이스에 저장된 프로시저는 오브젝트로 관리된다.
    
    프로시저를 사용하는 이유
    - 특정 문제나 작업을 해결하기 위해서 사용된다.
    - 특정 기능을 담당하는 모듈 단위로 되어있다.
    - 재사용이 가능하다.
    - 스토어드 프로시저를 통해서만 데이터를 엑세스할 수 있어 보안이 향상된다.
    - 프로시저는 공유된 메모리 자원을 이용한다.
    
    프로시저와 함수
    - 둘은 출력의 형식이 다르다.
    - 프로시저 : 많은 양의 정보를 처리한다.
    - 함수    : 하나의 값을 Return 한다.
    
        ******************************************************************************************************
        ◎ OR REPLACE    : 프로시저가 이미 존재할 경우 덮어쓴다. 항상 사용하는 것이 좋다
        ◎ IN            : 호출되는 프로시저에 값을 전달하는 것을 지정
        ◎ OUT           : 프로시저를 호출한 프로그램에게 값을 반환한다는 것을 지정
        ◎ INOUT         : IN + OUT
        ******************************************************************************************************
*/



/*
    CREATE OR REPLACE PROCEDURE 프로시저이름
    (
        IN
        OUT
        INOUT
    )
    IS
        [변수, 상수 등 선언;]
    BEGIN
        PL/SQL 본문;
    [ESCEPTION
        예외처리문]
    END [프로시저이름];
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
    -- 동일한 쿼리가 있는지 확인
    SELECT
            COUNT(JOB_ID)
      INTO  vn_cnt      
      FROM  JOBS
     WHERE  JOB_ID = P_JOB_ID;

    -- 없으면 INSERT
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
    -- 있으면 업데이트
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



