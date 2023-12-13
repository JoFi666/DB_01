INSERT INTO Patienten(PatientenID, Vorname, Nachname, Adresse, Geburtsdatum, Versichertenstatus)
VALUES  (1, Franz, Gilbert, "Elsterweg 7" , 05.12.2003, privat);
        (2, Herbert, Mayer, "Berliner Straße 18", 12.05.1988, gesetzlich),
        (3, Gisela, Petersen, "Franziskanerweg 5", 01.01.1960, gesetzlich),
        (4, Magdalena, Walther, "Querstraße 60", 25.10.1999, privat),
        (5, Frauke, Eberth, "Bahnhofstraße 5", 13.12.1975, privat),
        (6, Peter, Mensch, "Hirschhalde 45", 30.09.1997, gesetzlich),
        (7, Leon, Quack, "Mardersteige 12", 02.07.2008, null),
        (8, Annalena, Sturm, "Querstraße 61", 09.09.2009, privat),
        (9, Leah, Müller, "Birnenallee 201", 24.04.1947, gesetzlich),
        (10, Gerda, Krug, "Bahnhofstraße 4", 07.09.1969, privat);

INSERT INTO Apotheke(ApothekenID, Name, Adresse)
VALUES  (1, Adlerapotheke, "Lange Straße 5"),
        (2, "Apotheke zum Wilden Schwein", "Breite Straße 37"),
        (3, "Dittmarscher Apotheke", "Isengard 1"),
        (4, "Planck-Apotheke", "Dorfkrug 19"),
        (5, "Gesundheitshaus", "Leidensweg 66"),
        (6, "Heilungshütte", "Hebelstraße 42"),
        (7, "Anti-Ableben-Apotheke", "Hurtigruten 8");

INSERT INTO Untersuchung(UntersuchungsID, Art, URL)
VALUES  (1, Blutuntersuchung, null),
        (2, Urinanalyse, null),
        (3, Röntgenuntersuchung, null),
        (4, Magnetresonanztomographie, null),
        (5, Elektrokariogramm, null),
        (6, Ultraschalluntersuchung, null),
        (7, Computertomographie, null),
        (8, Hautbiopsie, null),
        (9, Lungenfunktionstest, null);

INSERT INTO Hausarzt(HausarztID, Name, Adresse)
VALUES (1, Mayer, "Kurzer Weg 5"),
        (2, Huber, "Langer Weg 9");

INSERT INTO Facharzt(FacharztID, Name, Adresse, Fachgebiet)
VALUES (1, Bredehöft, "Am Steinberg 17", "Hals, Nasen, Ohren"),
       (2, Michaelis, "Inselgarten 8", "Handchirugie"),
       (3, Öpni, "Schweizerstraße 1/1", "Notfallmedizin"),
       (4, Petersen, "Eierstraße 5","Augen");

INSERT INTO Befund(BefundID, Beschreibung, URL)
VALUES  (1, "Nüchternblutzucker 90 mg/dL."),
        (2, "Proteinurie positiv."),
        (3, "Degenerative Veränderungen der Wirbelsäule."),
        (4, "Keine Anomalien im Gehirn nachgewiesen."),
        (5, "Normaler Sinusrhythmus, keine ST-Segment-Veränderungen."),
        (6, "Normale Leber- und Nierenstruktur."),
        (7, "CT des Abdomens: Appendizitis bestätigt."),
        (8, "Melanozitäres Niveau ohne Anzeichen von Malignität."),
        (9, "Normale Lungenfunktion.");

INSERT INTO Patientenakte(AktenID)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10);

INSERT INTO Proben(ProbenNr, Art)
VALUES (1, Blut),
       (2, Stuhl),
       (3, Samen),
       (4, Urin),
       (5, Gewebe);

INSERT INTO eRezept(RezeptID, Medikament, Art)
VALUES (1, Kassen),
       (2, Privat),
       (3, OTC),
       (4, Heilmittelverordnung),
       (5, T),
       (6, BTM),
       (7, Hilfsmittel);

INSERT INTO Messwerte(MesswertID, ErgebnisURL)
VALUES (1,null ),
       (2, null),
       (3, null),
       (4, null),
       (5, null),
       (6, null),
       (7, null),
       (8, null),
       (9, null),
       (10, null);


