use Hotel
----------------------------------------------------------------------------


INSERT INTO RoomType VALUES('Апартамент','1','Номер площадью не менее 40 кв. м, состоящий из двух и более жилых комнат (гостиной или столовой, спальни), имеющий кухонное оборудование')
INSERT INTO RoomType VALUES('Люкс 1х','1','Номер площадью не менее 35 кв. м, состоящий из двух жилых комнат (гостиной и спальни)')
INSERT INTO RoomType VALUES('Люкс 2х','2','Номер площадью не менее 35 кв. м, состоящий из двух жилых комнат (гостиной и спальни)')
INSERT INTO RoomType VALUES('Студия 1х','1','Однокомнатный номер площадью не менее 25 кв. м, с планировкой, позволяющей использовать часть помещения в качестве гостиной, столовой или кабинета')
INSERT INTO RoomType VALUES('Студия 2х','2','Однокомнатный номер площадью не менее 25 кв. м, с планировкой, позволяющей использовать часть помещения в качестве гостиной, столовой или кабинета')
INSERT INTO RoomType VALUES('ПервКтг 1х','1','Номер первой категории - номер, состоящий из одной жилой комнаты с одной кроватью, с полным санузлом (ванна или душ, умывальник, унитаз)')
INSERT INTO RoomType VALUES('ПервКтг 2х','2','Номер первой категории - номер, состоящий из одной жилой комнаты с одной или двумя кроватями, с полным санузлом (ванна или душ, умывальник, унитаз)')
INSERT INTO RoomType VALUES('ВторКтг 1х','1','Номер второй категории - номер, состоящий из одной жилой комнаты с одной кроватью, с неполным санузлом (умывальник, унитаз) либо одним полным санузлом в блоке из двух номеров')
INSERT INTO RoomType VALUES('ВторКтг 2х','2','Номер второй категории - номер, состоящий из одной жилой комнаты с одной-двумя кроватями, с неполным санузлом (умывальник, унитаз) либо одним полным санузлом в блоке из двух номеров')


SELECT ID,RoomTypeName,NumberSeats,RoomTypeDescription FROM RoomType
----------------------------------------------------------------------------

INSERT INTO Rooms VALUES('101',1,'1','101','1200','Описание номера на 1 этаже')
INSERT INTO Rooms VALUES('102',2,'1','101','1300','Описание номера на 1 этаже')
INSERT INTO Rooms VALUES('103',3,'1','101','1400','Описание номера на 1 этаже')

INSERT INTO Rooms VALUES('201',4,'2','201','1500','Описание номера на 2 этаже')
INSERT INTO Rooms VALUES('202',5,'2','201','1600','Описание номера на 2 этаже')
INSERT INTO Rooms VALUES('203',6,'2','201','1700','Описание номера на 2 этаже')

INSERT INTO Rooms VALUES('301',7,'3','301','1800','Описание номера на 3 этаже')
INSERT INTO Rooms VALUES('302',8,'3','301','1900','Описание номера на 3 этаже')
INSERT INTO Rooms VALUES('303',9,'3','301','2000','Описание номера на 3 этаже')


SELECT r.ID,r.RoomNumber, r.IDRoomType,rt.RoomTypeDescription,rt.RoomTypeName,rt.NumberSeats,r.RoomFloor,r.RoomPhone,r.RoomPrice,r.RoomDescription FROM Rooms as r
JOIN RoomType as rt ON rt.ID = r.IDRoomType

----------------------------------------------------------------------------

INSERT INTO FoodType VALUES ('БП','0','Без питания')
INSERT INTO FoodType VALUES ('BB','30','В стоимость проживания включен только завтрак (шведский стол). Дополнительное питание - за отдельную плату в ресторанах и барах отеля')
INSERT INTO FoodType VALUES ('HB','64','Полупансион: в стоимость проживания включен завтрак и ужин (шведский стол), бесплатный чай, кофе, вода на завтрак')
INSERT INTO FoodType VALUES ('HB+','82','Расширенный полупансион: завтрак и ужин (шведский стол), а также алкогольные и безалкогольные напитки весь день')
INSERT INTO FoodType VALUES ('FB','103','Полный пансион: завтрак, обед и ужин (шведский стол)')
INSERT INTO FoodType VALUES ('FB+','150','Расширенный полный пансион: завтрак, обед и ужин (шведский стол), а также напитки (пиво и вино) во время приема пищи')

SELECT ID,FoodTypeName,FoodTypyPrice,FoodTypeDescription FROM FoodType

----------------------------------------------------------------------------


