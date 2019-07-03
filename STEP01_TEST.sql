--����1) ������ �ߺ����� �ʰ�, �� ���� �����ǵ��� �������� �ۼ��ϼ���. (EMP ���̺� ���, �������)
SELECT 
        DISTINCT(JOB)
  FROM  EMP
 WHERE  JOB IS NOT NULL;


 
--����2) �޿��� 1500������ ����� �����ȣ, �����, �޿��� ����ϴ� SQL���� �ۼ��ϼ���.
SELECT
        EMPNO,
        ENAME,
        SAL
  FROM  EMP
 WHERE  SAL < 1500;


--����3) �����ȣ�� 7521�̰ų� 7654�̰ų� 7844�� ����� �޿��� �˻��ϴ� �������� �񱳿����ڿ� OR �������ڸ� ����Ͽ� �ۼ��ϼ���.
SELECT
        EMPNO,
        ENAME
  FROM  EMP
 WHERE  EMPNO = 7521
    OR  EMPNO = 7654
    OR  EMPNO = 7844;
    
    
--����4) BETWEEN ���� ����ؼ� 1987�� �Ի��ڸ� ����Ͻÿ�.
SELECT 
        TO_DATE('870101', 'YY/MM/DD'),
        TO_DATE('871231', 'YY/MM/DD')
  FROM  DUAL;

SELECT
        EMPNO,
        ENAME,
        HIREDATE
  FROM  EMP
 WHERE  TO_DATE(HIREDATE, 'YY/MM/DD') BETWEEN TO_DATE('870101', 'YY/MM/DD') AND TO_DATE('871231', 'YY/MM/DD');
 
 
 
/*
    LIKE �����ڿ� ���ϵ�ī��, NOT LIKE
    �� ���� : �÷� LIKE �񱳰�
    �� LIKE������ ��� �� NULL��� �÷��� ��� NVL(�÷�, CHR(32))�� ����� ���ϵ��� �Ѵ�.
    �� ���ϵ�ī��
        1) % :  ���ڰ� ���ų�, �ϳ� �̻��� ���ڿ� � ���� �͵� �������.
        2) _ :  �ϳ��� ���ڿ� � ���� �͵� �������.
*/

--����5) ���ϵ�ī�带 ����Ͽ� ��� �߿��� �̸��� K�� �����ϴ� ����� �����ȣ�� �̸��� ����ϴ� ������ �ۼ��ϼ���.
SELECT
        EMPNO,
        ENAME
  FROM  EMP
 WHERE  ENAME   LIKE 'K%';
 
 
--����6) ���ϵ� ī�带 ����Ͽ�, ��� �߿��� �̸��� K�� �����ϴ� ����� �����ȣ�� �̸��� ����ϴ� ������ �ۼ��ϼ���.
SELECT
        EMPNO,
        ENAME
  FROM  EMP
 WHERE  ENAME   LIKE '%K%';
 

--����7) ���ϵ� ī�带 ����Ͽ�, ��� �߿��� �̸��� K�� ������ ����� ��ȣ�� �̸��� ����ϴ� ������ �ۼ��ϼ���.
SELECT
        EMPNO,
        ENAME
  FROM  EMP
 WHERE  ENAME   LIKE '%K';
 
 
--����8) ����� ���� ����� �˻��ϱ� ���� SQL���� �ۼ��ϼ���. (�����ȣ, �̸�, �޿� ���)
SELECT
        EMPNO,
        ENAME,
        SAL
  FROM  EMP
 WHERE  MGR IS NULL;



