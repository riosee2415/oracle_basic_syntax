--1. EMP���̺��� �̸�, �޿�, Ŀ�̼� �ݾ�, �޿��Ѿ�(sal + comm)�� ���Ͽ� �Ѿ��� ���� ������ ����Ͻÿ�.
-- �� order by �� alias�� �����ϴ°��� ���� 
SELECT
        ENAME               AS "�̸�",
        SAL                 AS "�޿�",
        NVL(COMM, 0)        AS "Ŀ�̼� �ݾ�",
        SAL + NVL(COMM, 0)  AS "�޿��Ѿ�"        
  FROM  EMP
 ORDER  BY  �޿��Ѿ� DESC;
 
 
 
--2. EMP ���̺��� 10�� �μ��� ��� ����鿡�� �޿��� 15%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����Ͻÿ�.
-- X �޿��� ���ʽ��ݾ��� ���� ���ؾ��� , 

SELECT
        ENAME,
        SAL,
        CASE DEPTNO
                WHEN 10 THEN SAL * 0.15
                ELSE 0
        END AS BONUS,
        DEPTNO
  FROM  EMP;
  
  
  
--3. EMP ���̺��� 30�� �μ��� ������ ����Ͽ� �̸�, �μ���ȣ, �޿�, ������ ����Ͻÿ�.
SELECT  
        ENAME,
        DEPTNO,
        SAL * 12 AS ySAL
  FROM  EMP
 WHERE  DEPTNO = 30;
 
 
 
--4. EMP ���̺��� �μ���ȣ�� 20�� �μ��� �ð��� �ӱ��� ����Ͽ� �̸�,�޿�,�ñ�(�Ҽ��� 2��° �ڸ����� �ݿø�)�� ����Ͻÿ�.
-- X. �ñް���� �߸��� . �����Ʒ��� �ٹ��ϼ� , �ٹ��ð��� ǥ��Ǿ����� , 
/*
    ANSER : ���� �޿� ��� ��, LAST_DAY �����Լ��� �ش� ���� ������ �����Ͽ� ����մϴ�.
*/
-- ���࿡ �ٹ��ϼ��� ���������� ������쵵 �Ѵ��ϼ��� �ٸ��⶧���� �ϼ��� 30���� ���Ͽ� ������ �ȵ�, 

SELECT
        ENAME,
        SAL,
        ROUND((SAL / 12 / 5), 2) AS hourSAL
  FROM  EMP
 WHERE  DEPTNO = 20;
 
 

--5. EMP ���̺��� �޿��� 1,500���� 3,000 ������ ����� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���.
--   ȸ�� ���� ���� ������ �Ͽ� ��� ����� �̸�, �����ȣ, �޿�, ȸ��(�Ҽ��� �ι�° �ڸ����� �ݿø�)�� ����Ͻÿ�.
-- X ���� ������

SELECT
        ENAME,
        EMPNO,
        SAL,
        CASE WHEN (SAL >= 1500 AND SAL <= 3000) THEN SAL * 0.15
             ELSE 0
        END AS mPay
  FROM  EMP
 ORDER  BY mPay DESC;
  
 
 
--6. EMP���̺��� �Ի��Ϻ��� ��������� �ٹ��ϼ��� �����ϼ��� ���������� 
--  �̸�, �ٹ��ϼ�, �μ���ȣ, �Ի���, �������� �Ʒ� �������� ����Ͻÿ� ((�Ҽ��� ���ϴ� ����))
SELECT
        ENAME AS "�����",
        TRUNC(SYSDATE - HIREDATE) || '��'   AS "�ٹ��ϼ�",
        TO_CHAR(HIREDATE, 'YYYY.MM.DD')     AS "�Ի���",
        TO_CHAR(SYSDATE, 'YYYY.MM.DD')      AS "������"
  FROM  EMP;
  
  

--7. EMP���̺��� ����̸�, �Ի���, �޿�, �Ի��Ϸκ��� 90�� ���� ��¥�� ����Ͻÿ�.
SELECT  
        ENAME           AS "����̸�",
        HIREDATE        AS "�Ի���",
        SAL             AS "�޿�",
        HIREDATE + 90   AS "90�� ���"
  FROM  EMP;
  