INSERT INTO ClientStatus VALUES ('Новый','Статус клиента при первом обращении')
INSERT INTO ClientStatus VALUES ('Постоянный','Статус клиента при повторном обращении')
INSERT INTO ClientStatus VALUES ('VIP','Статус вне зависимости от частоты обращения')

SELECT ID,StatusName,StatusDescription FROM ClientStatus

----------------------------------------------------------------------------


INSERT INTO Clients VALUES ('Коротова Ольга Ивановна','Сер. 2343 №344554, выдан 01.02.2000 ОВД Ивановского р-на г. Костромы',1,'г. Кострома, ул. танкистов, д.70, кв.45')
INSERT INTO Clients VALUES ('Матюнин Сергей Андреевич','Сер. 3408 №456556, выдан 12.11.2004 ОВД г. Царицыно Московской обл.',2,'Московская обл., г. Царицыно, ул. Пролетарская, д.2')
INSERT INTO Clients VALUES ('Мартынов Михаил Игоревич','Сер. 0965 №654546, выдан 09.06.2009 ОУФМС Железнодорожного р-на г. Тамбов',3,'г. Тамбов, пр-кт Строителей, д.12, кв.123')
INSERT INTO Clients VALUES ('Окушкина Ирина Львовна','Сер.1234 №956494, выдан 09.03.2008 ОУФМС Комсомольского р-на г. Кирова',1,'г. Киров, ул. Яблоневая, д.23')
INSERT INTO Clients VALUES ('Окушкин Иммануил Аркадьевич','Сер.1234 №956495, выдан 09.03.2008 ОУФМС Комсомольского р-на г. Кирова',1,'г. Киров, ул. Яблоневая, д.23')
INSERT INTO Clients VALUES ('Акопян Ашот Усикович','Сер. 3856 №945604, выдан 05.07.2006 ОВД Октябрьского р-на г. Саратов',3,'г. Саратов, ул. Тихая, д.123')
INSERT INTO Clients VALUES ('Абросимов Петр Иванович','Сер. 5643 №345345, выдан 25.10.2005 ОВД Октябрьского р-на г. Саратов',2,'г. Саратов, Васюковский пр-д, д.34, кв.12')
INSERT INTO Clients VALUES ('Валерьева Марина Сергеевна','Сер. 0965 №456546, выдан 19.10.2009 ОУФМС Железнодорожного р-на г. Тамбов',1,'г. Тамбов, ул. Метеллистов, д.23, кв. 234')
INSERT INTO Clients VALUES ('Вагарин Василий Кузьмич','Сер. 5654 №654534, выдан 09.06.2008 ОУФМС Железнодорожного р-на г. Орехово-Зуево Московской обл.',1,'г. Орехово-Зуево Московской обл.')


SELECT c.ID,c.ClientName,c.IDClientStatus,cs.StatusName,c.ClientPasport,c.ClientAdress FROM Clients as c 
JOIN ClientStatus as cs ON cs.ID = c.IDClientStatus

----------------------------------------------------------------------------


INSERT INTO Employes VALUES ('Антипова Ирина Викторовна','Сер. 4564 №458795, выдан 09.06.2009 ОУФМС Железнодорожного р-на г. Тула','375257778650','г. Орехово-Зуево Московской обл.')
INSERT INTO Employes VALUES ('Глебова Антонина Повловна','Сер.4565 №956495, выдан 09.03.2008 ОУФМС Комсомольского р-на г. Благовещенск','375257778650','г. Орехово-Зуево Московской обл.')
INSERT INTO Employes VALUES ('Миронова Виктория Дмитриевна','Сер. 6545 №344554, выдан 01.02.2000 ОВД Строительного р-на г. Екатеринбург','375257778650','г. Красноярск, ул. Морская, д.13')
INSERT INTO Employes VALUES ('Макеева Марина Ивановна','Сер. 0965 №456546, выдан 19.10.2009 ОУФМС Железнодорожного р-на г. Белгород','375257778650','г. Белгород, ул. Танкистов, д.123, кв.45')
INSERT INTO Employes VALUES ('Агафонов Эдмунд Сергеевич','Сер. 0965 №458795, выдан 09.06.2009 ОУФМС Железнодорожного р-на г. Красноярск','375257778650','г. Екатеринбург, ул. Мира, д.13, кв.45')
INSERT INTO Employes VALUES ('Кривошеин Иван Ивонович','Сер. 5654 №654354, выдан 19.07.2009 ОУФМС Железнодорожного р-на г. Орехово-Зуево Московской обл.','375257778650','Амурская обл., г. Благовещенск, ул. Мирная, д.5')
INSERT INTO Employes VALUES ('Зинова Марина Сергеевна','Сер. 5654 №654536, выдан 09.06.2008 ОУФМС Железнодорожного р-на г. Орехово-Зуево Московской обл.','375257778650','г. Тула')


