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