--8. EMP���̺��� ����̸�, �Ի���, �޿�, �Ի��Ϸκ��� 6���� ���� ��¥�� ����Ͻÿ�.
SELECT  
        ENAME                     AS "����̸�",
        HIREDATE                  AS "�Ի���",
        SAL                       AS "�޿�",
        ADD_MONTHS(HIREDATE, 6)   AS "6���� ���"
  FROM  EMP;
  
  

--9. EMP ���̺��� �Ի��� ���� �ٹ��ϼ��� ����Ͽ� ����� �μ���ȣ, �̸�, �ٹ��ϼ��� ����Ͻÿ�.
SELECT  
        ENAME                           AS "����̸�",
        DEPTNO                          AS "�μ���ȣ",
        LAST_DAY(HIREDATE) - HIREDATE   AS "�ٹ��ϼ�"
  FROM  EMP;
  
  

--10. EMP���̺��� �̸��� FIRST NAME�� ù ���ڿ� LAST NAME�� ù ���ڸ� �ҹ��ڷ� �����Ͽ� ��� ������ �̸��� ���� �������� �����Ͻÿ�. 

SELECT
        INSTR(NAME, ' '),
        LOWER(SUBSTR(NAME, 1, 1)) || SUBSTR(NAME, 2, INSTR(NAME, ' ')-1) || LOWER(SUBSTR(NAME, INSTR(NAME, ' '), 2)) || SUBSTR(NAME,  INSTR(NAME, ' ')+2)
  FROM  EMPFAMILY;
  
  
--11. �Ʒ��� ���� ����� �������� ������ �ۼ��Ͻÿ� (EMPDETAIL)

SELECT * FROM EMPDETAIL;

SELECT
        EMPNO,
        JUSO1 ||  SUBSTR(JUSO2, 1, INSTR(JUSO2, ' '))|| LPAD(SUBSTR(JUSO2, -(LENGTH(JUSO2) - INSTR(JUSO2, ' '))), 5 , 0) AS NEW_JUSO
  FROM  EMPDETAIL;
  
  
  
  
--12. EMPDETAIL ���̺��� ����ȣ�� �ֹι�ȣ�� �Ʒ��������� EMPNO, POSTNO, JUMIN_NO, ���� ������ ����Ͻÿ� 
--(�ֹι�ȣ 7��° �ڸ� ���� ���� ����)


SELECT
        EMPNO,
        SUBSTR(POSTNO,1, 3) || '-' || LPAD(SUBSTR(POSTNO, 4), 3, 0) AS POSTNO,
        SUBSTR(EXT, 1, 6) || '-' || SUBSTR(EXT, 7, 1) ||  REGEXP_REPLACE(SUBSTR(EXT, 8), '[0-9]', '*') AS JUMIN_NO,
        CASE TO_CHAR(SUBSTR(EXT, 7, 1)) -- �� EXT�� VARCHAR2���̱� ������ TO_CHAR�� ���ʿ䰡 ���� ,
                WHEN '1' THEN '��'
                WHEN '2' THEN '��'
        END AS "��������"
  FROM  EMPDETAIL;
  
  
  
--13. EMPDETAIL ���̺��� �ֹε�Ϲ�ȣ�� �̿��Ͽ� ���� ���̰� 23~25������ ����� �����ȣ, �ֹι�ȣ, ���̰� ���� ������� ����Ͻÿ�.
SELECT
        EMPNO,
        EXT,
        AGE
  FROM  (SELECT
                EMPNO,
                EXT,
                TO_CHAR(SYSDATE, 'YYYY') - ('19' || SUBSTR(EXT, 1, 2)) AS AGE
          FROM  EMPDETAIL)
 WHERE AGE >= 23
   AND AGE <= 25; 
   
   
   
--14. �� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����Ͻÿ�.
SELECT  
        DEPTNO,
        MAX(SAL),
        MIN(SAL),
        AVG(SAL),
        COUNT(*)
  FROM  EMP
 GROUP  BY DEPTNO;
  
  
  
--15. �� �μ��� ���� ������ �ϴ� ����� ���� 3�� �̻��� �μ�, ����, �ο����� ����Ͻÿ�.
SELECT
        DEPTNO,
        JOB,
        COUNT(*)
  FROM  EMP
 GROUP  BY DEPTNO, JOB
HAVING  COUNT(*) >= 3;