SELECT ID,EmployeeName, EmployePhone,EmployeePasport,EmployesAdress FROM Employes

----------------------------------------------------------------------------



INSERT INTO EmployeeType VALUES ('Смена полотенец')
INSERT INTO EmployeeType VALUES ('Смена постельного белья')
INSERT INTO EmployeeType VALUES ('Экспресс-уборка номера')
INSERT INTO EmployeeType VALUES ('Подготовка к заселению')
INSERT INTO EmployeeType VALUES ('Проверка комплектности после выселения')
INSERT INTO EmployeeType VALUES ('Генеральная уборка номера')

SELECT ID,WorkTypeName FROM EmployeeType


----------------------------------------------------------------------------


INSERT INTO EmployeeInRoom VALUES(1,1,1,'2018-05-01')
INSERT INTO EmployeeInRoom VALUES(2,2,2,'2018-05-01')
INSERT INTO EmployeeInRoom VALUES(3,3,3,'2018-05-01')
INSERT INTO EmployeeInRoom VALUES(1,1,2,'2018-05-01')
INSERT INTO EmployeeInRoom VALUES(2,2,1,'2018-05-01')
INSERT INTO EmployeeInRoom VALUES(3,3,3,'2018-05-01')

INSERT INTO EmployeeInRoom VALUES(4,4,4,'2018-05-01')
INSERT INTO EmployeeInRoom VALUES(5,5,5,'2018-05-01')
INSERT INTO EmployeeInRoom VALUES(6,6,6,'2018-05-01')

INSERT INTO EmployeeInRoom VALUES(7,1,4,'2018-05-01')
INSERT INTO EmployeeInRoom VALUES(8,5,1,'2018-05-01')
INSERT INTO EmployeeInRoom VALUES(9,4,6,'2018-05-01')


SELECT er.ID, er.IDRoom,r.RoomNumber,er.IDEmployee,e.EmployeeName,er.IDEmployeeType ,et.WorkTypeName, er.EmployeeDate  FROM EmployeeInRoom as er
JOIN Rooms as r ON r.ID = er.IDRoom
JOIN Employes as e ON e.ID = er.IDEmployee
JOIN EmployeeType as et ON et.ID = er.IDEmployeeType
WHERE er.IDRoom = 1
----------------------------------------------------------------------------


INSERT INTO ReservedRooms VALUES (1,'2018-05-01','2018-05-03',1,0)
INSERT INTO ReservedRooms VALUES (2,'2018-05-04','2018-05-05',2,0)
INSERT INTO ReservedRooms VALUES (3,'2018-05-03','2018-05-14',3,0)
INSERT INTO ReservedRooms VALUES (4,'2018-04-14','2018-04-16',1,1)
INSERT INTO ReservedRooms VALUES (5,'2018-04-22','2018-04-24',1,1)
INSERT INTO ReservedRooms VALUES (5,'2018-03-11','2018-03-12',3,1)
INSERT INTO ReservedRooms VALUES (1,'2018-05-12','2018-05-15',2,0)
INSERT INTO ReservedRooms VALUES (6,'2018-05-04','2018-05-06',1,0)
INSERT INTO ReservedRooms VALUES (4,'2018-04-29','2018-05-01',1,1)
INSERT INTO ReservedRooms VALUES (5,'2018-04-30','2018-05-01',1,1)


SELECT rr.ID,rr.IDRoom,r.RoomNumber,rr.DateBegin,rr.DateEnd,rr.IDFoodType,f.FoodTypeName,f.FoodTypeDescription,rr.Passed,f.FoodTypyPrice, r.RoomPrice FROM ReservedRooms as rr
JOIN Rooms as r ON r.ID = rr.IDRoom
JOIN FoodType as f ON f.ID = rr.IDFoodType
ORDER BY rr.Passed

SELECT rr.IDRoom FROM ReservedRooms as rr WHERE (rr.DateEnd BETWEEN '2018-05-03' AND '2018-05-06')
 OR (rr.DateBegin BETWEEN '2018-05-03' AND '2018-05-06')

SELECT rr.IDRoom FROM ReservedRooms as rr WHERE (rr.DateEnd BETWEEN '2018-05-03' AND '2018-05-06') AND (rr.DateBegin BETWEEN '2018-05-03' AND '2018-05-06')
 OR (rr.DateBegin <= '2018-05-03' AND rr.DateEnd >= '2018-05-06') OR (rr.DateEnd <= '2018-05-03') GROUP BY rr.IDRoom

UPDATE ReservedRooms SET DateEnd = '2018-05-02' WHERE ID = 9

