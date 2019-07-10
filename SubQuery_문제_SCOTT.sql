--����1) EMP���̺��� BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի����ڸ� ����ϼ���.
SELECT
        ENAME,
        HIREDATE
  FROM  EMP
 WHERE  DEPTNO  = (
                    SELECT
                            DEPTNO
                      FROM  EMP
                     WHERE  ENAME   = 'BLAKE'
                  );
                  
                  
--����2) EMP���̺��� ��� �޿� �̻��� �޴� ��� ������ ���ؼ� ������ȣ�� �̸��� ����ϼ���.
SELECT
        ENAME,
        EMPNO
  FROM  EMP
 WHERE  SAL >=  (
                SELECT
                        AVG(SAL)
                  FROM  EMP
                );
                
                
--����3) EMP ���̺��� �̸��� 'T'�� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ����� ����
--      �����ȣ, �̸�, �޿��� ����ϼ���.
SELECT
        EMPNO,
        ENAME,
        SAL
  FROM  EMP
 WHERE  DEPTNO IN  (
                    SELECT
                            DEPTNO
                      FROM  EMP
                     WHERE  ENAME LIKE '%T%'
                    );
                    
                    
                    
--����4) EMP���̺��� �μ���ġ�� 'dallas'�� ��� ����� ���� �̸�, ����, �޿��� ����ϼ���.
SELECT
        ENAME,
        JOB,
        SAL
  FROM  EMP
 WHERE  DEPTNO  IN   (
                    SELECT
                            DEPTNO
                      FROM  DEPT
                     WHERE  LOC = 'DALLAS'
                    );
  


--����5) EMP���̺��� KING���� �����ϴ� ��� ����� �̸��� �޿��� ����ϼ���.
SELECT
        ENAME,
        SAL
  FROM  EMP
 WHERE  MGR =   (
                SELECT
                        EMPNO
                  FROM  EMP
                 WHERE  ENAME = 'KING'
                );
                
                
                
--����6) EMP���̺��� SALES�μ� ����� �̸�, ������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT
        ENAME,
        JOB
  FROM  EMP
 WHERE  DEPTNO  =   (
                    SELECT
                            DEPTNO
                      FROM  DEPT
                     WHERE  DNAME   = 'SALES'
                    );
                    
                    

--����7) EMP���̺��� ������ 30�� �μ��� �������޺��� ���� ����� �����ȣ, �����, ����, �޿�, �μ���ȣ�� ����ϼ���.
SELECT
        EMPNO,
        ENAME,
        JOB,
        SAL,
        DEPTNO
  FROM  EMP
 WHERE  SAL >=  (
                SELECT
                        MIN(SAL)
                  FROM  EMP
                 WHERE  DEPTNO = 30
                );
  


--����8) EMP���̺��� 20�� �μ��� ����� ���� ������ �ð� �ִ� ����� �̸��� ������ ����ϼ���.
SELECT
        ENAME,
        JOB
  FROM  EMP
 WHERE  JOB IN   (
                SELECT
                        JOB
                  FROM  EMP
                 WHERE  DEPTNO = 20
                );
                
                

--����9) EMP���̺��� FORD�� ����, �μ��� ���� �����ȣ, �����, ����, �޿�, �μ���ȣ�� ����ϼ���.
--        (FORD�� ����)
SELECT
        EMPNO,
        ENAME,
        JOB,
        SAL,
        DEPTNO
  FROM  EMP
 WHERE  DEPTNO  =   (
                    SELECT
                            DEPTNO
                      FROM  EMP
                     WHERE  ENAME = 'FORD'
                    )
   AND  JOB     =   (
                    SELECT
                            JOB
                      FROM  EMP
                     WHERE  ENAME = 'FORD'
                    )
   AND  ENAME   <> 'FORD';
   
   
   

--����10) EMP���̺��� ������ JONES�� ���ų� ������ FORD �̻��� ����� �̸�, ����, �μ���ȣ, �޿��� ����ϼ���.
--        ��, ������ ������ ���� ������ ����ϼ���.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        SAL
  FROM  EMP
 WHERE  JOB =   (
                SELECT
                        JOB
                  FROM  EMP
                 WHERE  ENAME   =   'JONES'
                )
   OR   SAL >=  (
                SELECT
                        SAL
                  FROM  EMP
                 WHERE  ENAME   =   'FORD'
                );
                
                

--����11) EMP���̺��� SCOTT�Ǵ� WARD�� ������ ���� ����� �̸�, ����, �޿��� ����ϼ���.
SELECT
        ENAME,
        JOB,
        SAL
  FROM  EMP
 WHERE  SAL IN  (
                SELECT
                        SAL
                  FROM  EMP
                 WHERE  ENAME IN  ('SCOTT', 'WARD')
                );
                
                
                
--����12) EMP���̺��� CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�, ������ ����ϼ���.
SELECT
        ENAME,
        JOB
  FROM  EMP
 WHERE  DEPTNO =   (
                    SELECT
                            DEPTNO
                      FROM  DEPT
                     WHERE  LOC = 'CHICAGO'
                    );
                    
                    
                    
                    
--����13) EMP���̺��� �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿�, �μ��� ����ϼ���.
SELECT
        A.DEPTNO,
        A.ENAME,
        A.SAL,
        B.DNAME
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  SAL >=  (
                SELECT
                        AVG(SAL)
                  FROM  EMP
                )
 ORDER  BY DEPTNO;
 
 
 
--����14) EMP���̺��� �������� �޿��� ��պ��� ���� ����� �μ���ȣ, �̸�, �޿�, �μ����� ����ϼ���
SELECT
        A.DEPTNO,
        A.ENAME,
        A.SAL,
        B.DNAME
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  SAL <=  (
                SELECT
                        AVG(SAL)
                  FROM  EMP
                )
 ORDER  BY DEPTNO;
 
 
 
 
--����15) EMP���̺��� ��� �Ѹ��̻����κ��� ������� �� �ִ� ����� ����, �̸�, �����ȣ, �μ���ȣ�� ����ϼ���.
SELECT
        JOB,
        ENAME,
        EMPNO,
        DEPTNO
  FROM  EMP A
 WHERE  exists  (
                SELECT
                        EMPNO
                  FROM  EMP B
                 WHERE  A.EMPNO = B.MGR
                );
                
                

--����16) EMP���̺��� ������ 'CLERK'�� ����� �����ȣ, �̸�, ����, �μ���ȣ�� ����ϼ���.
SELECT
        ENAME,
        JOB,
        DEPTNO
  FROM  EMP
 WHERE  JOB = 'CLERK';