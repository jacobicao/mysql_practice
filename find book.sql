-- 借书记录表
select a.BORROW_DATE
     , c.NAME
     , b.BOOK_NAME
from BORROW a
         join BOOK b on a.BOOK_ID = b.BOOK_ID
         join READER c on a.READER_ID = c.READER_ID
order by a.BORROW_DATE;

-- 各个职位的人借了哪些书
select b.GRADE
     , count(*)                  as NUM
     , group_concat(c.BOOK_NAME) as BOOKS
from BORROW a
         join READER b on a.READER_ID = b.READER_ID
         join BOOK c on a.BOOK_ID = c.BOOK_ID
group by b.GRADE;

-- 1.找出姓李的读者姓名和所在单位
select NAME, COMPANY
from READER
where NAME like '李%';

-- 2.列出图书库所有藏书的书名及出版社
select distinct BOOK_NAME, OUTPUT
from BOOK;

-- 3.查找'高等教育出版社'的所有图书名称及单价,结果按单价降序排列
select distinct BOOK_NAME, PRICE
from BOOK
where OUTPUT = '高等教育出版社'
order by PRICE desc;

-- 4.查找价格介于 10 元和 20 元之间的图书种类,结果按出版单位和单价升序排列
select SORT, PRICE
from BOOK
where PRICE < 20
  and PRICE > 10
order by OUTPUT, PRICE;

-- 5. 查找书名以'计算机'开头的所有图书和作者
select BOOK_NAME, WRITER
from BOOK
where BOOK_NAME like '计算机%';

-- 6.检索同时借了图书编号为 112266 和 449901 两本书的读者证号(可恶 mysql 没有 intersect)
select READER_ID
from (
         select READER_ID
         from BORROW
         where BOOK_ID = 112266
         union all
         select READER_ID
         from BORROW
         where BOOK_ID = 449901
     ) a
group by READER_ID
having count(*) > 1;

-- 7.查找借了书的读者的姓名及所在单位
select NAME, COMPANY
from READER
where READER_ID in
      (
          select distinct READER_ID
          from BORROW
      );

-- 8.找出李某所借所有图书的书名及借书日期
select a.BOOK_NAME, b.BORROW_DATE
from BOOK a
         right join (
    select BOOK_ID, BORROW_DATE
    from BORROW
    where READER_ID in (
        select READER_ID
        from READER
        where NAME like '李%')) b on a.BOOK_ID = b.BOOK_ID;

-- 9.无重复地查询 2006 年 10 月以后借书的读者的借书号/姓名/单位
select distinct READER_ID, NAME, COMPANY
from READER
where READER_ID in (
    select READER_ID
    from BORROW
    where BORROW_DATE >= to_days('2006-10-01')
);

-- 10.找出借阅了一本书的借书证号
select READER_ID
from READER
where READER_ID in (
    select READER_ID
    from BORROW
    group by READER_ID
    having count(*) = 2
);

-- 11.找出与'赵正义'在同一天借书的读者的姓名/单位/借书日期
select a.NAME, a.COMPANY, b.BORROW_DATE
from READER a
         right join (
    select READER_ID, BORROW_DATE
    from BORROW
    where BORROW_DATE in (
        select BORROW_DATE
        from BORROW
        where READER_ID = (
            select READER_ID
            from READER
            where NAME like '赵正义'
        )
    )
) b on a.READER_ID = b.READER_ID
where name != '赵正义';

-- 12.查询 2006 年 7 月以后没有借书的读者的 id/姓名/单位
select READER_ID, NAME, COMPANY
from READER
where READER_ID not in (
    select READER_ID
    from BORROW
    where BORROW_DATE >= to_days('2006-07-01')
);

-- 13.求'科学出版社'图书的最高价/最低价/平均价
select max(PRICE) as max, min(PRICE) as min, avg(PRICE) as avg
from BOOK
where OUTPUT = '科学出版社'
group by OUTPUT;

-- 14.求'信息系'当前借书的读者人数
select count(distinct READER_ID) as num
from BORROW
where READER_ID in (
    select READER_ID
    from READER
    where COMPANY = '信息系'
);

-- 15.求出各个出版社图书的最高价格/最低价格/总册数
select OUTPUT, max(price) as max, min(PRICE) as min, count(*) as num
from BOOK
group by OUTPUT;

-- 16.分别找出各单位当前借阅图书的读者人数及单位名称
select COMPANY, count(distinct READER_ID) as num
from READER
where READER_ID in (
    select READER_ID
    from BORROW
)
group by COMPANY;

-- 17.找出当前至少借阅了 2 本图书的读者姓名及其单位
select NAME, COMPANY
from READER
where READER_ID in (
    select READER_ID
    from BORROW
    group by READER_ID
    having count(1) > 1
);

-- 18.分别找出借书人次数多于 1 人次的单位及人次数
select a.COMPANY, sum(b.num) as sum
from READER a
         right join (
    select READER_ID, count(1) as num
    from BORROW
    group by READER_ID
) b on a.READER_ID = b.READER_ID
group by COMPANY
order by sum desc;

-- 19.找出藏书中各个出版单位的名称/每个出版社的书籍的总册数/书的价值总额
select OUTPUT, count(1) as num, sum(PRICE) as value
from BOOK
group by OUTPUT;

-- 20.查询'经济系'是否还清所有图书
select distinct READER_ID
from BORROW
where READER_ID in (
    select READER_ID
    from READER
    where COMPANY = '经济系'
);