
create database ExerciseDbJoin
use ExerciseDbJoin

-----------------------------------Part-1--------------------
create table CompanyInfo
(CId int primary key identity,
CName nvarchar(50) not null)

insert into CompanyInfo(CName) values
('SamSung'),
('HP'),
('Apple'),
('Dell'),
('Toshiba'),
('Redmi')
select * from CompanyInfo


create table ProductInfo
(PId int primary key identity(101, 1),
PName nvarchar(50) not null,
PPrice float,
PMDate date,
CId int)


insert into ProductInfo(PName, PPrice, PMDate, CId) values
('Laptop', 55000.90, '12/12/2023', 1),
('Laptop', 35000.90, '12/12/2012', 2),
('Mobile', 15000.90, '12/03/2012', 2),
('Laptop', 135000.90, '12/12/2012', 3),
('Mobile', 65000.90, '12/12/2012', 3),
('Laptop', 35000.90, '12/12/2012', 5),
('Mobile', 35000.90, '12/01/2012', 5),
('EarPod', 1000.90, '12/01/2022', 3),
('Laptop', 80000.90, '12/12/2021', 6),
('Mobile', 55000.70, '12/12/2020', 1)

select * from ProductInfo


select c.CName, p.PId, p.PName, p.PPrice, p.PMDate
from CompanyInfo c join ProductInfo p on c.CId = p.CId


select p.PName, c.CName
from ProductInfo p join CompanyInfo c on p.CId = c.CId


select c.CName, p.PName
from CompanyInfo c cross join ProductInfo p

--------------------------------part 2--------------------------------------

create table Products
(PId int primary key identity,
PQ int,
PPrice float,
Discount float)

insert into Products (PQ, PPrice, Discount) values
(10, 666.666, 0.066),
(5, 999.99, 0.12),
(10, 19999.99, 0.18)
select * from Products


create function CalcDiscount
(@Price float,
@Discount float)
returns float
as
begin
declare @DiscountGiven float;
set @DiscountGiven = @Price * @Discount;
return @DiscountGiven
end

create function CalcDiscountedValue
(@Price float,
@Discount float)
returns float
as
begin
declare @DiscountedValue float;
set @DiscountedValue = @Price - (@Price * @Discount);
return @DiscountedValue
end


select PId, PPrice, Discount,dbo.CalcDiscount(PPrice, Discount) as 'Discount Amount' ,dbo.CalcDiscountedValue(PPrice, Discount) as 'PriceAfterDiscount'
from Products