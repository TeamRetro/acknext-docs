# `ackrc` Resource Compiler

Kompiliert Resourcen in das Engine-eigene Format.

## Kommandozeile

```bash
ackrc target [-o output] [-R] input
```

## Optionen

- **`target`**
  Der Typ Resource, welcher übersetzt werden soll.
- **`input`**
	Die Eingabe-Datei, welche übersetzt werden soll.
- **`-o output`**
	*Optional:* Die Ausgabe-Datei, welche erzeugt werden soll. Falls dieser
	nicht angegeben wird, wird der Eingabe-Dateiname verwendet und dessen
	Dateiendung ausgetauscht. Hierbei wird der Pfad der Eingabedatei ignoriert
	und die Datei im Arbeitsverzeichnis erzeugt.
- **`-R`**
	*Optional:* Verwende den Pfad der Eingabedatei und erzeuge die Ausgabe
	direkt "neben" der Eingabedatei, unabhängig vom Arbeitsverzeichnis.

## Resourcentypen
Im folgenden werden die Eingabedateien der einzelnen Resourcentypen erklärt.
Hierbei ist in der Überschrift des Abschnittes der `target`-Parameter angegeben.

### Textures (`target=texture`)
Die Eingabedaten des Textur-Kompilers sind Bilddateien in einem der folgenden
Formate:

`.bmp`, `.cur`, `.gif`, `.ico`, `.jpg`, `.jpeg`, `.lbm`, `.pcx`, `.png`, `.pnm`, `.tif`, `.tiff`, `.xcf`, `.xpm`, `.xv`

### Materials (`target=material`)

Materialien werden über eine JSON-Datei kodiert und erlauben es so,
alle möglichen Konfigurationen anzunehmen.

```json
{
	"type": "acknext-material",
	"albedo": [ 1, 1, 1 ],
	"emission": [ 0, 0, 0 ],
	"roughness": 0.8,
	"metalness": 0.0,
	"fresnell": 0.0,
	"textures": {
		"embed": false,
		"share": true,
		"albedo": "/textures/metal_albedo.atx",
		"normal": "/textures/metal_normal.atx",
		"attribute": "/textures/metal_attributes.atx",
		"emission": "/textures/metal_attributes.atx"
	}
}
```

Die einzelnen Variablen dieser JSON-Datei entsprechen den
[[MATERIAL]]-Eigenschaften und sind option. Hiervon ausgenommen ist die
Markierung `type`, welche immer den Wert `"acknext-material"` haben muss.

| Variable             | Typ       | Wertebereich                           | Standardwert  |
|----------------------|-----------|----------------------------------------|---------------|
| `albedo`             | `array`   | 3 Elemente zwischen `[0…∞)`            | `[ 1, 1, 1 ]` |
| `emission`           | `array`   | 3 Elemente zwischen `[0…∞)`            | `[ 0, 0, 0 ]` |
| `roughness`          | `float`   | `[0…1]`                                | `0.8`         |
| `metalness`          | `float`   | `[0…1]`                                | `0.0`         |
| `fresnell`           | `float`   | `[0…∞)`                                | `0.0`         |
| `textures.embed`     | `boolean` | `true` oder `false`                    | `false`       |
| `textures.share`     | `boolean` | `true` oder `false`                    | `true`        |
| `textures.albedo`    | `string`  | Dateipfad zur kompilierten Texturdatei | `""`          |
| `textures.normal`    | `string`  | Dateipfad zur kompilierten Texturdatei | `""`          |
| `textures.attribute` | `string`  | Dateipfad zur kompilierten Texturdatei | `""`          |
| `textures.emission`  | `string`  | Dateipfad zur kompilierten Texturdatei | `""`          |

In den Arrays `albedo` und `emission` werden jeweils Farbvektoren abgelegt,
hierbei werden die Farbwerte in der Reihenfolge *Rot*, *Grün*, *Blau* abgelegt.

Die Dateipfade müssen so angegeben werden, dass diese zur Laufzeit der Engine
korrekt via [[file_open_read]] geladen werden können. Hierbei ist zu beachten,
ob das virtuelle Dateisystem verwendet wird oder nicht. Wenn ein Dateipfad nicht
angegeben wird, verwendet das Material für den angegeben Wert keine Textur.

`textures.embed` muss in der aktuellen Implementierung immer `false` sein, kann
aber auch optional komplett weggelassen werden.

`textures.share` gibt an, ob die Texturen mit anderen Materialen geteilt werden
sollen oder ob dieses Material eine eigene, modifizierbare Kopie der Textur
erhält. Falls `textures.embed == true`, wird diese Option ignoriert.

### Models (`target=model`)

### Shaders (`target=shader`)

### Sounds (`target=sound`)