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
   
   
   
--����4) Ŀ�̼��� �޴� ����� �̸��� �װ� ���� �μ����� ����ϼ���.
