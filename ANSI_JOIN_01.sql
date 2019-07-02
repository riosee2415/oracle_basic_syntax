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
 
