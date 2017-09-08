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
uint32 meshCount
uint32 animationCount
uint32 boneCount
boneCount * BONE(
	char  name[64]
	uint8 parentId
	mat4  transform
	mat4  bindToBoneTransform
)
meshCount * MESH
meshCount * MATERIAL(
	vec4 albedo
	vec4 emission
	float roughness
	float metallic
	float fresnell
)
```

## Meshdaten (`*.a3d`)
GUID: `ceb9e222-c803-43ac-81a9-149a32c5f39b`

Abkürzung: **A**cknext **3D** Mesh

## Texturdaten (`*.atx`)
GUID: `b40f6426-2d6c-44b3-bd3d-629faa5aefe7`

Abkürzung: **A**cknext **T**e**x**ture

## Sounddaten (`*.asn`)
GUID: `fa76951d-49a5-4c56-94be-0fd6d8988d97`

Abkürzung: **A**cknext **S**ou**n**d

## Shaderdaten (`*.asp`)
GUID: `d247fbc8-7a2a-4521-a2c6-5ab5522c2843`

Abkürzung: **A**cknext **S**hader **P**rogram