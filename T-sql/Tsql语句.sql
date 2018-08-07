use master
go
create database mydata
ON PRIMARY
(NAME=student2,FILENAME='E:\Data\mydata.mdf',SIZE=3MB,MAXSIZE=6MB,FILEGROWTH=2MB)
LOG ON
(NAME=student2_log,FILENAME='E:\Data\mydata_log.ldf',SIZE=1MB,MAXSIZE=2MB,FILEGROWTH=1MB)
go
use mydata
go

drop table Category

create table Customers
(
  用户ID int identity(600,1) primary key,
  用户名 nvarchar(100) not null,
  密码 nvarchar(200) not null,
  性别 nvarchar(2)  check(性别 in('男','女')),
  年龄 int not null,
  地址 nvarchar(500) not null,
  电话 nvarchar(20) not null,
  余额 decimal(18,2) default 0,
  下单次数 int default 0,
  省份 nvarchar(100) ,
  城市 nvarchar(100) ,
)
go

--drop table Customers 
go

select * from Customers

update Customers set 下单次数=2 where 用户ID=601

insert into Customers(用户名,密码,性别,年龄,地址,电话,余额,省份,城市) values('余先生','cool','男',18,'绍兴文理学院','18857510000',10000,'浙江省','绍兴市')

 --管理员表
CREATE TABLE [dbo].[admin](
	管理员名 nvarchar(100) UNIQUE,
	密码 nvarchar(200) NULL  
)
--drop table [admin]

insert into admin values('admin','admin')

select *from admin

--商品类别表
create table Category
(
类别ID int identity(1,1) primary key,
类别名 nvarchar(100) not null
)
go
insert into Category(类别名) values('new')
insert into Category(类别名) values('hot')
insert into Category(类别名) values('special')
go
--商品表
create table Product
(
   商品ID int identity(1,1) primary key,
   商品名 nvarchar(100) not null,
   原价 decimal(18,2) ,
   现价 decimal(18,2) ,   
   简介 nvarchar(Max) ,
   图片 nvarchar(1000) not null,
   大图 nvarchar(1000) ,
   商品类别 int foreign key references Category(类别ID),
   日期 datetime default getdate(),
   标签 nvarchar(20) ,
   销量 int default 0,
   UNIQUE (商品名)
)
select * from Product
insert into Product(商品名,原价,现价,简介,图片,大图,商品类别,标签) values('ICE CREAM PRINCESS',25.00,24.00,'ICE CREAM PRINCESS ICE CREAM PRINCESS','~\images\cake\img-cake-1.jpg','~\images\cake\img-cake-1.jpg',2,'hot')
insert into Product(商品名,原价,现价,简介,图片,大图,商品类别,标签) values('BREAD CAKE 1',30.00,24.00,'BREAD CAKE 1 BREAD CAKE 1','~\images\cake\img-cr-1.jpg','~\images\cake\img-cr-1.jpg',3,'special')
insert into Product(商品名,原价,现价,简介,图片,大图,商品类别,标签) values('BREAD CAKE 2',30.00,24.00,'BREAD CAKE 2 BREAD CAKE 2','~\images\cake\img-cr-2.jpg','~\images\cake\img-cr-2.jpg',3,'special')
insert into Product(商品名,原价,现价,简介,图片,大图,商品类别,标签) values('BREAD CAKE 3',30.00,24.00,'BREAD CAKE 3 BREAD CAKE 3','~\images\cake\img-cr-3.jpg','~\images\cake\img-cr-3.jpg',3,'special')
insert into Product(商品名,原价,现价,简介,图片,大图,商品类别,标签) values('BREAD CAKE 4',30.00,24.00,'BREAD CAKE 4 BREAD CAKE 4','~\images\cake\img-cr-4.jpg','~\images\cake\img-cr-4.jpg',3,'special')

update Product set 原价=0 where 商品ID=1

--5.订单表：订单号(自动编号)、用户号、下单日期、总价、订单状态
CREATE TABLE [dbo].[orders]
(
	订单号 int identity(100001,1) primary key,
	用户号 [int] foreign key references Customers(用户ID),
	下单日期 [datetime]  default getdate(),
	总价 [numeric](18, 2) NULL,
	订单状态 nvarchar(100), 
	订单评价 nvarchar(1000)
)
--drop table Product

GO
--6.订单详情表：订单号、商品号、数量、小计总价
CREATE TABLE [dbo].[orderDetails](
	订单号 int foreign key references [orders](订单号),
	商品号 [int] NOT NULL foreign key references [product](商品ID),
	商品名 nvarchar(100) not null,
	商品图 nvarchar(1000) not null,
	数量 [int] ,
	小计总价 [decimal](18, 2) ,
 CONSTRAINT [PK_orderDetails] PRIMARY KEY CLUSTERED (订单号 ASC,商品号 ASC)
) 
go

select * from [orders]
select * from [orderDetails]
go

--7.商品收藏表：用户号、商品号、商品名、商品图、商品价格
CREATE TABLE [dbo].[Collection](
	用户号 int foreign key references Customers(用户ID),
	商品号 [int] NOT NULL foreign key references [product](商品ID),
	商品名 nvarchar(100) not null,
	商品图 nvarchar(1000) not null,
	商品价格 [decimal](18, 2) ,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED (用户号 ASC,商品号 ASC)  --设主键，唯一性
) 
go

select * from [Collection]

delete from [Collection] where 商品号=1 and 用户号=600

