
/*
    PARAMETER TYPE
    - IN    : SQL�� �� ����
    - OUT   : PROGRAM���� �� ����
    - INOUT : SQL�� �� ���� �� PROGRAM���� �� ����
*/

--���̺� ����
CREATE TABLE TEST_TB
(
    COLUMN_01   INTEGER         PRIMARY KEY,
    COLUMN_02   NUMBER(5)       NOT NULL,
    COLUMN_03   VARCHAR2(10),
    COLUMN_04   VARCHAR2(10),
    COLUMN_05   VARCHAR2(10)
);

-- DROP TABLE TEST_TB;

--������ ����--
/*
    �ڵ������� �����ϱ� (INCREAMENT BY 1 = 1�� ����, START WITH = 1 = 1���� ������ �ǹ�
    ����Ŭ������ ������ ������ ���̺� ��Ī�� �پ����� �ʰ� ������ ��������� ����.
*/

CREATE SEQUENCE TEST_TB_SEQ INCREMENT BY 1 START WITH 1;
-- DROP TEST_TB_SEQ;

--Ŀ������
/* 
    DECLARE
        ��������    ���̺��.�÷���%TYPE;
        ��������    VARCHAR2(200);
        ...
    CURSOR Ŀ���� IS
        ������ ������(SELECT);
    BEGIN
        OPENĿ����;                                    --Ŀ���� ����
        LOOP                                          --������ ���鼭 �� �྿
            FETCH Ŀ���� INTO ������, ...;              --�÷����� ������ ��´� (���� �߿�)
            EXIT WHEN �÷���%NOTFOUND;                 --�ش�ο츦 �߰��� �� ���ٸ� ������ Ż��
        END LOOP;
        CLOSE Ŀ����
    END;
*/


SELECT * FROM TEST_TB;


-- Ŀ�� ����
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
    ���ν��� ����
CREATE OR REPLACE PROCEDURE ���ν�����
(
    �������� IN     Ÿ��,
    �������� OUT    Ÿ��,
    ... ... ,
)
IS
    COURSOR cSor IS
        SELECT COLUMN_01, COLUMN_02 FROM TEST_TB;   -- Ŀ��

    AAA VARCHAR(30);                                      --���� ���
    BBB VARCHAR(30);                                      --���� ���
BEGIN
    OPEN Ŀ����;
    LOOP
        FETCH cSor INTO AAA, BBB;                          -- Ŀ���� �÷�������, ������ ������ ��ġ�ؾ� �Ѵ�.
        EXIT WHEN �÷���%NOTFOUNT
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

-- ���ν��� ���� (�ٸ�â���� �����ؾ� ��)
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

--���ν��� ����
SET serveroutput on
EXECUTE INSERT_PROC_01(12, '13', '14', '15');
EXECUTE INSERT_PROC_01(22, '23', '24', '25');






