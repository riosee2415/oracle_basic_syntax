--����1) �޿��� 3000���� 5000������ ����� �̸��� �ҼӺμ����� ����ϼ���.
SELECT
        A.ENAME,
        B.DNAME
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO;
    
    
    
--����2) ������ MANAGER�� ����� �̸�, ����, �μ����� ����ϼ���.
SELECT
        A.ENAME,
        A.JOB,
        B.DNAME
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.JOB       = 'MANAGER';
    
   
   
--����3) ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����ϼ���.
SELECT
        A.ENAME,
        A.HIREDATE
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  B.DNAME     = 'ACCOUNTING';
   
   
   
--����4) Ŀ�̼��� �޴� ����� �̸��� �װ� ���� �μ���, Ŀ�̼��� ����ϼ���.
--      ��, 0���� Ŀ�̼��� �޴� ����� �����մϴ�.
SELECT
        A.ENAME,
        B.DNAME,
        A.COMM
  FROM  EMP     A
 INNER 
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.COMM IS NOT NULL
   AND  A.COMM <> 0;
   
   
   
--����5) ���忡 �ٹ��ϴ� ����� �����ȣ, �̸�, �޿�, �ٹ����� ����ϼ���.
SELECT * FROM DEPT;

SELECT
        A.EMPNO,
        A.ENAME,
        A.SAL,
        B.LOC
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  B.LOC       = 'NEW YORK';
   
   
   
--����6) �޿��� 1200������ ������� �����ȣ, �̸�, �޿�, �ٹ����� ����ϼ���.
SELECT
        A.EMPNO,
        A.ENAME,
        A.SAL,
        B.LOC
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.SAL       <= 1200;
   
   
   