--8.评价表：用户号，用户名，商品号，商品名，评价，评价类型，评价时间
CREATE TABLE [dbo].[Evaluate](
	订单号 int foreign key references [orders](订单号),    
	用户号 int foreign key references Customers(用户ID),
	用户名 nvarchar(100) not null,
	商品号 [int] NOT NULL foreign key references [product](商品ID),
	商品名 nvarchar(100) not null,
	评价 nvarchar(1000) DEFAULT '此用户没有填写评价。',	
	评价类型 int check (评价类型 in(-1,0,1)),
	评价图 nvarchar(1000),
	评价时间 datetime default getdate(),
) 
go
select * from [Evaluate]

--get_Orderid存储过程，[orders]的top id 给[orderDetails]
create proc get_Orderid @userid nvarchar(20)
as
select top 1 订单号
from orders
where 用户号=@userid order by 订单号 desc
go

exec get_Orderid '101'
go

--update_Product存储过程，修改商品信息
create proc update_Product @name nvarchar(100), @price decimal(18,2),  @desc nvarchar(1000), @imgpath nvarchar(1000), @typeid int, @id int
as
update Product set 原价=现价 where 商品ID=@id
update Product set 商品名=@name,现价=@price,简介=@desc,图片=@imgpath,商品类别=@typeid where 商品ID=@id
go

--drop proc Order_User
select * from Product
exec update_Product 'pptest','20','test test','~\images\cake\img-cake-1.jpg','2',1
go

--Order_User存储过程，下单操作，修改订单状态，修改客户余额
create proc Order_User @userid nvarchar(20), @orderid int
as
declare @toPrice decimal(18,2)
select @toPrice=(select 总价 from orders where 订单号=@orderid)
if((select 订单状态 from orders where 订单号=@orderid)='待付款' and (select 余额 from Customers where 用户ID=@userid) >=@toPrice) 
begin
update  orders set 订单状态='已付款' where 订单号=@orderid
update  Customers set 余额=余额-@toPrice where 用户ID=@userid
end
go

exec Order_User '101',11
go

--drop proc update_Product
go

--Update_Order存储过程，修改订单状态
create proc Update_Order @oldstate nvarchar(20),@newstate nvarchar(20), @orderid int
as
update  [orders] set 订单状态=@newstate where 订单号=@orderid and 订单状态=@oldstate
go

exec Update_Order '已付款','待收货',17
go

--order_addnum触发器，orders添加订单时，触发用户下单次数+1,(orderDetails添加为其他方法)
create trigger order_addnum
on orders 
after  insert
as
update Customers set 下单次数=下单次数+1 where 用户ID in(select 用户号 from inserted)
go

drop trigger order_addnum
insert into [orders](订单号,用户号) values(100001,603)

select * from [orders]
select * from [orderDetails]

create trigger order_delnum
on orders 
after  delete
as
update Customers set 下单次数=下单次数-1 where 用户ID in(select 用户号 from deleted) and 下单次数>0
go

--order_ddel触发器，[orderDetails]中某订单号删除之后的同时触发删除orders的订单项,触发用户下单次数-1；
--因orders受orderDetails外键约束，不能先删除，可考虑用 Instead of 触发器，
--但本次使用的是先删除orderDetails表的项，再删除orders对应项的方法，这样orders就避开了orderDetails外键约束，
--虽然在逻辑上有点出入，但效果和用 Instead of 触发器方法是一样的。

create trigger order_ddel
on [orderDetails]
after  delete
as
if (select 订单状态 from orders where 订单号 in(select 订单号 from deleted))<>'待付款'
begin
raiserror('用户已付款，不允许删除！',16,1)
rollback transaction
end
else
begin
delete from orders where 订单号 in(select 订单号 from deleted)
update Product set 销量=销量-(select 数量 from deleted) where 商品ID in(select 商品号 from deleted) and 销量>0
end
go

select * from Product 


drop trigger order_ddel
go

--一个销量触发器，每向[orderDetails]插入一条信息，则触发相应商品销量+n
create trigger sales_order
on [orderDetails]
after  insert
as
update Product set 销量=销量+(select 数量 from inserted) where 商品ID in(select 商品号 from inserted)
go

--drop trigger sales_order

--创建ToCustomers视图,获取用户部分信息
create view ToCustomers
as
select 用户ID,用户名,性别,年龄,地址,电话,下单次数 from Customers
go

--drop view ToCustomers

select *from ToCustomers
go

--创建ToOrders视图,获取订单及订单详情结合信息
create view ToOrders(订单号,总价,订单状态,商品号,商品名,商品图,数量,小计总价)
as
select orderDetails.订单号,总价,订单状态,商品号,商品名,商品图,数量,小计总价 from orders,orderDetails 
where orders.订单号=orderDetails.订单号
go

--drop view ToOrders

select *from ToOrders
go

--创建SpecialProdect视图,获取Special(3)类型商品，用于网站界面轮播展示
create view SpecialProdect
as
SELECT * FROM Product where 商品类别=3
go

--drop view SaleProdect

select *from SpecialProdect
go

--SaleProdect商品销量视图,提供管理员统计销量
create view SaleProdect
as
SELECT 商品ID,商品名,商品类别,销量,(现价*销量)收入总额 FROM Product 
go

select * from SaleProdect order by 销量 desc,收入总额 desc

select SUM(销量),SUM(收入总额) from SaleProdect


delete from [orderDetails] where 订单号='8'


update  [orders] set 订单状态='待收货' where 订单号=11 and 订单状态='已付款'
update  [orders] set 订单状态='待评价' where 订单号=@orderid and 订单状态='待收货'
update  Customers set 余额+=100 where 用户ID=101
select * from Customers
select * from [orders]
select * from [orderDetails]
select * from Product
go
delete from Customers where 用户ID=602

