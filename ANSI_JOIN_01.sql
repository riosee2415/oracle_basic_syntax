/*
��������

    ��������
    **************************************************************
    SELECT
            A.COLUMN_01,
            A.COLUMN_02,
            B.COLUMN_01,
            B.COLUMN_02
      FROM  TABLE   A, TABLE    B
     WHERE  A.COLUMN_01 = B.COLUMN_01   <- ��������
    **************************************************************

    ANSI����
    **************************************************************
    SELECT
            A.COLUMN_01,
            A.COLUMN_02,
            B.COLUMN_01,
            B.COLUMN_02
      FROM  TABLE   A
     INNER  
      JOIN  TABLE   B
        ON  A.COLUMN_01 = B.COLUMN_01
     WHERE  ... ...
    **************************************************************
    
*/
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT
        A.ENAME,
        A.JOB,
        A.SAL,
        B.DEPTNO,
        B.DNAME
  FROM  EMP A
 INNER  
  JOIN  DEPT B
    ON  A.DEPTNO = B.DEPTNO
 WHERE  B.DEPTNO    IN (20, 30);
 
 
 /*
 �ܺ�����
 
       ��������
       **************************************************************
       SELECT
               A.COLUMN_01,
               A.COLUMN_02,
               B.COLUMN_01,
               B.COLUMN_02
         FROM  TABLE   A, TABLE    B
        WHERE  A.COLUMN_01 = B.COLMN_01(+);
        **************************************************************
    
        ANSI����
        **************************************************************
        SELECT
                A.COLUMN_01,
                A.COLUMN_02,
                B.COLUMN_01,
                B.COLUMN_02
          FROM  TABLE   A
          LEFT  OUTER
          JOIN  TABLE   B
            ON  A.COLUMN_01 = B.COLMN_01;
     
 */
 
SELECT
        A.ENAME,
        A.JOB,
        A.SAL,
        B.DEPTNO,
        B.DNAME
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO = B.DEPTNO(+)
 WHERE B.DEPTNO IN (20, 40);
 
 
    CREATE TABLE HONG_A  (EMP_ID INT);

    CREATE TABLE HONG_B  (EMP_ID INT);

    INSERT INTO HONG_A VALUES ( 10);

    INSERT INTO HONG_A VALUES ( 20);

    INSERT INTO HONG_A VALUES ( 40);

    INSERT INTO HONG_B VALUES ( 10);

    INSERT INTO HONG_B VALUES ( 20);

    INSERT INTO HONG_B VALUES ( 30);

    COMMIT;
    
    SELECT * FROM HONG_A;
    SELECT * FROM HONG_B;
    
/*
    FULL OUTER JOIN�� �ܺ� ������ �ϳ��� ANSI���ο����� �����ϴ� ����̴�.
    ������ ���̺� �����Ͱ� ������ (+) ����� �ο��Ͽ� ��ȸ�� �����ϴ�.
*/

SELECT
        NVL(A.EMP_ID, '0'),
        NVL(B.EMP_ID, '0')
  FROM  HONG_A  A
  FULL  OUTER
  JOIN  HONG_B  B
    ON  A.EMP_ID = B.EMP_ID;


/*
    DEPT.DEPTNO(���� D)�� �����ʹ� 10, 20, 30, 40�̰�,
    EMP.DEPTNO(���� E)�� �����ʹ� 10, 20, 30�̴�.
    D�� �����ʹ� 4��, E�� �����ʹ� 3���̸�, E�� DEPTNO�� D�� DEPTNO�� FK�� �����ϰ� �ִ�.
    E�� �����Ͱ� ���ڶ�� ������ LEFT OUTER E �� ����Ͽ� (+) �� ȿ���� �� �� �ִ�.
*/

SELECT DISTINCT
        D.DEPTNO AS D,
        E.DEPTNO AS E
  FROM  DEPT   D
  LEFT  OUTER
  JOIN  EMP E
    ON  E.DEPTNO = D.DEPTNO;
    
    
