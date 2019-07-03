--��¥�Լ�--

--���� 1: �� �������� �ٹ��� ���� ���� ���Ͻÿ�. (�Ҽ��� ù°�ڸ����� �ݿø�)
--      �÷��� ENAME, TODAY, HIREDATE, �ٹ����� �� �Դϴ�.
SELECT
        ENAME,
        SYSDATE AS TOODAY,
        HIREDATE,
        ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "�ٹ����� ��"
  FROM  EMP;
        


--���� 2 : �Ի� ��¥���� 4������ �߰��Ͻÿ�.
--      �÷��� ENAME, JOB, DEPTNO, HIREDATE, ��������ȯ �Դϴ�.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        HIREDATE,
        ADD_MONTHS(HIREDATE, 4) AS "������ ��ȯ"
  FROM  EMP;
  
  
--����3 : ���ó�¥ �������� ���� ����� '������'�� �� �� ���� ���Ͻÿ�.
SELECT
        NEXT_DAY(SYSDATE, '������')
  FROM  DUAL;
  


--����4 : ��� �� �Ի��� ���� ������ ���� ���Ͻÿ�.
--      �÷��� ENAME, JOB, DEPTNO, HIREDATE, ������ �� �Դϴ�.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        HIREDATE,
        LAST_DAY(HIREDATE) AS "������ ��"
  FROM  EMP;