--16. �μ��� �޿� ����� 2000 �̻��� �μ��� �μ���ȣ, �޿����, �ְ�޿��� ����Ͻÿ�.
-- X. �ְ�޿� �÷� ������, ��� ���Ҷ� NULL üũ 

SELECT
        DEPTNO,
        AVG(NVL(SAL, 0))    AS AVGSAL,
        MAX(NVL(SAL, 0))    AS MAXSAL
  FROM  EMP
 GROUP  BY  DEPTNO
HAVING  AVG(SAL) >= 2000;




--17. 3�� �̻��� ����� �����ϴ� ������� �����ȣ�� ����Ͻÿ�.
SELECT 
        B.EMPNO,
        COUNT(*)
  FROM  EMP A, EMP  B
 WHERE  A.MGR = B.EMPNO
 GROUP  BY B.EMPNO
 HAVING COUNT(*) >= 3;
 
 
 
-- 18. EMPFAMILY ���̺��� ������� ������������ 3�� �̻� �Ǵ� ����� ������ȣ, ������������, �ְ���ڸ� ������������ ���� ������� ����Ͻÿ�.
-- X. ���� ������ 

SELECT
        EMPNO,
        COUNT(*)||'��'  AS CNT,
        MAX(AGE)        AS AGE
  FROM  EMPFAMILY
 GROUP  BY EMPNO
HAVING  COUNT(*) >= 3
 ORDER  BY CNT DESC;



--19. EMP���̺��� ������ ���� ����� �̸�, �����ȣ, �μ���ȣ�� ����Ͻÿ�. 
-- X. �÷� ������ , (����̸�, �μ���ȣ)

SELECT
        A.EMPNO,
        A.ENAME,
        A.DEPTNO
  FROM  EMP     A
 INNER 
  JOIN  (
        SELECT
                EMPNO
          FROM  EMP
         MINUS
        SELECT
                EMPNO
          FROM  EMPFAMILY
         GROUP  BY EMPNO
         )      B
    ON  A.EMPNO = B.EMPNO;



--20. �μ��� �� ������ �����ϴ� ����� ���� �Ʒ� �������� ����Ͻÿ�. 
-- X. CASE �� �̿��ؼ� �ٽ� Ǯ����� ! 

SELECT
        *
      FROM  (   
                SELECT 
                        DEPTNO, 
                        JOB
                  FROM  EMP 
            )
     PIVOT  (
                COUNT(*)
                FOR JOB IN ('CLERK', 'SALESMAN', 'PRESIDENT', 'MANAGER', 'ANALYST') 
            );
  
/*******************************************************************/
 SELECT
        DEPTNO,
        COUNT(CASE JOB WHEN 'CLERK' THEN 1 END)||'��' AS CLERK_CNT,
        COUNT(CASE JOB WHEN 'SALESMAN' THEN 1 END)||'��' AS SALESMAN_CNT,
        COUNT(CASE JOB WHEN 'PRESIDENT' THEN 1 END)||'��' AS PRESIDENT_CNT,
        COUNT(CASE JOB WHEN 'MANAGER' THEN 1 END)||'��' AS MANAGER_CNT,
        COUNT(CASE JOB WHEN 'ANALYST' THEN 1 END)||'��' AS ANALYST_CNT
  FROM  EMP
 GROUP  BY  DEPTNO;




--21. EMPFAMILY���� ���ɴ뺰 ������� ������ ���� ���� ������ �Ʒ��� ���� �������� ����Ͻÿ�.
-- X.  CASE��, MAX, MIN, || �̿��ؼ� �ٽ� Ǯ����� !! 
/*
    ��Ǯ�ھ��
*/
SELECT 
        TO_CHAR(MAX(CASE WHEN AGE LIKE '2%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '2%' THEN SAL ELSE NULL END),'999,999')  AS AGE20,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '3%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '3%' THEN SAL ELSE NULL END),'999,999')  AS AGE30,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '4%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '4%' THEN SAL ELSE NULL END),'999,999')  AS AGE40,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '5%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '5%' THEN SAL ELSE NULL END),'999,999')  AS AGE50,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '6%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '6%' THEN SAL ELSE NULL END),'999,999')  AS AGE60,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '7%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '7%' THEN SAL ELSE NULL END),'999,999')  AS AGE70                     
  FROM  EMPFAMILY;


