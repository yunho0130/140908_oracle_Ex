Create sequence seq_replyno;

Create table tbl_yh_reply(
replyno NUMBER, 
bbsno NUMBER,
replyer varchar2(20),
reply varchar2(2000),
replyDate Date default sysdate,
moddate Date default sysdate
);
alter table tbl_yh_reply
add constraint pk_replyno primary key(replyno );

insert into TBL_YH_REPLY (replyno,bbsno, replyer, reply) 
values(seq_replyno.nextval-1, 19, '∏Õ¿±»£', '«œ«œ ¿Áπ’≥◊ø‰');
insert into TBL_YH_REPLY (replyno,bbsno, replyer, reply) 
values(seq_replyno.nextval-1, 19, '∏Õ¿±»£', '±◊∑±µ• ¡ﬂ∫π¿ŒµÌ');
insert into TBL_YH_REPLY (replyno,bbsno, replyer, reply) 
values(seq_replyno.nextval-1, 19, '¿”º∫πŒ', '¥‘ ¡ﬂ∫π æ∆¥‘ø‰');
insert into TBL_YH_REPLY (replyno,bbsno, replyer, reply) 
values(seq_replyno.nextval-1, 17, '¿”º∫πŒ', '¡Ò');

select * from TBL_YH_REPLY;

drop table TBL_YH_REPLY;
drop sequence seq_replyno;

Create table tbl_yh_board(
num NUMBER, 
title varchar2(50),
writer varchar2(20),
datetime DATE default sysdate);

alter table tbl_yh_board
add constraint pk_bbsno primary key(num);

create sequence seq_test_numbering;
create SEQUENCE seq_bbsno;
insert into TBL_YH_BOARD(num, title, writer)
values(seq_bbsno.nextval-1,'≈◊Ω∫∆Æ ≈∏¿Ã∆≤'||(seq_test_numbering.nextval+99), '∏Õ¿±»£');

select * from TBL_YH_BOARD;

drop table tbl_yh_board;

-- 
--decode(tochar(datetime, datetime ,'YY/MM/DD hh24:mi:ss'), )


select distinct
  /*+INDEX_DESC(bbs pk_bbsno) */
  bbs.num,
  case 
   when bbs.num = re.bbsno then bbs.title||'['||(select count(*) from TBL_YH_REPLY where bbs.num=bbsno)||']'
   else bbs.title
   end as title,
  writer,
    case 
   when (sysdate-bbs.datetime) < 1 then to_char(sysdate, 'YY/MM/DD')||' New'
   else 'YY/MM/DD hh24:mi:ss'
   end as datetime
from tbl_yh_board bbs
inner Join TBL_YH_REPLY re
on bbs.num = re.bbsno(+)
where bbs.num>0 and bbs.num <=20 and bbs.num >10
order by bbs.num desc;
--and bbs.num<=20
--and bbs.num >10;
--order by bbs.num desc;


select count(*) from TBL_YH_REPLY where 2= bbsno;

select * from TBL_YH_BOARD;