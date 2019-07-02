/*
    PL/SQL�̶�?
    - Procedural Language / Structured Query Language
    - SQL�� ���α׷��� ��� ���� ����� ���������� �߰��� ��
    - ������ ĸ��ȭ, ����ó��, ���� ����, ��ü ���� ���� ���� S/W���� ��� ����
    - SQL���� ��� ���� �� ���ν��� ���� �ڵ忡 ���Խ�ų �� �ִ� ������ Ʈ����� ó�� ���


    PL/SQL ó������
    - ����Ŭ ���� �����Ϸ����� PL/SQL����� �����ϸ� Oracle Server ���� PL/SQL������ �̸� ó���Ѵ�.
    - PL/SQL ������ ��� ���� SQL���� �и��Ͽ� �ϳ��� SQL�� �����ڷ� �����Ѵ�.
    - PL/SQL �ڵ�� Oracle Server�� ������ �� ������, �̸� �տ� Stored�� �ٿ� �θ���.
    
    �� ��Ű�� Ȯ��
    SELECT
            OBJECT_NAME
      FROM  DBA_OBJECTS
     WHERE  OWNER       = 'SYS'
       AND  OBJECT_TYPE = PACKAGE';
    
    
    PL/SQL Block ����
    ******************************************************************
    DECLARE
            ���� ����;
    BEGIN
            ���α׷� �ڵ�;
    EXCEPTION
            ���� ó����;
    END;
    ******************************************************************
    
    - ���� ����    :   ������ ����� ������ ����. Ŀ�� ���ǿ� ��ø�� PL/SQL�Լ��� ���⼭ ����.
    - ���α׷� �ڵ�  :   ���� �����ϴ� PL/SQL��.
    - ����ó����     :   ��Ÿ�� ������ ���� �߻��� Ʈ���� �Ǵ� ���α׷� �ڵ�.
    - �� ������ ������ ���� �˸��� ���� �ݵ�� (;)�� ���δ�.
    - BEGIN ���� �ٸ� ���� ������ �� �ִ�.
    
*/

--[����1] ������ �ۼ��� ����
DECLARE
    X   NUMBER;
BEGIN
    X   :=  100;
END;


--[����2] ��� ����ϱ�
/*
    - ����� DBMS_OUTPUT ��Ű���� ����Ѵ�.
    - ��Ű�� �ȿ� DBMS_OUTPUT.PUT_LINE ���ν��� ���.
    - ����� SQL*PLUS���� ������ SET SERVEROUTPUT ON �� ���� �����ؾ��Ѵ�
*/
DECLARE
    x   NUMBER;
BEGIN
    x   := 65400;
    DBMS_OUTPUT.PUT_LINE('The variable x = ');
    DBMS_OUTPUT.PUT_LINE(x);
END;   



--[����3] �Լ� �ۼ��ϱ�
CREATE OR REPLACE FUNCTION TEST_FUNC
RETURN NUMBER AS
    x   NUMBER;
BEGIN
    x   := 100;
    RETURN x;
END;


-- OR REPLACE�� ���� �ڵ尡 �ִ� ��� ����⸦ �϶�� �ǹ��̴�.

--[���Ȯ��]
SELECT TEST_FUNC FROM DUAL;


-- Anonym us Block (�̸� ���� ���)
/*
    - �ƹ��� �̸��� ���� ������ ���ν����� �Լ�, Ʈ���� ������ �������� �ʴ� ��
    - DECALRE��� ���� ����Ͽ� �����ϰ� ���� ������� BEGIN ���̿� ������ �����Ѵ�.
    - BEGIN ������ ���� ������ �κ��� ���۵ǳ��� ���� �˷��ش�. ���α׷� �ڵ尡 �ش�ȴ�.
    - EXCEPTION ������ ������ ����ó�� �ڵ带 ���´�.
*/

