--sungjuk 테이블 삭제
drop table sungjuk;

--sungjuk 테이블 생성
create table sungjuk (
    sno    int         not null    --일련번호
    ,uname varchar(50) not null
    ,kor   int         not null
    ,eng   int         not null
    ,mat   int         not null
    ,tot   int                  
    ,aver  int  
    ,addr  varchar(20)              --주소
    ,wdate date                     --작성일(년월일시분초)
);

--sungjuk 테이블 행 추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'아이티윌', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon',sysdate);

commit;
select count (*) from sungjuk;   --전체 레코드 갯수
select * from sungjuk;
///////////////////////////////////////////////////////////////////////////////

● [문제]

--문1) 전체행에 대해서 총점(tot), 평균(aver)을 구하시오
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

select * from sungjuk;


--문2) 이름에 '나' 글자가 있는 행을 조회하시오
select uname
from sungjuk
where uname like '%나%';

    
--문3) 주소가 서울, 제주 행을 조회하시오
select uname, addr
from sungjuk
where addr = 'Seoul' or addr='Jeju';
 
select uname, addr
from sungjuk
where addr in( 'Seoul' , 'Jeju');


--문4) 국영수 세 과목 모두 90점 이상 행이 몇 개인지 조회하시오
select uname, kor, eng, mat
from sungjuk
where kor>=90 and eng>=90 and mat>=90;
    
    
select count(*)
from sungjuk
where kor>=90 and eng>=90 and mat>=90;


select count(*) as cnt  --칼럼명 변경
from sungjuk
where kor>=90 and eng>=90 and mat>=90;


select count(*) cnt     --as 생략 가능
from sungjuk
where kor>=90 and eng>=90 and mat>=90;


--문5) 주소별로 정렬해서 조회하시오
--     주소가 같다면 일련번호 내림차순으로 다시 정렬해서 조회하시오
select uname, addr from sungjuk order by addr;
select uname, addr, sno from sungjuk order by addr, sno desc;