# Francotti HUD

Vintage-style rijcomputer voor iPhone, gebouwd als webapp/PWA in dezelfde
stijl als het Jaeger Dashboard-project (chromen bezel, zwarte wijzerplaat,
cream/goud Futura-cijfers, needle-mechaniek en glow/pulse-waarschuwingen).

## Onderdelen

- **Snelheid** — analoge naaldmeter (0–200 km/h), gedreven door GPS
  (`navigator.geolocation.watchPosition`, met haversine-fallback als
  `coords.speed` ontbreekt).
- **Speedlimiet** — rond verkeersbord-plaatje, opgehaald via de gratis
  OpenStreetMap Overpass API (dichtstbijzijnde weg, `maxspeed`-tag).
  Als de gemeten snelheid de limiet met >5 km/h overschrijdt, gloeit de
  snelheidsnaald rood (zelfde pulse-mechanisme als Jaeger's vorst-waarschuwing).
- **Kompas** — optioneel, uit te zetten via de COMPASS-knop. Identieke
  mechaniek als het Jaeger-kompas (deviceorientation, iOS-permissieflow,
  schermrotatie-compensatie, kalibratie-offset).
- **Vorst-alert** — telltale-icoon dat blauw pulseert onder 3 °C,
  temperatuur via Open-Meteo op basis van GPS-positie.
- **Navigatie** — Mapbox turn-by-turn (MVP): adres invoeren, route wordt
  berekend en de eerstvolgende afslag/instructie wordt getoond. Vereist een
  gratis Mapbox-token (knop "MAPBOX KEY" in de footer, wordt lokaal
  opgeslagen). **Let op:** dit is bewust een eenvoudige versie zonder
  automatische herroutering — bij een gemiste afslag opnieuw op "GA" tikken
  om de route te herberekenen.

## Publiceren

Dubbelklik `publish.command`. Eerste keer moet je zelf een lege GitHub-repo
genaamd `hud` aanmaken onder je account en eenmalig koppelen:

```
git remote add origin https://github.com/francotti/hud-francotti.git
git push -u origin main
```

Daarna is dubbelklikken op `publish.command` genoeg. Live op
`https://francotti.github.io/hud-francotti/` zodra GitHub Pages aan staat
voor de repo (Settings → Pages → Branch: main).

## Op een (oude) iPhone gebruiken

Zelfde recept als Jaeger: open de live URL in Safari → Deel → **Zet op
beginscherm**. Zet Automatisch vergrendelen op **Nooit** en voed het
toestel via de USB van de auto.

## Bekende beperkingen (v1)

- Speedlimiet-dekking hangt af van OpenStreetMap-data; op sommige wegen
  ontbreekt de `maxspeed`-tag.
- Navigatie herroutert niet automatisch bij een gemiste afslag.
- Geen kaartweergave — alleen tekstuele afslaginstructies.
