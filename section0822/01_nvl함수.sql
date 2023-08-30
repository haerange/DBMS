● nvl() 함수 - null값을 다른 값으로 바꿈

문제) 주소가 'Incheon'인 행의 국어점수 최대값, 인원수를 조회하시오
select max(kor), count(*)
from sungjuk
where addr='Incheon';         --최대값(null), 인원수(0)

select count(*)+1             --0+1
from sungjuk
where addr='Incheon';

select max(kor)+1             --null+1  -> null값과 연산할 수 없다
from sungjuk
where addr='Incheon';

--null값이면 0으로 대체함
select nvl(max(kor), 0)
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0)+1
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0)+1  as max_kor    --칼럼명 변경
from sungjuk
where addr='Incheon';
////////////////////////////////////////////////////////////////////////////////

select * from sungjuk order by sno desc;

sno : max(sno) + 1
     단, max()값이 null이면 0으로 바꾼 후 계산한다
     
uname : 손흥민
kor   : 100
eng   : 100
mat   : 100
addr  : Seoul
wdate : sysdate

--1)Sno칼럼에거 가장 큰값 가져오기
select max(sno) from sungjuk;

2)만일 1)결과가 null이 나오면 0으로 바꾸기
select nvl(max(sno), 0) from sungjuk;

3)2)결과에 +1 연산하기
select nvl(max(sno), 0) +1  from sungjuk;

4)행 추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values((select nvl(max(sno), 0)+1 from sungjuk), '손흥민', 100, 100, 100, 'Seoul', sysdate);

select * from sungjuk order by sno desc;
commit;
