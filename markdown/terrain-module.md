# Terrain-Modul

Eine Erweiterung der Engine, welche es erlaubt, große Terrains zu laden und
darzustellen.

## Funktionen (`acknext/ext/terrain.h`)
```ack
void terrainmodule_init();
```
Initialisiert das Terrain-Modul und registriert den Dateityp für Terrains.

```ack
float terrain_getheight(MODEL * terrain, float x, float z);
```
Liest einen interpolierten Höhenwert aus dem Terrain.

**Parameter:**
- **`terrain`**
  Das Terrain-Modell, welches mit `model_load` geladen wurde.
- **`x`**, **`z`**
  Terrain-lokale Koordinaten, welche ihren Ursprung in der
	südwestlichsten Ecke des Terrains haben.

**Rückgabewert:** Höhe des Terrains an der Stelle (x,z) in Metern.

## Terrain-Compiler

```bash
$ terrac [-o outfile] [-c climatefile] infile
```

Kompiliert ein L3DT-Terrain in eine einzelne Terraindatei für das
Erweiterungsmodul. Erlaubt die Angabe einer Ausgabedatei sowie einer
Climate-Datei.

**Parameter:**
- **`-o dateiname`** (Optional)
  Gibt die Zieldatei des Terrain-Compilers an. Wird diese nicht angegeben,
	wird der Name der Zieldatei über den Namen der Eingabedatei bestimmt.
- **`-c dateiname`** (Optional)
  Gibt die Climate-Datei an, welche für das Terrain verwendet werden soll.
	Diese definiert die einzelnen Texturen für die im Terrain verwendeten Materials.
- **`infile`**
  Gibt das L3DT-Projekt an, welches zu einem Terrain kompiliert werden soll.

## Terrain Datei (`*.esd`)
GUID: `5507c27d-37b7-4623-b363-ed273e7ba962`

```
uint32 size_x
uint32 size_z // size = size_x * size_z
float hscale
float[size] height
TERRAMAT(
	uint8 material
	uint8 data
)[size]
!BITMAP normalMap
!BITMAP textureArray
```

## Terrain Climate Date (`*.cli`)
> TBD