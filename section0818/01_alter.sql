--sungjuk ���̺� ����
drop table sungjuk;

--sungjuk ���̺� ����
create table sungjuk (
    uname varchar (50) not null 
    ,kor   int      not null
    ,eng   int      not null
    ,mat   int      not null
    ,tot   int      null            
    ,aver  int                      
);

--sungjuk  ���̺� ��ȸ
select * from sungjuk;
////////////////////////////////////////////////////////////////////////////////

[alter ��] - ���̺��� ���� ���� �� ����

1. �÷� �߰�
   ����) alter table table�� add (Į���� ������Ÿ��);
   
--music Į�� �߰�
alter table sungjuk add (music int null);

2. �÷��� ����
   ����) alter table table�� rename column �����÷��� to �ٲ��÷���;
   
--���� �÷� kor�� korea�÷������� �����Ͻÿ�
alter table sungjuk rename column kor to korea;
select * from sungjuk;

3. �÷� ������ Ÿ�� ����
   ����) alter table table�� modify(�÷��� ������Ÿ��);
   
--music �÷��� �ڷ����� varchar�� �����Ͻÿ�
alter table sungjuk modify (music varchar(5));
select *from sungjuk;

4. �÷� ����
   ����) alter table table�� drop(�÷���);
   
--music �÷��� �����Ͻÿ�
alter table sungjuk drop (music);