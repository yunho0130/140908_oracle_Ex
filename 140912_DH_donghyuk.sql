-- 부분 범위 처리 단계 1
-- 2페이지의 모든 것. 
select 
  * 
from
  (
  select /*+INDEX_DESC(tbl_bbs pk_bbs)*/
    rownum rn, bbsno, title, content, writer, regdate
  from tbl_bbs
  where rownum <= 20 and bbsno > 0
  ) bbs
where rn > 10

-- 부분범위처리 단계 2 테이블 조인(인덱스 확인 필수)
select
*
from
  (select 
    * 
  from
    (
    select /*+INDEX_DESC(tbl_bbs pk_bbs)*/
      rownum rn, bbsno, title, content, writer, regdate
    from tbl_bbs
    where rownum <= 20 and bbsno > 0
    ) bbs
  where rn > 10
) bbs, tbl_reply reply
where bbs.bbsno = reply.bbsno(+)

-- 3단계 group by, order by 사용
select
 bbs.bbsno, min(title), min(content), min(writer), count(reply.bbsno)
from
  (select 
    * 
  from
    (
    select /*+INDEX_DESC(tbl_bbs pk_bbs)*/
      rownum rn, bbsno, title, content, writer, regdate
    from tbl_bbs
    where rownum <= 1000 and bbsno > 0
    ) bbs
  where rn > 990
) bbs, tbl_reply reply
where bbs.bbsno = reply.bbsno(+)
group by bbs.bbsno

select * from scott.emp
order by deptno