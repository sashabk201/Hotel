use Hotel
----------------------------------------------------------------------------


INSERT INTO RoomType VALUES('����������','1','����� �������� �� ����� 40 ��. �, ��������� �� ���� � ����� ����� ������ (�������� ��� ��������, �������), ������� �������� ������������')
INSERT INTO RoomType VALUES('���� 1�','1','����� �������� �� ����� 35 ��. �, ��������� �� ���� ����� ������ (�������� � �������)')
INSERT INTO RoomType VALUES('���� 2�','2','����� �������� �� ����� 35 ��. �, ��������� �� ���� ����� ������ (�������� � �������)')
INSERT INTO RoomType VALUES('������ 1�','1','������������� ����� �������� �� ����� 25 ��. �, � �����������, ����������� ������������ ����� ��������� � �������� ��������, �������� ��� ��������')
INSERT INTO RoomType VALUES('������ 2�','2','������������� ����� �������� �� ����� 25 ��. �, � �����������, ����������� ������������ ����� ��������� � �������� ��������, �������� ��� ��������')
INSERT INTO RoomType VALUES('������� 1�','1','����� ������ ��������� - �����, ��������� �� ����� ����� ������� � ����� ��������, � ������ �������� (����� ��� ���, ����������, ������)')
INSERT INTO RoomType VALUES('������� 2�','2','����� ������ ��������� - �����, ��������� �� ����� ����� ������� � ����� ��� ����� ���������, � ������ �������� (����� ��� ���, ����������, ������)')
INSERT INTO RoomType VALUES('������� 1�','1','����� ������ ��������� - �����, ��������� �� ����� ����� ������� � ����� ��������, � �������� �������� (����������, ������) ���� ����� ������ �������� � ����� �� ���� �������')
INSERT INTO RoomType VALUES('������� 2�','2','����� ������ ��������� - �����, ��������� �� ����� ����� ������� � �����-����� ���������, � �������� �������� (����������, ������) ���� ����� ������ �������� � ����� �� ���� �������')


SELECT ID,RoomTypeName,NumberSeats,RoomTypeDescription FROM RoomType
----------------------------------------------------------------------------

INSERT INTO Rooms VALUES('101',1,'1','101','1200','�������� ������ �� 1 �����')
INSERT INTO Rooms VALUES('102',2,'1','101','1300','�������� ������ �� 1 �����')
INSERT INTO Rooms VALUES('103',3,'1','101','1400','�������� ������ �� 1 �����')

INSERT INTO Rooms VALUES('201',4,'2','201','1500','�������� ������ �� 2 �����')
INSERT INTO Rooms VALUES('202',5,'2','201','1600','�������� ������ �� 2 �����')
INSERT INTO Rooms VALUES('203',6,'2','201','1700','�������� ������ �� 2 �����')

INSERT INTO Rooms VALUES('301',7,'3','301','1800','�������� ������ �� 3 �����')
INSERT INTO Rooms VALUES('302',8,'3','301','1900','�������� ������ �� 3 �����')
INSERT INTO Rooms VALUES('303',9,'3','301','2000','�������� ������ �� 3 �����')


SELECT r.ID,r.RoomNumber, r.IDRoomType,rt.RoomTypeDescription,rt.RoomTypeName,rt.NumberSeats,r.RoomFloor,r.RoomPhone,r.RoomPrice,r.RoomDescription FROM Rooms as r
JOIN RoomType as rt ON rt.ID = r.IDRoomType

----------------------------------------------------------------------------

INSERT INTO FoodType VALUES ('��','0','��� �������')
INSERT INTO FoodType VALUES ('BB','30','� ��������� ���������� ������� ������ ������� (�������� ����). �������������� ������� - �� ��������� ����� � ���������� � ����� �����')
INSERT INTO FoodType VALUES ('HB','64','�����������: � ��������� ���������� ������� ������� � ���� (�������� ����), ���������� ���, ����, ���� �� �������')
INSERT INTO FoodType VALUES ('HB+','82','����������� �����������: ������� � ���� (�������� ����), � ����� ����������� � �������������� ������� ���� ����')
INSERT INTO FoodType VALUES ('FB','103','������ �������: �������, ���� � ���� (�������� ����)')
INSERT INTO FoodType VALUES ('FB+','150','����������� ������ �������: �������, ���� � ���� (�������� ����), � ����� ������� (���� � ����) �� ����� ������ ����')

SELECT ID,FoodTypeName,FoodTypyPrice,FoodTypeDescription FROM FoodType

----------------------------------------------------------------------------


INSERT INTO ClientStatus VALUES ('�����','������ ������� ��� ������ ���������')
INSERT INTO ClientStatus VALUES ('����������','������ ������� ��� ��������� ���������')
INSERT INTO ClientStatus VALUES ('VIP','������ ��� ����������� �� ������� ���������')

SELECT ID,StatusName,StatusDescription FROM ClientStatus

----------------------------------------------------------------------------


