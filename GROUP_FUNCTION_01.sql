/*
    �׷��Լ�
    �� ����        : ��� �� ���ó���� ���� �Լ�
    �� ����
        1. ���̺��� ��ü���� ������� ����� ���ϱ� ���� �� ���տ� �����Ͽ� �ϳ��� ����� �����Ѵ�.
        2. �ϳ� �̻��� ���� �׷����� ���� �����Ͽ� ����, ��� �� �ϳ��� ����� ���Ѵ�.
        
    �� ��������
        1. SELECT Ű���� ������ �� �� ���� �÷�(���� �� ����)
            �� ���, ����̸� ���� �÷��� ���� �� �׷� �ȿ� �������� ���� �����ϹǷ� ��ȸ�� �� ����
            �� Ư���� ������ �����Ƿ� ��ǻ�Ͱ� ��� ���ڵ� �ϳ��� �˾Ƽ� ������ �� �� ����
        
        2. SELECT Ű���� ������ �� �� �ִ� �÷�
            �� � �׷� ���� ��� ����� �μ���ȣ�� �׻� ���Ƽ� �μ���ȣ�� �� �׷��� ��ǥ�� �� �����Ƿ� ��ȸ ����
            �� �ִ밪�̳� ��հ� � �׷캰�� �ϳ��� ��� ������ �� �� �����Ƿ� ��ȸ�� ����
        
        EX)
        MIN(expr)   : �ּҰ�
        MAX(expr)   : �ִ밪
        AVG(expr)   : ��հ�
        COUNT(expr) : �÷����� expr ���� ����
        COUNT(*)    : NULL ���� �����Ͽ� ���� ����
        STDDEV(expr): ǥ������
        
        GOURP BY ��
        �� �Ϲ������� Ư�� �׷캰 �����͸� �ʿ�� �� ��쿡�� GROUP BY���� �׷��Լ��� �Բ� ����Ѵ�.
        �� ��GROUP BY�� ��� ��, SELECT���� ���� �� ��� �÷��� �����ؾ� �Ѵ�.
                
*/

--����1. �μ���, �������� �׷��� ��� �μ���ȣ, ����, �ο���, �޿��� ���, �հ� ���ϱ�
SELECT  
        DEPTNO,
        JOB,
        COUNT(*) AS RECORD,  
        AVG(SAL) AS AVG_SAL,
        SUM(SAL) AS SUM_SAL
  FROM  EMP
 GROUP  BY DEPTNO, JOB;


/*
    HAVING��
    �� �׷��Լ��� ����� GROUP BY���� ����� ��, �׷�鿡 ���� ���� ������ �ʿ��Ͽ� ����ϴ� ������ �̴�.
    �� SELECT�� ������ WHERE��, GROUP BY�� �������� HAVING�� �̴�.
*/

--����2. �μ����� ����� ���� 4�� �̻��� ����� �μ���ȣ, �޿��� �հ� ���ϱ�
SELECT
        DEPTNO,
        SUM(SAL)
  FROM  EMP
 GROUP  BY  DEPTNO
HAVING  COUNT(*) >= 4;


--����3. EMP���̺����� ������ CLERK�� �ƴ� ����� ���� �μ����� �޿��� ���� 4000 �̻��� �μ��� ������ ���
SELECT
        DEPTNO,
        SUM(SAL)
  FROM  EMP
 WHERE  JOB <> 'CLERK'
 GROUP  BY  DEPTNO
HAVING  SUM(SAL) >= 4000;


--����4. EMP���̺����� ��ü �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿��� �հ踦 ���
--      (�����߿��� MANAGER�� ����, ���޿��� �հ�� ��������)
SELECT
        JOB,
        SUM(SAL)
  FROM  EMP
 WHERE  JOB <> 'MANAGER'
 GROUP  BY  JOB
HAVING  SUM(SAL) > 5000;


--����4. �μ��� ������� ��ȸ�϶�.
SELECT
        DEPTNO           AS "�μ���ȣ",
        COUNT(*) || '��' AS "��� ��"
  FROM  EMP
 GROUP  BY  DEPTNO;
 
 
--����5. �μ����� �׷��Ͽ� �μ���ȣ, �ο���, �޿��� ���, �޿��� ���� ��ȸ�϶�.
SELECT
        DEPTNO          AS "�μ���ȣ",
        COUNT(*)        AS "�ο���",
        ROUND(AVG(SAL)) AS "��� �޿���",
        ROUND(SUM(SAL)) AS "�� �ݿ���"
  FROM  EMP
 GROUP  BY  DEPTNO;
 

--����6. �������� �׷��Ͽ� ����, �ο���, ��ձ޿���, �ְ��޿���, �����޿��� �� �հ踦 ��ȸ�϶�.
SELECT
        JOB                     AS "����",
        COUNT(EMPNO) || '��'    AS "�ο�",
        ROUND(AVG(SAL))         AS "��ձ޿�",
        MAX(SAL)                AS "�ְ��޿�",
        MIN(SAL)                AS "�����޿�"
  FROM  EMP
 GROUP  BY  JOB;


/*
    GROUP BY ���� �����Լ� ���̵� ����� �����ϴ�.
*/

--����7. EMP���̺��� �ִ� �μ��� ��ȸ�϶�.
SELECT
        DEPTNO
  FROM  EMP
 GROUP  BY DEPTNO;
 
 
--����8. ������� �ټ� ���� �Ѵ� �μ��� ������� ��ȸ�϶�.
SELECT
        A.DEPTNO,
        B.DNAME,
        COUNT(A.EMPNO)
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO = B.DEPTNO
 GROUP  BY  A.DEPTNO, B.DNAME
HAVING  COUNT(EMPNO) >= 5;

--����9. ��ü ������ 5000�� �ʰ��ϴ� JOB�� ���ؼ� JOB�� ���޿� �հ踦 ��ȸ�϶�.
--      ��, �Ǹſ�(SALES)�� �����ϰ� �� �޿� �հ�� �������� �����϶�.
SELECT
        JOB             AS "����",
        SUM(SAL)        AS "���޿� ��"
  FROM  EMP
 WHERE  JOB <> 'SALES'
 GROUP  BY JOB
HAVING  SUM(SAL) > 5000;