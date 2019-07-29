
--����1. ����� ��ȣ, �̸�, �޿�, �μ���ȣ�� ����ϼ���.
SELECT
		EMPNO,
		ENAME,
		SAL,
		DEPTNO
  FROM	EMP;
  
 
 
--����2. ����� �̸�, �޿�, Ŀ�̼�, �Ѿ�(�޿�+Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ����ϼ���.
--		(��, Ŀ�̼���   null�� ����� 0���� �ؼ� �����ϼ���.)
SELECT
 		ENAME				AS �����,			
 		SAL					AS �޿�,
 		NVL(COMM, 0)		AS Ŀ�̼�,
 		SAL+NVL(COMM, 0)	AS �Ѿ�
  FROM	EMP
 ORDER	BY	SAL+NVL(COMM, 0) DESC;
  
 
 
--����3. 10�� �μ��� ��� ������� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���.
--		�̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����ϼ���.
SELECT
		ENAME				AS �����,
		SAL					AS �޿�,
		SAL * 0.13			AS ���ʽ��ݾ�,
		DEPTNO				AS �μ���ȣ
  FROM	EMP
 WHERE	DEPTNO	= 10;
 


--����4. �޿���  $1,500���� $3,000 ������ ����� ���ؼ��� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���.
--		�ش��ϴ� ����� �̸�, �޿�, ȸ��(�Ҽ� ����2���� �ݿø�)�� ����ϼ���.
SELECT
		ENAME					AS �����,
		SAL						AS �޿�,
		ROUND(SAL * 0.15, 1)	AS ȸ��
  FROM	EMP
 WHERE	SAL	>= 1500
   AND	SAL <= 3000;
  


--����5. �μ���ȣ, �̸�, �Ի���, ������, �Ի��Ϻ��� ��������� �ٹ��ϼ�(�Ҽ��� ���� ����), �ٹ����, �ٹ������� ����ϼ���.
SELECT
		DEPTNO													AS �μ���ȣ,
		ENAME													AS �����,
		HIREDATE												AS �Ի���,
		TRUNC(SYSDATE-HIREDATE)									AS �ٹ��ϼ�,
		TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(HIREDATE, 'YYYY')	AS �ٹ����,
		TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))				AS �ٹ�������
  FROM	EMP;


 
 
--����6. �Ի��Ϸκ��� 90���� ���� ���� ��¥�� ����ؼ� �̸�, �Ի���, 90�� ���� ��¥, �޿��� ����ϼ���.
--		(��� ��¥�� ǥ�� ������ '2019_07_30' ���� �ϸ�, Alias�� �����, �Ի���, ��ȯ�Ϸ� �ϼ���.)
SELECT
		ENAME									AS �����,
		TO_CHAR(HIREDATE, 'YYYY_MM_DD')			AS �Ի���,
		TO_CHAR(HIREDATE + 90, 'YYYY_MM_DD')	AS ��ȯ��
  FROM	EMP;
 
 
 

--����7. ��� ����� �Ի��� ���� ���������� ���Ͽ� �Ի��� ���� �ٹ��ϼ��� ���ϼ���.
--		�����ȣ, �����, �Ի���, �Ի��ѿ��ٹ��� �� ����ϼ���.
--		(��� ��¥�� ǥ�� ������ '2019_07_30' ���� �Ѵ�)
SELECT
		EMPNO									AS �����ȣ,
		ENAME									AS �����,		
		TO_CHAR(HIREDATE, 'YYYY_MM_DD')			AS �Ի���,
		LAST_DAY(HIREDATE) - HIREDATE			AS �Ի��ѿ��ٹ���
  FROM	EMP;
  

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

