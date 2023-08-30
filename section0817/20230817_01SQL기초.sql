--파일->새로만들기->데이터베이스계층->데이터베이스 파일
--테이블 생성
create table sungjuk (
    uname varchar(20)
   ,kor   int
   ,eng   int
   ,mat   int
   ,aver  int
);


--테이블 삭제
drop table sungjuk;

1. 행 추가(Create)
insert into sungjuk (uname, kor, eng, mat)
values ('무궁화', 80, 85, 100);

insert into sungjuk (uname, kor, eng, mat)
values ('홍길동', 90, 100, 50);

2. 조회 및 검색(Read)
select uname, kor, eng, mat, aver
from sungjuk;

3. 행 수정(Update)
update sungjuk
set aver=(kor+eng+mat)/3;

4. 행 삭제(Delete)
delete from sungjuk;



