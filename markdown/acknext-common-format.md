# Acknext Common File Format

Das Acknext Common File Format (ACFF) wird von der Engine als generisches Dateiformat verwendet,
welches einfach Erweiterungen erlaubt und die Unterscheidung der gespeicherten Daten auch ohne
eine Dateiendung ermöglicht.

Alle Daten sind im Little-Endian-Format gespeichert und können somit mit einer herkömmlichen
PC-Architektur (PC, x86) einfach verarbeitet werden.

## Datei-/Objektheader

| Offset | Größe | Inhalt / Beschreibung                                              |
|--------|-------|--------------------------------------------------------------------|
|    `0` |  `12` | `{ 'A', 'C', 'K', 'N', 'E', 'X', 'T', 0, 0x67, 0xE3, 0x41, 0xCC }` |
|   `12` |   `2` | [[ACKTYPE]] der Datei                                              |
|   `14` |   `2` | *Version* des Formats                                              |
|   `16` |  `16` | [[ACKGUID]] des serialisierten Dateitypen                          |

Anhang des Typens sowie des GUID wird anschließend das [Filehandle](ACKFILE.md) an einen zur
Datei passenden Lader übergeben. Dieser wird entweder von der Engine oder aber
von einem [Erweiterungsmodul](EXTENSION.md) bereitgestellt.

Falls *Version* nicht 0 ist, wird ein erweiterter Header verwendet:

| Offset | Größe | Inhalt / Beschreibung                                              |
|--------|-------|--------------------------------------------------------------------|
|   `32` |   `4` | *Unique ID* des Objektes                                           |
|   `36` |   `4` | Anzahl an Eigenschaften des geladenen Objektes                     |
|   `40` |  `60` | Padding auf 64 Byte Größe                                          |

Hier gibt die *Unique ID* eine Identifikationsnummer an, welche bei der Serialisierung
von zusammengesetzten Objekten entweder `0` oder aber eindeutig sein muss.

Falls die *Unique ID*  gesetzt ist, kann beim Deserialisieren später auf diese *Unique ID*
verwiesen werden und somit ein doppeltes Laden/Abspeichern von Objekten verhindert.

Die Anzahl an Properties gibt an, wie viele Eigenschaften hinter dem Header serialisiert
werden und anschließend an das Objekt gebunden.

Eigenschaften besitzen folgendes Format:

```
string name
uint32 type
uint32 length
uint8[length] data
```

Hierbei ist der Inhalt in `data` abhängig von `type` zu interpretieren.

> TODO: Dokumentiere Eigenschaften

## Acknext Symbol Link
GUID: `6fb9e9d6-8786-49f0-9d6d-3916a7ba9c41`

Dieses Format speichert einen symbolischen Link zu einer externen Datei
im virtuellen Dateisystem und kann somit als "Ersatz" für ein tatsächliche
serialisiertes Objekte angegeben werden.

Symbolische Links werden automatisch von der Engine aufgelöst und das Objekt
aus der referenzierte Datei anstelle der aktuellen Datei geladen.

```
uint8  allowCaching
string filePath
```

## Acknext Backreference
GUID: `0723d144-f3df-44ff-a24e-ce9d1047ade9`

Dieses Format verweist auf ein ein schon vorher serialisiertes Objekt durch eine 
*Unique ID*.

Backreferences werden automatisch von der Engine aufgelöst und das referenzierte
Objekt anstelle eines neuen Objektes geladen.

```
uint32 referencedID
```

## Modelldaten Version 1 (`*.amd`)
GUID: `c4a67fe0-8274-4390-8ed6-50610b0a54f8`

Abkürzung: **A**cknext **M**odel **D**ata

```
uint32 boneCount
uint32 meshCount
uint32 animationCount
uint32 minimumLOD
boneCount * BONE(
	char  name[64]
	uint8 parentId
	mat4  transform
	mat4  bindToBoneTransform
)
meshCount * !MESH
meshCount * !MATERIAL
animationCount * ANIM(
	string name
	float duration
	uint32 flags
	uint32 channelCount
	channelCount * CHAN(
		uint8 targetBone
		uint32 frameCount
		frameCount * FRAME(
			float time
			vec3 position
			quat rotation
			vec3 scale
		)
	)
)
```

## Meshdaten (`*.a3d`)
GUID: `ceb9e222-c803-43ac-81a9-149a32c5f39b`

Abkürzung: **A**cknext **3D** Mesh

```
uint32 primitiveType
uint32 indexCount
uint32 vertexCount
uint32 lodMask
indexCount * uint32
vertexCount * VERTEX(
	vec3 positon
	vec3 normal
	vec3 tangent
	vec4 color
	vec2 uv0
	vec2 uv1
	ubyte4 boneIds
	ubyte4 boneWeights
)
```

## Acknext Material Format (`*.amf`)
GUID: `324c6780-82b0-473d-a0a9-e0a34f6beea2`

Abkürzung: **A**cknext **M**aterial **F**ormat

```
vec4 albedo
vec4 emission
float roughness
float metalness
float fresnell
uint8 mask (1=albedo,2=normal,4=attribute,8=emission)
mask&1: !TEXTURE albedo
mask&2: !TEXTURE normal
mask&4: !TEXTURE attribute
mask&8: !TEXTURE emission
```

## Texturdaten (`*.atx`)
GUID: `b40f6426-2d6c-44b3-bd3d-629faa5aefe7`

Abkürzung: **A**cknext **T**e**x**ture

```
uint32 target
uint32 textureFormat
uint32 width
uint32 height
uint32 depth
uint32 pixelFormat
uint32 pixelType
uint32 bufsiz
byte[bufsiz] pixels

```

## Shaderdaten (`*.asp`)
GUID: `d247fbc8-7a2a-4521-a2c6-5ab5522c2843`

Abkürzung: **A**cknext **S**hader **P**rogram

## Sounddaten (`*.asn`)
GUID: `fa76951d-49a5-4c56-94be-0fd6d8988d97`

Abkürzung: **A**cknext **S**ou**n**d