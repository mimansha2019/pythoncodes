# Question 1 :-

use sales;
create table ATS(id int,Technology varchar(25));

insert into ATS values(1,"Data Science"),(1,"Tableau"),(1,"SQL"),(2,"R"),(2,"Power BI"),(1,"Python");

drop table ATS;
select * from ATS;

select id from ATS
where Technology="Tableau"
and id in(
     select id from ATS
     where Technology="Data Science"
	 and id in(
		select id from ATS
		where Technology="SQl"
        and id in(
            select id from ATS
            where Technology="Python")));

# Question 2 :-

create table product_info(
product_id int,
product_name varchar(30),
primary key(product_id));

insert into product_info values(1001,"Blog"),(1002,"YouTube"),(1003,"Education");

select * from product_info;

create table product_info_likes(
user_id int,
product_id int,
liked_date date);

insert into product_info_likes values(1,1001,(STR_TO_DATE('19 August 2023', '%d %M %Y'))),
(2,1003,(STR_TO_DATE('18 August 2023', '%d %M %Y')));

select * from product_info_likes;

SELECT *  
FROM product_info
WHERE NOT EXISTS
(SELECT *  
   FROM  product_info_likes
   WHERE product_info.product_id = product_info_likes.product_id);

SELECT *  
FROM product_info
WHERE EXISTS
(SELECT *  
   FROM  product_info_likes
   WHERE product_info.product_id = product_info_likes.product_id);
   

   
