                               


--1.	Creaţi tabela Dep conform machetei următoare:

CREATE TABLE Dep (
    ID NUMBER(7) PRIMARY KEY,
    Denumire VARCHAR2(25)
);

--2.	Introduceţi înregistrări în tabela Dep preluând date din tabela Departamente,
--incluzând doar câmpurile de care aveţi nevoie (id_department, denumire_departament).

DESC Departamente;
INSERT INTO Dep (ID, Denumire)
SELECT id_department, denumire_departament FROM Departamente;
--EXERCTIUTUL 3
CREATE TABLE Ang (
    ID NUMBER(7) PRIMARY KEY,
    Prenume VARCHAR2(25),
    Nume VARCHAR2(25),
    Dep_ID NUMBER,
    FOREIGN KEY (Dep_ID) REFERENCES Dep(ID)
);

--EX 4
ALTER TABLE Ang ADD Varsta NUMBER(2);
--EX5
ALTER TABLE Ang ADD CONSTRAINT Verifica_varsta CHECK (Varsta >= 18 AND Varsta <= 65);
--EX 6
ALTER TABLE Ang DISABLE CONSTRAINT Verifica_varsta;
 --EX7
 ALTER TABLE Ang MODIFY Nume VARCHAR2(30);
--EX8
ALTER TABLE Ang RENAME TO Ang2;
--EX9
CREATE TABLE Salariati AS
SELECT * FROM Angajati;
--EX10
INSERT INTO Salariati (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER)
VALUES
(1, 'Steven', 'Kong', 'steven.kong@example.com', '515.123.4567', TO_DATE('17-06-1987', 'DD-MM-YYYY'), 'AD_PRES', 24000, 0.1, 90);
INSERT INTO Salariati (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER)
VALUES
(2, 'Neena', 'Koch', 'neena.koch@example.com', '515.123.4568', TO_DATE('21-09-1989', 'DD-MM-YYYY'), 'AD_VP', 17000, 0.1, 100);
INSERT INTO Salariati (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER)
VALUES
(3, 'Lex', 'Haan', 'lex.haan@example.com', '515.123.4569', TO_DATE('13-01-1993', 'DD-MM-YYYY'), 'AD_VP', 17000, 0.2, 100);



--EX11
UPDATE Salariati
SET PRENUME = 'John'
WHERE ID_ANGAJAT = 3;

--EX12
UPDATE Salariati
SET EMAIL = 'JHAAN'
WHERE ID_ANGAJAT = 3;

--EX13
UPDATE Salariati
SET SALARIUL = SALARIUL * 1.10
WHERE SALARIUL < 20000;

--EX14
UPDATE Salariati
SET ID_FUNCTIE = 'AD_PRES'
WHERE ID_ANGAJAT = 2;

--EX15
UPDATE Salariati
SET COMISION = (SELECT COMISION FROM Salariati WHERE ID_ANGAJAT = 3)
WHERE ID_ANGAJAT = 2;

--EX16
DELETE FROM Salariati
WHERE ID_ANGAJAT = 1;
