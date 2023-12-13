--Datenbanken
--Praktikumsblatt Nr.4
--Aufgabe 10: Implementierung des verfeinerten RM
--by Adrian Morgenthal & Jonas Hildebrandt

-- Löschen der Altlasten --
DECLARE
    table_name VARCHAR2(30);

    CURSOR table_cursor IS
        SELECT table_name
        FROM user_tables;

BEGIN
    FOR table_rec IN table_cursor LOOP
            table_name := table_rec.table_name;

            -- Überprüfe, ob die Tabelle existiert
            BEGIN
                EXECUTE IMMEDIATE 'DROP TABLE ' || table_name;
                DBMS_OUTPUT.PUT_LINE('Tabelle ' || table_name || ' erfolgreich gelöscht.');
            EXCEPTION
                WHEN OTHERS THEN

                    CONTINUE;
            END;
        END LOOP;
END;







-- Erstellen neuer Entity Tabellen  --
CREATE TABLE Patienten(
    PatientenID         INTEGER PRIMARY KEY,
    Vorname             VARCHAR(30) NOT NULL,
    Nachname            VARCHAR(30) NOT NULL,
    Adresse             VARCHAR(30) NOT NULL,
    Geburtsdatum        DATE NOT NULL,
    Versichertenstatus  VARCHAR(10) CHECK ( Versichertenstatus in ('privat', 'gesetzlich'))
);

CREATE TABLE Apotheke(
    ApothekenID         INTEGER PRIMARY KEY,
    Name                VARCHAR(30) NOT NULL,
    Adresse             VARCHAR(30) NOT NULL
);

CREATE TABLE Untersuchung(
    UntersuchungsID     INTEGER PRIMARY KEY,
    Art                 VARCHAR(30),
    URL                 VARCHAR(1000)
);

CREATE TABLE Hausarzt(
    HausarztID          INTEGER PRIMARY KEY,
    Name                VARCHAR(30),
    Adresse             VARCHAR(30)
);

CREATE TABLE Facharzt(
    FacharztID          INTEGER PRIMARY KEY,
    Name                VARCHAR(30),
    Adresse             VARCHAR(30),
    Fachgebiet          VARCHAR(50)
);

CREATE TABLE Labor(
    LaborID             INTEGER PRIMARY KEY,
    Name                VARCHAR(30),
    Adresse             VARCHAR(30)
);

CREATE TABLE Befund(
    BefundID            INTEGER PRIMARY KEY,
    Beschreibung        VARCHAR(250),
    Weiterführendes     VARCHAR(1000)
);

CREATE TABLE Patientenakte(
    AktenID             INTEGER PRIMARY KEY
);

CREATE TABLE Proben(
    ProbenNr            INTEGER PRIMARY KEY ,
    Art                 VARCHAR(30)
);

CREATE TABLE eRezept(
    RezeptID            INTEGER PRIMARY KEY ,
    Medikament          VARCHAR(100),
    Art                 VARCHAR(30)
);

CREATE TABLE Messwerte(
    MesswertID          INTEGER PRIMARY KEY,
    ErgebnisURL         VARCHAR(1000)
);



-- Erstellen neuer Ansichten --
CREATE TABLE PatientLöstEin (
    PatientenID     INTEGER REFERENCES Patienten ON DELETE CASCADE,
    ApothekenID     INTEGER REFERENCES Apotheke,
    PRIMARY KEY     (PatientenID)
);

CREATE TABLE HAerstellt (
    HausarztID      INTEGER REFERENCES Hausarzt,
    RezeptID        INTEGER REFERENCES eRezept ON DELETE  CASCADE,
    PRIMARY KEY     (RezeptID)
);

CREATE TABLE PatientHatRezept(
    PatientenID     INTEGER REFERENCES Patienten ON DELETE CASCADE,
    RezeptID        INTEGER REFERENCES eRezept ON DELETE CASCADE,
    PRIMARY KEY     (RezeptID)
);

CREATE TABLE HAführt(
    HausarztID      INTEGER REFERENCES Hausarzt,
    AktenID         INTEGER REFERENCES Patientenakte ON DELETE CASCADE,
    PRIMARY KEY     (AktenID)
);

CREATE TABLE FAführt(
    FacharztID      INTEGER REFERENCES Facharzt,
    AktenID         INTEGER REFERENCES Patientenakte ON DELETE CASCADE,
    PRIMARY KEY     (AktenID)
);

CREATE TABLE HAführtDurch(
    HausarztID      INTEGER REFERENCES Hausarzt,
    UntersuchungsID INTEGER REFERENCES UNTERSUCHUNG ON DELETE CASCADE,
    PRIMARY KEY     (UntersuchungsID)
);

CREATE TABLE FAführtDurch(
    FacharztID      INTEGER REFERENCES Facharzt,
    UntersuchungsID INTEGER REFERENCES UNTERSUCHUNG ON DELETE CASCADE,
    PRIMARY KEY     (UntersuchungsID)
);

CREATE TABLE HAbetreut(
    HausarztID      INTEGER REFERENCES Hausarzt ON DELETE CASCADE ,
    PatientenID     INTEGER REFERENCES Patienten ON DELETE CASCADE ,
    PRIMARY KEY     (PatientenID)
);

CREATE TABLE PatientHat(
    PatientenID     INTEGER REFERENCES Patienten ON DELETE  CASCADE ,
    AktenID         INTEGER REFERENCES Patientenakte
);

CREATE TABLE HAnimmt(
    HausarztID      INTEGER REFERENCES Hausarzt,
    ProbenNr        INTEGER REFERENCES Proben ON DELETE CASCADE ,
    PRIMARY KEY     (ProbenNr)
);

CREATE TABLE FAnimmt(
    FacharztID      INTEGER REFERENCES Facharzt,
    ProbenNr        INTEGER REFERENCES Proben ON DELETE CASCADE,
    PRIMARY KEY     (ProbenNr)
);

CREATE TABLE PatientGibt(
    PatientenID     INTEGER REFERENCES Patienten ON DELETE CASCADE,
    ProbenNr        INTEGER REFERENCES Proben ON DELETE CASCADE,
    PRIMARY KEY     (ProbenNr)
);

CREATE TABLE PatientenakteEnthält(
    AktenID         INTEGER REFERENCES Patientenakte ON DELETE CASCADE,
    BefundID        INTEGER REFERENCES Befund ON DELETE CASCADE ,
    PRIMARY KEY     (BefundID)
);

CREATE TABLE FAarbeitetMit(
    FacharztID      INTEGER REFERENCES Facharzt ON DELETE CASCADE,
    LaborID         INTEGER REFERENCES Labor ON DELETE CASCADE,
    PRIMARY KEY     (FacharztID, LaborID)
);

CREATE TABLE HAarbeitetMit(
    HausarztID      INTEGER REFERENCES Hausarzt ON DELETE CASCADE,
    LaborID         INTEGER REFERENCES Labor ON DELETE CASCADE,
    PRIMARY KEY     (HausarztID, LaborID)
);

CREATE TABLE LaborMisst(
    LaborID         INTEGER REFERENCES Labor ON DELETE CASCADE,
    MesswertID      INTEGER REFERENCES Messwerte ON DELETE CASCADE
);

COMMIT