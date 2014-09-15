select 
 rn, 
 min(bno), 
 min(title)||' ['||count(reply.bbsno)||']'||case when max(sysdate - to_date(regdate)) < 1 then ' new' else ' ' end title,
 max(regdate)
from 
  (
  select 
   rn, bno, title, writer, regdate
  from 
    ( select   /*+INDEX(tbl_bbs pk_bbs) */  rownum rn, bbsno bno, title, writer, regdate 
      from tbl_bbs  
      where bbsno > 0 and rownum <= 20 ) 
  where rn > 10    
 ) bbs, tbl_reply reply 
where bbs.bno = reply.bbsno(+) 
group by rn
order by rn

select * from tbl_reply

drop sequence seq_reply

-- how to make dumy data
insert into tbl_reply(replyno, bbsno, reply, replyer)
values(seq_replynum.nextval, 4194305, '리플....','han07')

select * from tbl_bbs
-- end num : 4194305
order by bbsno desc


select 
  bbs.bbsno, min(title), count(replyno)
from
  (select /*+ INDEX_DESC(tbl_bbs pk_bbs) */
  * from
  tbl_bbs
  where rownum <=20 and bbsno >0) bbs,
  (select * from tbl_reply where bbsno > 0 ) reply
where
  bbs.bbsno = reply.bbsno(+)
group by bbs.bbsno
order by bbs.bbsno desc

create index idx_reply_bbs on tbl_reply(bbsno);
-- 이 쿼리 실행속도 : 0.121초 
-- 부분범위처리로 처리하여 속도 효율성 높일 수 있다.