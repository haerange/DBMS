● [서브쿼리]
 - SQL문 속 또 다른 SQL문
 - 테이블 내에서 다시 한번 쿼리문에 의해 행 조회 및 검색
 

--국어점수의 평균을 조회하시오
select kor from sungjuk order by kor desc;
select avg(kor) from sungjuk order by kor desc;
select round(avg(kor), 0) from sungjuk order by kor desc;  --66
select round(avg(kor), 0) as avg_kor from sungjuk;


문1) 국어점수 평균(66)보다 잘한 국어 점수를 조회하시오
select uname, kor from sungjuk where kor>=66;
select uname, kor from sungjuk where kor>=(select round(avg(kor), 0) from sungjuk);


문2) 서울지역의 국어점수 평균보다 잘한 지역, 이름, 국어점수를 조회하시오
--서울 지역의 국어점수 평균을 구하시오
select kor from sungjuk where addr='Seoul';
select avg(kor) from sungjuk where addr='Seoul';                --72.5
select round(avg(kor), 0) from sungjuk where addr='Seoul';      --73

select addr, uname, kor from sungjuk where kor>=73;

select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor), 0) from sungjuk where addr='Seoul');


문3) 서울지역의 국어점수 평균보다 잘한 국어점수가 다른 지역에 있는지 조회하시오
--   문2) 결과값에서 서울지역을 제외하시오
select addr, uname, kor
from sungjuk
where kor>=73
and addr <>'Seoul';


select addr, kor, uname
from sungjuk
where kor>=(select round(avg(kor), 0) from sungjuk where addr='Seoul')
and addr <> 'Seoul';


문4) 국어점수의 최소값보다 이하 점수가 수학 또는 영어점수에 있는지 조회하시오
--국어 점수의 최소값
select min(kor) from sungjuk;  --20

select uname, kor, eng, mat
from sungjuk
where mat<=20 or eng<=20;

select uname, kor, eng, mat
from sungjuk
where mat<=(select min(kor) from sungjuk)
        or
        eng<=(select min(kor) from sungjuk);



