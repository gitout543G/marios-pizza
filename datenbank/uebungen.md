# Übungen Datenbank

## Übung 00
- doppelt: Bella Farina mit Telefon in E1 und E3
- mehrere Werte: "Mehl Tipo 00, Hefe" in einer Zelle
- Widerspruch: Mehlpreis könnte 1,20 und 1,25 lauten
- Frage: Mehl im September nur von Hand

## Übung 01
- Entität: Rezept
- Attribute: Titel, Zubereitungsdauer, Schwierigkeit, Veröffentlichungsdatum, rezept_id, zutat_id, sammlung_id, kategorie_id


- Entität: Kategorie
- Attribute: Bezeichnung, kategorie_id

- Entität: Zutat
- Attribute: Namen, Einheit, Menge, zutat_id, rezept_id

- Entität Leser
- Attribute: Vorname, Nachname, E-Mail, leser_id

- Entität: Kommentar
- Attribute: Text, Sterne, kommentar_id, leser_id, rezept_id

- Entität: Sammlung
- Attribute: Name von Rezept, Saison, Kategorie, Beschreibung, sammlung_id, rezept_id


Übung 06 Extra


CREATE TABLE lieferant (
    lieferant VARCHAR(40) PRIMARY KEY,
    telefon VARCHAR(20)
);

CREATE TABLE einkauf (
    einkauf_nr VARCHAR(5) PRIMARY KEY,
    datum DATE,
    lieferant VARCHAR(40),
    FOREIGN KEY (lieferant)
        REFERENCES lieferant(lieferant)
);

CREATE TABLE ware (
    ware VARCHAR(40) PRIMARY KEY,
    einzelpreis DECIMAL(6,2),
    warengruppe VARCHAR(20)
);

CREATE TABLE einkaufsposition (
    einkauf_nr VARCHAR(5),
    ware VARCHAR(40),
    menge INT,
    PRIMARY KEY (einkauf_nr, ware),
    FOREIGN KEY (einkauf_nr)
        REFERENCES einkauf(einkauf_nr),
    FOREIGN KEY (ware)
        REFERENCES ware(ware)
);
