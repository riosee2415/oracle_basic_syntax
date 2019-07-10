--����1) ��� ����� �̸�, �μ���ȣ, �μ��̸��� ����ϼ��� (EMP, DEPT)
SELECT
        A.ENAME,
        A.DEPTNO,
        B.DNAME
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO;
    
    

--����2) ������ MANAGER�� ����� ����, �̸�, ����, �μ���, �ٹ��� ������ ����Ͻÿ�. (EMP, DEPT)
SELECT
        A.ENAME,
        A.JOB,
        B.DNAME,
        B.LOC
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO;



--����3) �ٹ����� CHICAGO�� ����� �̸�, ����, �μ���ȣ, �μ��̸��� ����ϼ���.
SELECT
        A.ENAME,
        A.JOB,
        B.DEPTNO,
        B.DNAME
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  B.LOC = 'CHICAGO';


--����4) �ٹ����� �ٹ��ϴ� ������� 5�� ������ ���,
--      �ο��� ���� ���� ������ �����Ͻÿ�.
--      (�ٹ��� 0�� ���� ǥ��)
SELECT
        B.LOC             AS �ٹ���,
        COUNT(A.EMPNO)    AS �ο�
  FROM  DEPT    B
  LEFT  OUTER
  JOIN  EMP    A
    ON  A.DEPTNO     = B.DEPTNO
 GROUP  BY B.LOC
HAVING  COUNT(A.EMPNO) <= 5
 ORDER  BY 1;
 
 
 
 
--����5) ����� �̸� �� ��� ��ȣ�� �������� �̸��� ������ ��ȣ�� �Բ� ǥ���ϰ�, ���� �� ���̺���
--      EMPLOUEE, EMP#, MANAGER, MGR# ���� �����ϼ���.
SELECT
        A.ENAME     AS EMPLOYEE,
        A.EMPNO     AS EMP#,
        B.EMPNO     AS MANAGER,
        B.ENAME     AS MGR#
  FROM  EMP     A
 INNER
  JOIN  EMP     B
    ON  B.MGR   = A.EMPNO;
    
    

--����6) �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� 
--      �������� �̸� �� �Ի��ϰ� �Բ� ǥ���ϰ�,
--      �� ���̺��� ���� employee, emp hired, manager, mgr gired�� �����Ѵ�.
SELECT
        A.ENAME     AS employee,
        A.HIREDATE  AS "emp hired",
        B.ENAME     AS manager,
        B.HIREDATE  AS "mgr hired"
  FROM  EMP A
 INNER
  JOIN  EMP B
    ON  A.EMPNO     = B.MGR
   AND  A.HIREDATE  < B.HIREDATE;
   
   
   
--����7) ����� �̸� �� �����ȣ�� �������� �̸��� ������ ��ȣ�� �Բ� ǥ���ϰ�
--      ������ �� ���̺��� employee, emp#, manager, mgr#
--      king�� �����Ͽ� �����ڰ� ���� ��� ����� ǥ���ϵ��� �ϰ�
--      ����� �����ȣ �������� ����
SELECT
        A.ENAME     AS employee,
        A.EMPNO     AS emp#,
        B.ENAME     AS manager,
        B.EMPNO     AS mgr#
  FROM  EMP A
  LEFT  OUTER
  JOIN  EMP B
    ON  A.EMPNO     = B.MGR
 ORDER  BY 2;
 
 
 
--����8) 10�� �μ����� �ٹ��ϴ� ������� �μ���ȣ, �μ��̸�, ����̸�, ����, �޿������ ����ϼ���.
SELECT
        A.DEPTNO,
        B.DNAME,
        A.ENAME,
        A.SAL,
        C.GRADE
  FROM  EMP         A
  LEFT  OUTER
  JOIN  DEPT        B
    ON  A.DEPTNO    = B.DEPTNO
  JOIN  SALGRADE    C
    ON  SAL >= C.LOSAL
   AND  SAL <= C.HISAL
   AND  A.DEPTNO    = 10
   