--UPATE���� ���̺� ����� �����͸� �����ϱ� ���� ����Ѵ�.
/*
    UPDATE table_name
    SET column_name1 = value1,
        column_name2 = value2,
        ... ,
        ... ,
    WHERE conditions;
    
    �� WHERE���� ������ ���, table�� ��ü ���� �����ǹǷ� ������ �Ǵ� �ʿ�
    
*/

--1. ��� ����� �μ���ȣ�� 30���� �����սô�.

-- emp ���̺��� ������ emp01�� �����Ѵ�.
create table emp01
as ( select * from emp);

select * from emp01;

update emp01
set deptno=30;

select * from emp01;

-- ��� ����� �޿��� 10% �λ��Ű�ÿ�.
update emp01
set sal = sal*1.1;

select * from emp01;


-- ��� ����� �Ի����� ���ó�¥�� �����Ͻÿ�.
update emp01
set hiredate = sysdate;

select * from emp01;

-- update���� where���� �߰��ϰ� �Ǹ� ���̺��� Ư�� ���� ����ȴ�.
drop table emp01;

create table emp01
as ( select * from emp);


-- �μ���ȣ�� 10���� ����� �μ���ȣ�� 30������ �����Ͻÿ�.
update emp01
set deptno = 30
where deptno = 10;

-- �޿��� 3000 �̻��� ����� �޿��� 10% �λ��Ͻÿ�.
update emp01
set sal = sal * 1.1
where sal >= 3000;


-- 1987�⿡ �Ի��� ����� �Ի����� ���÷� �����Ͻÿ�.
update emp01
set hiredate = sysdate
where substr(hiredate,1,2) = '87';

select * from emp01;


-- ���̺��� 2�� �̻��� Į���� ���� ���� : set �� + ,


-- 20�� �μ��� �������� 40�� �μ��� ���������� ����
select * from dept01 where deptno=20;

update dept01
set loc = 'BOSTON'
where deptno = 40;

update dept01
set loc = (select DISTINCT loc from dept01 where deptno=40)
where deptno = 20;



/* �����������̿��� �ΰ� �̻��� Į���� ���� �� ����*/

-- �μ���ȣ��20�� �μ��� �μ���� ��������
-- �μ���ȣ�� 40���� �μ��� �����ϰ� �����սô�.

update dept01
set (dname, loc) = (select distinct dname, loc from dept01 where deptno=40)
where deptno = 20;


-- �����͸� ������ ����
delete from dept01;


