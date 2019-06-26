--���������� �⺻ ����
--SCOTT�� �μ����� �˾Ƴ��� ���� subQuery

select
    dname
from dept
where deptno = (
                select
                    deptno
                from emp
                where ename='SCOTT'
                );
                
    
    

--SCOTT�� ���� �μ����� �ٹ��ϴ� ����� �̸��� �μ� ��ȣ�� ����ϴ� SQL���� �ۼ��غ��ÿ�.
select
    ename,
    deptno
from emp
where deptno = ( select
                    deptno
                from emp
                where ename='SCOTT');
                
                
-- SCOTT�� ������ ������ ���� ����� ����ϴ� SQL���� �ۼ��غ��ÿ�.
select
    ename
from emp
where job = (select 
                job
            from emp
            where ename='SCOTT');
            


-- SCOTT�� �޿��� �����ϰų� �� ���� �޴� ��� ���� �޿��� ����Ͻÿ�.
select
    ename,
    sal
from emp
where sal >= (select
                sal
            from emp
            where ename='SCOTT');
            

-- DALLAS���� �ٹ��ϴ� ����� �̸�, �μ� ��ȣ�� ����Ͻÿ�.
select
    ename,
    deptno
from emp
where deptno = (select deptno from dept where loc='DALLAS');


--SALES �μ����� �ٹ��ϴ� ��� ����� �̸��� �޿��� ����Ͻÿ�.
select
    ename,
    sal
from emp
where deptno = (select deptno from dept where dname='SALES');


-- ������ Sub_Query
-- SubQuery���� �׷��Լ� ��� �� / ���� �� SubQuery

-- 10�� �μ��� �ٹ��ϴ� ����� �̸��� 10�� �μ��� �μ����� ���
select
    e.ename,
    d.dname
from emp e, dept d
where e.deptno = d.deptno
and d.deptno = 10;

select 
    e.ename,
    d.dname
from emp e, (select deptno, dname from dept where deptno=10) d
where e.deptno = d.deptno;


-- ��ձ޿��� ���ϴ� �������� ���������� ����Ͽ� ��� �޿����� �� ���� �޿��� �޴� ����� �˻��ϴ� ������ ������ �����ϴ�.
select 
    ename,
    sal
from emp
where sal > (select avg(sal) from emp);

-- ������ �������� : ������������ ��ȯ�Ǵ� ����� �ϳ� �̻��� ���� �� ���Ǵ� ��������
-- ������ ���������� �ݵ�� ������ �����ڸ� ����ؾ� �Ѵ�.




-- mgr�� 'KING'�� ����� �̸��� �޿��� ����Ͻÿ�.
select
    ename,
    sal
from emp
where mgr = (select empno from emp where ename='KING');



-- 3000�̻� �޴� ����� �Ҽӵ� �μ� (10, 20)�� ������ �μ����� �ٹ��ϴ� ����̱⿡ �������� ����߿��� �ϳ��� ��ġ�ϸ�
--�� �� ����� ���ϴ� IN �����ڿ� �Բ� ���Ǿ�� �Ѵ�.

select
    ename,
    sal,
    deptno
from emp
where deptno in (select distinct deptno from emp where sal >= 3000);


-- �μ����� ���� �޿��� ���� �޴� ����� ����(�����ȣ, ����̸�, �޿�, �μ���ȣ)�� ����Ͻÿ� (IN������)
select
    empno,
    ename,
    sal,
    deptno
from emp
where sal IN (select max(sal) from emp group by deptno);


-- ������ MANAGER�� ����� ���� �μ��� �μ���ȣ�� �μ����� ������ ����Ͻÿ�.
select
    deptno,
    dname,
    loc
from dept
where deptno IN (select deptno from emp where job='MANAGER');


-- ALL ������
-- ALL ������ ���� ������ �������� ���� ������ �˻������ ��� ���� ��ġ�ϸ� ��


--30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸�, �޿��� ����Ͻÿ�.
select
    ename,
    sal
from emp
where sal > all(select sal from emp where deptno=30);


-- ���� ����� ���� �޿��� ���� �޴� ������� �̸��� �޿��� ������ ����ϵ�, ��������� ������� �ʽ��ϴ�.
select
    ename,
    sal,
    job
from emp
where sal > all(select sal from emp where job='SALESMAN');


