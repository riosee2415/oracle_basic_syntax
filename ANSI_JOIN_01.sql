/*
내부조인

    기존문법
    **************************************************************
    SELECT
            A.COLUMN_01,
            A.COLUMN_02,
            B.COLUMN_01,
            B.COLUMN_02
      FROM  TABLE   A, TABLE    B
     WHERE  A.COLUMN_01 = B.COLUMN_01   <- 조인조건
    **************************************************************

    ANSI문법
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
 외부조인
 
       기존문법
       **************************************************************
       SELECT
               A.COLUMN_01,
               A.COLUMN_02,
               B.COLUMN_01,
               B.COLUMN_02
         FROM  TABLE   A, TABLE    B
        WHERE  A.COLUMN_01 = B.COLMN_01(+);
        **************************************************************
    
        ANSI문법
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
    FULL OUTER JOIN은 외부 조인의 하나로 ANSI조인에서만 제공하는 기능이다.
    각각의 테이블에 데이터가 없더라도 (+) 기능을 부여하여 조회가 가능하다.
*/

SELECT
        NVL(A.EMP_ID, '0'),
        NVL(B.EMP_ID, '0')
  FROM  HONG_A  A
  FULL  OUTER
  JOIN  HONG_B  B
    ON  A.EMP_ID = B.EMP_ID;


/*
    DEPT.DEPTNO(이하 D)의 데이터는 10, 20, 30, 40이고,
    EMP.DEPTNO(이하 E)의 데이터는 10, 20, 30이다.
    D의 데이터는 4개, E의 데이터는 3개이며, E의 DEPTNO는 D의 DEPTNO를 FK로 참조하고 있다.
    E의 데이터가 모자라기 때문에 LEFT OUTER E 를 사용하여 (+) 의 효과를 낼 수 있다.
*/

SELECT DISTINCT
        D.DEPTNO AS D,
        E.DEPTNO AS E
  FROM  DEPT   D
  LEFT  OUTER
  JOIN  EMP E
    ON  E.DEPTNO = D.DEPTNO;
    
    