INSERT INTO Clients VALUES ('�������� ����� ��������','���. 2343 �344554, ����� 01.02.2000 ��� ����������� �-�� �. ��������',1,'�. ��������, ��. ���������, �.70, ��.45')
INSERT INTO Clients VALUES ('������� ������ ���������','���. 3408 �456556, ����� 12.11.2004 ��� �. �������� ���������� ���.',2,'���������� ���., �. ��������, ��. ������������, �.2')
INSERT INTO Clients VALUES ('�������� ������ ��������','���. 0965 �654546, ����� 09.06.2009 ����� ���������������� �-�� �. ������',3,'�. ������, ��-�� ����������, �.12, ��.123')
INSERT INTO Clients VALUES ('�������� ����� �������','���.1234 �956494, ����� 09.03.2008 ����� �������������� �-�� �. ������',1,'�. �����, ��. ���������, �.23')
INSERT INTO Clients VALUES ('������� �������� ����������','���.1234 �956495, ����� 09.03.2008 ����� �������������� �-�� �. ������',1,'�. �����, ��. ���������, �.23')
INSERT INTO Clients VALUES ('������ ���� ��������','���. 3856 �945604, ����� 05.07.2006 ��� ������������ �-�� �. �������',3,'�. �������, ��. �����, �.123')
INSERT INTO Clients VALUES ('��������� ���� ��������','���. 5643 �345345, ����� 25.10.2005 ��� ������������ �-�� �. �������',2,'�. �������, ����������� ��-�, �.34, ��.12')
INSERT INTO Clients VALUES ('��������� ������ ���������','���. 0965 �456546, ����� 19.10.2009 ����� ���������������� �-�� �. ������',1,'�. ������, ��. �����������, �.23, ��. 234')
INSERT INTO Clients VALUES ('������� ������� �������','���. 5654 �654534, ����� 09.06.2008 ����� ���������������� �-�� �. �������-����� ���������� ���.',1,'�. �������-����� ���������� ���.')


SELECT c.ID,c.ClientName,c.IDClientStatus,cs.StatusName,c.ClientPasport,c.ClientAdress FROM Clients as c 
JOIN ClientStatus as cs ON cs.ID = c.IDClientStatus

----------------------------------------------------------------------------


INSERT INTO Employes VALUES ('�������� ����� ����������','���. 4564 �458795, ����� 09.06.2009 ����� ���������������� �-�� �. ����','375257778650','�. �������-����� ���������� ���.')
INSERT INTO Employes VALUES ('������� �������� ��������','���.4565 �956495, ����� 09.03.2008 ����� �������������� �-�� �. ������������','375257778650','�. �������-����� ���������� ���.')
INSERT INTO Employes VALUES ('�������� �������� ����������','���. 6545 �344554, ����� 01.02.2000 ��� ������������� �-�� �. ������������','375257778650','�. ����������, ��. �������, �.13')
INSERT INTO Employes VALUES ('������� ������ ��������','���. 0965 �456546, ����� 19.10.2009 ����� ���������������� �-�� �. ��������','375257778650','�. ��������, ��. ���������, �.123, ��.45')
INSERT INTO Employes VALUES ('�������� ������ ���������','���. 0965 �458795, ����� 09.06.2009 ����� ���������������� �-�� �. ����������','375257778650','�. ������������, ��. ����, �.13, ��.45')
INSERT INTO Employes VALUES ('��������� ���� ��������','���. 5654 �654354, ����� 19.07.2009 ����� ���������������� �-�� �. �������-����� ���������� ���.','375257778650','�������� ���., �. ������������, ��. ������, �.5')
INSERT INTO Employes VALUES ('������ ������ ���������','���. 5654 �654536, ����� 09.06.2008 ����� ���������������� �-�� �. �������-����� ���������� ���.','375257778650','�. ����')


SELECT ID,EmployeeName, EmployePhone,EmployeePasport,EmployesAdress FROM Employes

----------------------------------------------------------------------------



INSERT INTO EmployeeType VALUES ('����� ���������')
INSERT INTO EmployeeType VALUES ('����� ����������� �����')
INSERT INTO EmployeeType VALUES ('��������-������ ������')
INSERT INTO EmployeeType VALUES ('���������� � ���������')
INSERT INTO EmployeeType VALUES ('�������� ������������� ����� ���������')
INSERT INTO EmployeeType VALUES ('����������� ������ ������')

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

--��������� ������� �� ����������� ����
SELECT ID,RoomNumber FROM Rooms WHERE ID NOT IN 
(SELECT rr.IDRoom FROM ReservedRooms as rr WHERE rr.DateEnd >= '2018-05-05' AND rr.DateBegin <= '2018-05-06'  GROUP BY rr.IDRoom)


SELECT rr.IDRoom FROM ReservedRooms as rr WHERE rr.DateEnd >= '2018-05-01' AND rr.DateBegin <= '2018-05-01'  GROUP BY rr.IDRoom

--������� ����������
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


INSERT INTO HotelServices VALUES ('���������� ��������, �����','10')
INSERT INTO HotelServices VALUES ('����, �����','10')
INSERT INTO HotelServices VALUES ('����� �������','2')
INSERT INTO HotelServices VALUES ('������ ������, ���','10')
INSERT INTO HotelServices VALUES ('���','30')
INSERT INTO HotelServices VALUES ('������ � ���������� ������, ���','10')
INSERT INTO HotelServices VALUES ('�����, ���','20')

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