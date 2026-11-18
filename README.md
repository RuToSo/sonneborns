# sonneborns.de – Hobby-Imkerei Sonneborn

Website der Hobby-Imkerei Sonneborn in Erndtebrück.
Reines HTML/CSS – kein WordPress, keine Datenbank, keine Cookies, keine Google-Dienste.
Gehostet über GitHub Pages.

## Aufbau

| Pfad | Inhalt |
|---|---|
| `index.html` | Startseite |
| `blog/` | Blogübersicht |
| `2020/…`, `2021/…` | Blogbeiträge (gleiche Adressen wie auf der alten WordPress-Seite) |
| `bilder-und-ansichten/` | Bildergalerie |
| `link-weiterleitungen/` | Links |
| `datenschutz-impressum/` | Impressum & Datenschutz |
| `404.html` | Fehlerseite |
| `assets/` | CSS, JavaScript, Schriften (lokal), Favicon |
| `wp-content/uploads/` | Bilder und Video (gleiche Pfade wie bisher) |
| `tools/` | Skript zum einmaligen Übernehmen der Bilder |

## Einrichten (einmalig)

1. **Bilder holen** – solange die alte Seite noch online ist:
   Windows: Doppelklick auf `tools\bilder-holen.bat`.
   macOS/Linux: `bash tools/bilder-holen.sh`.
   Die Dateien landen unter `wp-content/uploads/`.
2. **Repo anlegen** – auf GitHub ein neues Repo erstellen (z. B. `sonneborns.de`) und den kompletten Ordner hochladen:
   ```
   git init
   git add .
   git commit -m "Neue Website"
   git branch -M main
   git remote add origin https://github.com/<konto>/sonneborns.de.git
   git push -u origin main
   ```
3. **GitHub Pages einschalten** – im Repo unter *Settings → Pages*: Source *Deploy from a branch*, Branch `main`, Ordner `/ (root)`.
   Bei *Custom domain* `www.sonneborns.de` eintragen und speichern (GitHub legt dabei die Datei `CNAME` an).
   Danach *Enforce HTTPS* aktivieren.
4. **DNS umstellen** – beim Domain-Anbieter:
   - `www` als CNAME auf `<konto>.github.io`
   - die nackte Domain `sonneborns.de` als A-Records auf
     `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   Erst umstellen, wenn Schritt 1 erledigt ist – danach ist die alte Seite nicht mehr erreichbar.

## Testen unter rutoso.de

Solange bei *Custom domain* **nichts** eingetragen ist (keine `CNAME`-Datei im Repo), erscheint die Seite
automatisch unter `https://rutoso.de/<repo-name>/` – z. B. Repo `sonneborns` → `rutoso.de/sonneborns/`.
Alle Pfade sind relativ, die Seite läuft deshalb im Unterordner genauso wie später auf der eigenen Domain.

- **Deaktivieren:** *Settings → Pages →* Schaltfläche **Unpublish site** – die Adresse ist sofort weg, das Repo bleibt.
- **Wieder aktivieren:** unter *Build and deployment* den Branch `main` erneut auswählen und speichern.

## Pflegen

- **Neuer Blogbeitrag:** einen Beitragsordner kopieren (z. B. `2021/03/29/bienentraenke/`), Datum/Ordner anpassen,
  Text und Bilder ändern, dann in `blog/index.html` und ggf. auf der Startseite eine Karte ergänzen.
- **Neue Bilder:** nach `wp-content/uploads/<Jahr>/<Monat>/` legen. Vor dem Hochladen am besten auf ca. 1600 px Breite verkleinern.
- **Jahr / Stand** steht in der Fußzeile jeder Seite.

## Hinweise

- Alle Seiten haben `noindex, nofollow` – wie bisher erscheint die Seite nicht in Suchmaschinen.
  Soll sie gefunden werden, die Zeile `<meta name="robots" …>` entfernen.
- Die Datenschutzerklärung ist auf GitHub Pages zugeschnitten. Bei einem anderen Hoster Punkt 3 anpassen.
  Die Rechtstexte sind eine Vorlage und keine Rechtsberatung.
- Schriften: Open Sans und Chau Philomene One (SIL Open Font License, siehe `assets/fonts/`).
