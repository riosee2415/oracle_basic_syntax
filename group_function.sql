--�׷��Լ�
--�ϳ� �̻��� ���� �׷����� ���� �����Ͽ� ����, ��� �� �ϳ��� ����� ��Ÿ���ϴ�.

select
    to_char(sum(sal), '999,999')
from emp;

select
    to_char(sum(comm), '999,999')
from emp;


select 
    ename,
    max(sal)
from emp;
-- ����, �׷��� �ȵ�


-- ���� �ֱٿ� �Ի��� ����� �Ի��ϰ�, �Ի����� ���� ������ �Ի���� �Ի����� ����ϼ���.

select 
    hiredate
from emp;


select
    min(hiredate) as "���� ������ ���",
    max(hiredate) as "���� �ֱ��� ���"
from emp;



