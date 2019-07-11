--1. �μ����� 4���� ���� �μ��� �μ���ȣ, �μ���, �μ��ο���, �޿��� ��, ��ձ޿��� ����ض�.
SELECT
        A.DEPTNO                AS "�μ���ȣ",
        B.DNAME                 AS "�μ���",
        COUNT(A.EMPNO)          AS "�μ��ο���",
        SUM(SAL)                AS "�޿��� ��",
        AVG(SAL)                AS "��ձ޿�"
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.DEPTNO    IN  (
                            SELECT
                                    DEPTNO
                              FROM  EMP
                             GROUP  BY DEPTNO
                            HAVING  COUNT(EMPNO)    > 4
                        )
 GROUP  BY  A.DEPTNO, B.DNAME;



--2. DEPT ���̺� �ִ� ��� �μ��� �Ʒ� �������� �μ���ȣ���� ����Ͻÿ�.
--  (����. ����� ���� �μ��� �������� ǥ���Ѵ�)
SELECT
        A.DEPTNO                        AS DEPTNO,
        A.DNAME                         AS DNAME,
        NVL(TO_CHAR(B.EMPNO), '����')   AS EMPNO,
        NVL(TO_CHAR(B.ENAME), '����')   AS ENAME
  FROM  DEPT    A
  LEFT  OUTER
  JOIN  EMP     B
    ON  A.DEPTNO    = B.DEPTNO;
    
    
    
--3. ��ü ����� ��� �ӱݺ��� �ӱ��� ���� ����� �����ȣ, �̸�, �μ���, �޿��� �޿��� ���� ������ ����Ͻÿ�.
SELECT
        A.EMPNO             AS "�����ȣ",
        A.ENAME             AS "�̸�",
        B.DNAME             AS "�μ���",
        A.SAL               AS "�޿�"
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.SAL       <   (
                            SELECT
                                    AVG(SAL)
                              FROM  EMP
                        )
 ORDER  BY A.SAL ASC;
 
 
 
 
--4. 10�� �μ��� ����� �߿��� 20�� �μ��� ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���, �Ի���, �μ������� ����ض�.

SELECT
        A.EMPNO	        AS "�����ȣ",
        A.ENAME         AS "�̸�",
        B.DNAME         AS "�μ���",
        A.HIREDATE      AS "�Ի���",
        B.LOC           AS "�μ�����"
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  JOB         IN  (
                            SELECT
                                    JOB
                              FROM  EMP
                             WHERE  DEPTNO  = '20'
                        );



--5. ��� ���̺��� �� ����� �����ȣ, �����, �Ŵ�����ȣ, �Ŵ������� ����ض�.
SELECT
        A.EMPNO     AS "�����ȣ",
        A.ENAME     AS "�����",
        B.EMPNO     AS "�Ŵ�����ȣ",
        B.ENAME     AS "�Ŵ�����"
  FROM  EMP A
  JOIN  EMP B
    ON  A.MGR   = B.EMPNO
   AND  A.SAL   > B.SAL;

    
    
   
--6. ��� �μ��� �μ��� ����Ǽ��� �Ʒ��� ���� �������� �μ���ȣ������ ����Ͻÿ�.
SELECT
        A.DEPTNO                AS DEPNO,
        A.DNAME                 AS DNAME,           
        NVL(COUNT(EMPNO), 0)    AS EMPNO_CNT
  FROM  DEPT    A
  LEFT  OUTER
  JOIN  EMP     B
    ON  A.DEPTNO = B.DEPTNO
 GROUP  BY  A.DEPTNO, A.DNAME;
 
 
 
--7. �Ի��Ϻ��� ���ݱ����� �ٹ������ 25�� �̻��� ����� �����ȣ, �����, �Ի���, �ٹ������ ����ض�.
--      �ٹ������ ���� ������ ����Ѵ�.

SELECT
        Z.EMPNO       AS "�����ȣ",
        Z.ENAME       AS "�����",
        Z.HIREDATE    AS "�Ի���",
        Z.WORKDATE    AS "�ٹ����"        
  FROM (
        SELECT  
                EMPNO,
                ENAME,
                HIREDATE,
                SUBSTR(TO_CHAR(SYSDATE, 'YYYYMMDD'), 1, 4)-SUBSTR(TO_CHAR(HIREDATE, 'YYYYMMDD'), 1, 4) AS WORKDATE
          FROM  EMP
         WHERE  SUBSTR(TO_CHAR(SYSDATE, 'YYYYMMDD'), 1, 4)-SUBSTR(TO_CHAR(HIREDATE, 'YYYYMMDD'), 1, 4) >= 25
        ) Z
  ORDER BY WORKDATE DESC;
                    
                  
  
