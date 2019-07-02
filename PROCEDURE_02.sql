
/*
    PARAMETER TYPE
    - IN    : SQL로 값 전달
    - OUT   : PROGRAM으로 값 전달
    - INOUT : SQL로 값 전달 후 PROGRAM으로 값 전달
*/

--테이블 생성
CREATE TABLE TEST_TB
(
    COLUMN_01   INTEGER         PRIMARY KEY,
    COLUMN_02   NUMBER(5)       NOT NULL,
    COLUMN_03   VARCHAR2(10),
    COLUMN_04   VARCHAR2(10),
    COLUMN_05   VARCHAR2(10)
);

-- DROP TABLE TEST_TB;

--시퀀스 설정--
/*
    자동증가값 설정하기 (INCREAMENT BY 1 = 1씩 증가, START WITH = 1 = 1부터 시작을 의미
    오라클에서는 시퀀스 설정과 테이블 매칭이 붙어있지 않고 별도로 설저오디어 있음.
*/

CREATE SEQUENCE TEST_TB_SEQ INCREMENT BY 1 START WITH 1;
-- DROP TEST_TB_SEQ;

--커서문법
/* 
    DECLARE
        변수선언    테이블명.컬럼명%TYPE;
        변수선언    VARCHAR2(200);
        ...
    CURSOR 커서명 IS
        가져올 데이터(SELECT);
    BEGIN
        OPEN커서명;                                    --커서를 오픈
        LOOP                                          --루프를 돌면서 한 행씩
            FETCH 커서명 INTO 변수명, ...;              --컬럼값을 변수에 담는다 (순서 중요)
            EXIT WHEN 컬럼명%NOTFOUND;                 --해당로우를 발견할 수 없다면 루프를 탈출
        END LOOP;
        CLOSE 커서명
    END;
*/


SELECT * FROM TEST_TB;


-- 커서 예제
DECLARE
    COLUMN_01 VARCHAR2(30);
    COLUMN_02 VARCHAR2(30);
    COLUMN_03 VARCHAR2(30);
    COLUMN_04 VARCHAR2(30);
    COLUMN_05 VARCHAR2(30);
CURSOR cSor IS
    SELECT * FROM TEST_TB;
BEGIN
    OPEN cSor;
    LOOP
        FETCH cSor INTO COLUMN_01, COLUMN_02, COLUMN_03, COLUMN_04, COLUMN_05;
        EXIT WHEN cSor%NOTFOUND;
    END LOOP;
    CLOSE cSor;
END;                                            -- DECLARE CLOSE




/*
    프로시져 문법
CREATE OR REPLACE PROCEDURE 프로시저명
(
    변수선언 IN     타입,
    변수선언 OUT    타입,
    ... ... ,
)
IS
    COURSOR cSor IS
        SELECT COLUMN_01, COLUMN_02 FROM TEST_TB;   -- 커서

    AAA VARCHAR(30);                                      --변수 사용
    BBB VARCHAR(30);                                      --변수 사용
BEGIN
    OPEN 커서명;
    LOOP
        FETCH cSor INTO AAA, BBB;                          -- 커서의 컬럼갯수와, 변수의 갯수가 일치해야 한다.
        EXIT WHEN 컬럼명%NOTFOUNT
        DBMS_OUPPUT.PUTLINE(AAA || char(9) || BBB);
    END LOOP;
    CLOSE CURSOR;
END;

*/



CREATE OR REPLACE PROCEDURE SELECT_PROC_01
IS
    CURSOR cSor IS
        SELECT COLUMN_01, COLUMN_02 FROM TEST_TB;

AAA VARCHAR2(30);
BBB VARCHAR2(30);

BEGIN
    OPEN cSor;
    LOOP
        FETCH cSor INTO AAA, BBB;
            EXIT WHEN cSor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(AAA || chr(9) || BBB);
    END LOOP;
    CLOSE cSor;
END;

-- 프로시져 실행 (다른창에서 실행해야 함)
SET serveroutput on
    EXECUTE SELECT_PROC_01;
    
    
--INSERT PROCEDURE--
CREATE OR REPLACE PROCEDURE INSERT_PROC_01
(
    Column_02   IN  NUMBER,
    Column_03   IN  VARCHAR2,
    Column_04   IN  VARCHAR2,
    Column_05   IN  VARCHAR2
)
IS

BEGIN
    INSERT INTO TEST_TB
    (
    COLUMN_01,
    COLUMN_02,
    COLUMN_03,
    COLUMN_04,
    COLUMN_05
    )
    VALUES
    (
    TEST_TB_SEQ.NEXTVAL,
    Column_02,
    Column_03,
    Column_04,
    Column_05
    );
END;

--DROP PROCEDURE INSERT_PROC_01;
--SELECT * FROM TEST_TB;

--프로시저 실행
SET serveroutput on
EXECUTE INSERT_PROC_01(12, '13', '14', '15');
EXECUTE INSERT_PROC_01(22, '23', '24', '25');






