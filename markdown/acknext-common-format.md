# Acknext Common File Format

Das Acknext Common File Format (ACFF) wird von der Engine als generisches Dateiformat verwendet,
welches einfach Erweiterungen erlaubt und die Unterscheidung der gespeicherten Daten auch ohne
eine Dateiendung ermöglicht.

Alle Daten sind im Little-Endian-Format gespeichert und können somit mit einer herkömmlichen
PC-Architektur (PC, x86) einfach verarbeitet werden.

## Header

| Offset | Größe | Inhalt / Beschreibung                                              |
|--------|-------|--------------------------------------------------------------------|
|    `0` |  `12` | `{ 'A', 'C', 'K', 'N', 'E', 'X', 'T', 0, 0x67, 0xE3, 0x41, 0xCC }` |
|   `12` |   `4` | [[ACKTYPE]] der Datei                                              |
|   `16` |  `16` | [[ACKGUID]] des serialisierten Dateitypen                          |

Anhang des Typens sowie des GUID wird anschließend das [Filehandle](ACKFILE.md) an einen zur
Datei passenden Lader übergeben. Dieser wird entweder von der Engine oder aber
von einem [Erweiterungsmodul](EXTENSION.md) bereitgestellt.

## Modelldaten Version 1 (`*.amd`)
GUID: `c4a67fe0-8274-4390-8ed6-50610b0a54f8`

Abkürzung: **A**cknext **M**odel **D**ata

```
uint32 boneCount
uint32 meshCount
uint32 animationCount
boneCount * BONE(
	char  name[64]
	uint8 parentId
	mat4  transform
	mat4  bindToBoneTransform
)
meshCount * !MESH
meshCount * !MATERIAL
```

## Meshdaten (`*.a3d`)
GUID: `ceb9e222-c803-43ac-81a9-149a32c5f39b`

Abkürzung: **A**cknext **3D** Mesh

```
uint32 primitiveType
uint32 indexCount
uint32 vertexCount
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
float metallic
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

## Acknext Symbol Link
GUID: `6fb9e9d6-8786-49f0-9d6d-3916a7ba9c41`

Dieses Format speichert einen symbolischen Link zu einer externen Datei
im virtuellen Dateisystem und kann somit als "Ersatz" für ein tatsächliche
serialisiertes Objekte angegeben werden.

Symbolische Links werden automatisch von der Engine aufgelöst und die
referenzierte Datei anstelle des tatsächlich angebenen Dateipfades geladen.

```
uint8  allowCaching
string filePath
```