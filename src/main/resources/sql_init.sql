insert into team_department values ('a8bb24ab-b8d3-11e8-b767-28c2dd9118a3','技术部');
insert into team_user (id,createtime,email,enabled,headUrl,password,phoneNumber,realname,username,department_id)
values (uuid(),current_date,'admin@teamwork.com.cn',1,null,'admin',null ,'admin','admin','a8bb24ab-b8d3-11e8-b767-28c2dd9118a3');