--8. �� �μ� ���� �Ի����ڰ� ���� ���� ����� �� �� �����ؼ� �����ȣ, �����, �μ���ȣ, �Ի����� ����ض�.
--  �Ի����ڰ� ���� ������ ����Ѵ�.
SELECT
        EMPNO           AS "�����ȣ",
        ENAME           AS "�����",
        DEPTNO          AS "�μ���ȣ",
        HIREDATE        AS "�Ի���"
  FROM  EMP
 WHERE  (DEPTNO, HIREDATE)    IN   (
                                        SELECT
                                                DEPTNO,
                                                MIN(HIREDATE)
                                          FROM  EMP
                                         GROUP  BY DEPTNO
                                    )
 ORDER  BY  HIREDATE ASC;
 
 
 
                                    
--9. �ڽ��� ����ڰ� �������� ����ڸ��� �Ʒ��� ���� �������� ����Ͻÿ�.
SELECT
        A.EMPNO     AS "EMPNO",
        A.ENAME     AS "ENAME",
        B.EMPNO     AS "MGR",
        B.ENAME     AS "MGR_NIM"
  FROM  EMP A
  JOIN  EMP B
    ON  A.MGR   = B.EMPNO
   AND  A.SAL   > B.SAL;    
/*
    !. 5���̶� ������ ������ Ȯ��
*/



--10. ����� �ִ� �μ��߿��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, �μ���, ������, �ο����� �μ���ȣ, ������ ������ ����Ͻÿ�.

SELECT
        Z.DEPTNO,
        Z.DNAME,
        Z.JOB,
        Z.CNT
  FROM (
            SELECT
                    A.DEPTNO,                                                  
                    B.DNAME,
                    A.JOB,
                    COUNT(A.EMPNO) OVER( PARTITION BY A.JOB, B.DNAME ) AS CNT
              FROM  EMP     A
             INNER
              JOIN  DEPT    B
                ON  A.DEPTNO    = B.DEPTNO
             ORDER  BY DEPTNO, JOB
        ) Z
 GROUP  BY  Z.DEPTNO, Z.DNAME, Z.JOB, Z.CNT
 ORDER  BY DEPTNO, JOB;
        
        
        
      

--11. ��� �� ������ 2�� �̻� �Ǵ� ����� EMPNO, ENAME, DNAME, JUMIN_NO�� ����Ͻÿ�.
--SELECT * FROM EMPFAMILY;
--SELECT * FROM CODE;


SELECT
        A.EMPNO     AS EMPNO,
        A.ENAME     AS ENAME,
        B.DNAME     AS DNAME,
        C.EXT       AS JUMIN_NO
  FROM  EMP         A
 INNER
  JOIN  DEPT        B
    ON  A.DEPTNO    = B.DEPTNO
       AND  EMPNO   IN     (
                                SELECT
                                        EMPNO
                                  FROM  EMPFAMILY
                                 WHERE  FM_CD   IN (1, 2)
                                HAVING  COUNT(EMPNO) >= 2
                                 GROUP  BY  EMPNO
                            )
 INNER 
  JOIN  EMPDETAIL   C
    ON  C.EMPNO     = A.EMPNO;
    
    

--12. EMP ���̺��� ����� ������ ������ ������ �պ��� ���� ����� �����ȣ, �����, ����� ����, �����ǿ����� ���� �Ʒ� �������� ����Ͻÿ�
--  [������ ���Ե����ʰ� ����]
--  [������� : 7844    TURNER      $108,000    $10,000 ]
--  [           7369    SMITH       $13,200     $6,000  ]
--  ������ ���� (SAL) // ������ ���� (SAL + COMM)

SELECT
--        A.EMPNO||'  '||A.ENAME||'   '||Z.SAL||' '||Z.FM_SAL,
        A.EMPNO,
        A.ENAME,
        Z.SAL,
        Z.FM_SAL
  FROM  EMP     A
 INNER
  JOIN  (
            SELECT
                    FM_NO,
                    TO_CHAR((A.SAL + NVL(A.COMM, 0)), '$999,999,999') AS SAL,
                    TO_CHAR(Z.FM_SAL, '$999,999,999') AS FM_SAL
              FROM  EMP     A
             INNER
              JOIN  (
                        SELECT  
                                EMPNO           AS FM_NO,
                                SUM(SAL)        AS FM_SAL
                          FROM  EMPFAMILY  
                         GROUP  BY EMPNO
                     )      Z
                ON  A.EMPNO     = Z.FM_NO
               AND  A.SAL + NVL(A.COMM, 0) > Z.FM_SAL
        ) Z
    ON  A.EMPNO     = Z.FM_NO;



--13. EMP ���̺��� SAL �޿������ SALGRADE���̺��� ��� ��޿� ���ϴ��� �Ʒ� �������� ����Ͻÿ�.
SELECT
        A.EMPNO,
        A.SAL,               
        B.GRADE||'���'       AS GRADE
  FROM  EMP         A
 INNER
  JOIN  SALGRADE    B
    ON  A.SAL   >= B.LOSAL
   AND  A.SAL   <= B.HISAL;
   
   
   

--14. ������ �ִ� ����߿� ���� �������� ��� �Ǵ��� �Ʒ��� ���� �������� ����Ͻÿ�.
--SELECT * FROM CODE;