UPDATE ReservedRooms SET Passed = 0 WHERE ID = 10

--Свободные комнаты на необходимые даты
SELECT ID,RoomNumber FROM Rooms WHERE ID NOT IN 
(SELECT rr.IDRoom FROM ReservedRooms as rr WHERE rr.DateEnd >= '2018-05-05' AND rr.DateBegin <= '2018-05-06'  GROUP BY rr.IDRoom)


SELECT rr.IDRoom FROM ReservedRooms as rr WHERE rr.DateEnd >= '2018-05-01' AND rr.DateBegin <= '2018-05-01'  GROUP BY rr.IDRoom

--Сегодня выселяются
SELECT rr.IDRoom FROM ReservedRooms as rr WHERE rr.DateEnd = '2018-05-01'

SELECT ID FROM Rooms WHERE ID NOT IN (SELECT rr.IDRoom FROM ReservedRooms as rr WHERE rr.DateEnd = '2018-05-03' GROUP BY rr.IDRoom)

----------------------------------------------------------------------------


INSERT INTO ClientsInRoom VALUES (1,1)
INSERT INTO ClientsInRoom VALUES (1,2)
INSERT INTO ClientsInRoom VALUES (2,2)
INSERT INTO ClientsInRoom VALUES (3,3)
INSERT INTO ClientsInRoom VALUES (4,4)
INSERT INTO ClientsInRoom VALUES (5,5)
INSERT INTO ClientsInRoom VALUES (6,6)
INSERT INTO ClientsInRoom VALUES (7,7)
INSERT INTO ClientsInRoom VALUES (8,8)

INSERT INTO ClientsInRoom VALUES (9,4)
INSERT INTO ClientsInRoom VALUES (9,5)

INSERT INTO ClientsInRoom VALUES (10,7)
INSERT INTO ClientsInRoom VALUES (10,8)

SELECT IDClient,IDReservedRooms FROM ClientsInRoom

SELECT IDClient FROM ClientsInRoom WHERE IDReservedRooms = 9

SELECT cr.IDClient,c.ClientName FROM ClientsInRoom as cr
JOIN ReservedRooms as rr ON rr.ID = cr.IDReservedRooms
JOIN Clients as c ON c.ID = cr.IDClient
WHERE cr.IDReservedRooms = 1

SELECT * FROM Clients WHERE ID NOT IN(SELECT IDClient FROM ClientsInRoom WHERE IDReservedRooms = 9)

DELETE FROM ClientsInRoom WHERE IDReservedRooms = 9 AND IDClient = 1

----------------------------------------------------------------------------


INSERT INTO HotelServices VALUES ('Охраняемая парковка, сутки','10')
INSERT INTO HotelServices VALUES ('Сейф, сутки','10')
INSERT INTO HotelServices VALUES ('Заказ билетов','2')
INSERT INTO HotelServices VALUES ('Глажка одежды, час','10')
INSERT INTO HotelServices VALUES ('Бар','30')
INSERT INTO HotelServices VALUES ('Стирка в стиральной машине, час','10')
INSERT INTO HotelServices VALUES ('Сауна, час','20')

SELECT ID,ServicesName,ServicesPrice FROM HotelServices

----------------------------------------------------------------------------


INSERT INTO ServicesInRoom VALUES (1,1)
INSERT INTO ServicesInRoom VALUES (1,2)
INSERT INTO ServicesInRoom VALUES (1,3)
INSERT INTO ServicesInRoom VALUES (1,4)

INSERT INTO ServicesInRoom VALUES (2,4)
INSERT INTO ServicesInRoom VALUES (2,5)
INSERT INTO ServicesInRoom VALUES (2,6)

INSERT INTO ServicesInRoom VALUES (3,1)
INSERT INTO ServicesInRoom VALUES (3,2)

INSERT INTO ServicesInRoom VALUES (4,1)
INSERT INTO ServicesInRoom VALUES (4,3)

INSERT INTO ServicesInRoom VALUES (5,1)
INSERT INTO ServicesInRoom VALUES (5,2)

INSERT INTO ServicesInRoom VALUES (6,1)
INSERT INTO ServicesInRoom VALUES (6,3)

INSERT INTO ServicesInRoom VALUES (7,1)
INSERT INTO ServicesInRoom VALUES (7,2)

INSERT INTO ServicesInRoom VALUES (8,1)
INSERT INTO ServicesInRoom VALUES (8,3)

SELECT sr.IDHotelServices, h.ServicesName,h.ServicesPrice FROM ServicesInRoom as sr
JOIN HotelServices as h ON h.ID = sr.IDHotelServices
WHERE sr.IDReservedRooms = 1

----------------------------------------------------------------------------