select 
    ename,
    deptno
from emp;


select 
    deptno,
    dname
from dept;


-- Equi Join :  ���� �÷��� �������� ����
-- Non-Equi-Join : �����÷� ���� �ٸ� ������ ����Ͽ� ����
-- Outer Join : ���� ���ǿ� �������� �ʴ� �൵ ���
-- Self Join :  �� ���̺� ������ ����


--Equi Join
-- ���δ���� �Ǿ����� �� ���̺��� ���������� �����ϴ� �÷��� ���� ��ġ�Ǵ� ���� ����

select 
    *
from emp, dept
where emp.deptno = dept.deptno;



select
    emp.ename,
    dept.dname,
    dept.deptno
from emp, dept
where emp.deptno = dept.deptno
AND ename = 'SCOTT';



-- ���忡�� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�.
select * from emp;
select * from dept;

select
    e.ename,
    e.sal
from emp e, dept d
where e.deptno = d.deptno
AND lower(d.loc) = 'new york';


select
    e.ename,
    e.hiredate
from emp e, dept d
where e.deptno = d.deptno
and d.dname = 'ACCOUNTING';



--Non Equi Join
--���� ���ǿ� Ư�� ���� ���� �ִ����� �����ϱ� ���ؼ� WHERE ���� ���������� = ������ �̿���
--�񱳿����ڸ� ����մϴ�.

select * from salgrade;

select
    ename,
    sal,
    grade
from emp, salgrade
where sal between losal and hisal;



--Self Join
--������ �� �� �̻��� ���� ���� ���̺��� ���� �����ϴ� �� �Ӹ� �ƴ϶�
--�ϳ��� ���̺� ������ ������ �ؾ߸� ���ϴ� �ڷḦ ��� ���
--�ڱ� �ڽŰ� ������ �δ� ��

--Example -> emp table
select
    e1.ename,
    e2.sal
from emp e1, emp e2
where e1.empno = e2.empno;

--SMITH�� �Ŵ��� �̸��� �������� �˾Ƴ�����.
select
    e1.ename,
    e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno
and lower(e1.ename) = 'smith';


-- MANAGER�� KING�� ������� �̸��� ������ ����Ͻÿ�.
select * from emp;

select
    e1.ename,
    e1.job
from emp e1, emp e2
where e1.mgr = e2.empno
and e2.ename = 'KING';



-- SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�.
select
    e1.ename,
    e2.ename
from emp e1, emp e2
where e1.deptno = e2.deptno
and  e1.ename = 'SCOTT';

--OUTER JOING // ANSI JOING


select
    e1.ename,
    e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;
-- �� QUERY���� KING�� ���� �� -> MGR�� ���� ������ ������ ����
-- ���� ���� JOIN ������ �������� ���ϴ��� �ο츦 ��Ÿ���� ���� ��
-- OUTER ������ ����մϴ�.
select
    e1.ename,
    e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+); 


-- ������̺�� �μ����̺��� �����Ͽ� ����̸��� �μ���ȣ�� �μ����� ����ϵ��� �սô�.
-- �μ� ��Ƽ���� 40�� �μ��� ������ ��� ���̺��� �μ���ȣ�� ������, �Ʒ� �׸��� ���� 40�� �μ���
-- ����ϼ���.
select * from dept;

select
    e.ename,
    d.deptno,
    d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;

-- ANSI Cross Join
select 
    *   
from emp inner join dept on emp.deptno = dept.deptno
where emp.ename = 'SCOTT';