SELECT
        A.EMPNO,
        C.DNAME,
        A.ENAME,
        COUNT(CASE WHEN (B.FM_CD = '1' OR B.FM_CD = '2') THEN 1 END)||'��' AS "����",
        COUNT(CASE B.FM_CD WHEN '5' THEN 1 END)||'��' AS "�ڳ�",
        COUNT(CASE B.FM_CD WHEN '3' THEN 1 END)||'��' AS "�ƹ���",
        COUNT(CASE B.FM_CD WHEN '4' THEN 1 END)||'��' AS "��Ӵ�"
  FROM  EMP         A
 INNER
  JOIN  EMPFAMILY   B
    ON  A.EMPNO = B.EMPNO
 INNER
  JOIN  DEPT        C
    ON  A.DEPTNO = C.DEPTNO
 GROUP  BY  A.EMPNO, A.ENAME, C.DNAME;



--15. ��Į�� ���������� �̿��ؼ� ��������(GUBUN_NM)���� ǥ���ϰ� ������� ������ �Ʒ��� ���� ���·� EMPNO, ENAME,ó�� �ݺ��Ǵ� ���� ù��° �ο쿡 �ѹ��� �������� ����Ͻÿ�.
--SELECT * FROM EMPFAMILY;
-- �� ���� ��
--SELECT * FROM EMP;
/*
SELECT  
        CASE    WHEN A.EMPNO = LAG(A.EMPNO) OVER( ORDER BY A.EMPNO)     THEN '' ELSE TO_CHAR(A.EMPNO)   END AS EMPNO,
        CASE    WHEN A.ENAME = LAG(A.ENAME) OVER( ORDER BY A.ENAME)     THEN '' ELSE A.ENAME            END AS ENAME,
        CASE B.FM_CD
                    WHEN '1' THEN '����'
                    WHEN '2' THEN '����'
                    WHEN '3' THEN '��'
                    WHEN '4' THEN '��'
                    WHEN '5' THEN '��'
        END AS RELATION,
        B.NAME
  FROM  EMP         A
 INNER
  JOIN  EMPFAMILY   B
    ON  A.EMPNO     = B.EMPNO;
*/


   
 SELECT
            CASE TRIM((ROW_NUMBER()  OVER( PARTITION BY A.EMPNO ORDER BY A.EMPNO ))) WHEN '1' THEN TO_CHAR(A.EMPNO) 
                                                                                     WHEN '2' THEN ' '
                                                                                     WHEN '3' THEN ' '
                                                                                     WHEN '4' THEN ' '
            END AS EMPNO,
            CASE TRIM((ROW_NUMBER()  OVER( PARTITION BY A.EMPNO ORDER BY A.EMPNO ))) WHEN '1' THEN A.ENAME          
                                                                                     WHEN '2' THEN ' '
                                                                                     WHEN '3' THEN ' '
                                                                                     WHEN '4' THEN ' '
            END AS ENAME,
            CASE TRIM(B.FM_CD)
                        WHEN '1' THEN '����'
                        WHEN '2' THEN '����'
                        WHEN '3' THEN '��'
                        WHEN '4' THEN '��'
                        WHEN '5' THEN '��'
            END AS RELATION,
            B.NAME
      FROM  EMP         A
     INNER
      JOIN  EMPFAMILY   B
        ON  A.EMPNO = B.EMPNO
     INNER  
      JOIN  CODE   C
        ON  B.FM_CD = C.CODE
     ORDER  BY  A.EMPNO, A.ENAME;


    
/*
    CASE���� TRIM �Լ��� ����� ������
    SMITH(7369)�� 'SANTI CAZORLA' �̸��� ���� ������ FM_CD�� '4'�� �ƴ� '4 ' �� NULL�� ��� �Ǳ� ������ ������ ������ �ƴ�
    �Լ��� ������ ��ó�� �� CASE���� �����Ͽ����ϴ�.
*/








--16. ȸ�翡�� �������ø� �����Ͽ� �޿��� ���� ���Թ޴� ��� 4���� �ξ簡���� 1000���� ���� �޿��� �����Ϸ��� �Ѵ�.
--  (�޿��� ���������� ����� ��)

SELECT
        Z.EMPNO,
        Z.ENAME,
        Z.SAL,
        Z.SAL + 1000 *  (
                            SELECT
                                    COUNT(EMPNO)
                              FROM  EMPFAMILY
                             WHERE  Z.EMPNO = EMPNO
                        ) AS TOTAL_SAL,
        Z.DNAME
  FROM  (
            SELECT
                    A.EMPNO,
                    A.ENAME,
                    A.SAL,
                    B.DNAME
              FROM  EMP     A
             INNER 
              JOIN  DEPT    B
                ON  A.DEPTNO    = B.DEPTNO
             ORDER  BY SAL ASC
        ) Z
 WHERE  ROWNUM < 5
 ORDER  BY  TOTAL_SAL DESC;
 
        
        
        


 