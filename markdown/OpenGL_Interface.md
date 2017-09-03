# OpenGL Interface

Hier wird das Interface zu OpenGL beschrieben...

## Vertex Attribute
Die folgende Tabelle listet die einzelnen [[VERTEX]]-Attribute,
die die Engine verwendet, auf.

| Index | Wert         | Typ     |
|-------|--------------|---------|
|     0 | Position     | `vec3`  |
|     1 | Normale      | `vec3`  |
|     2 | Tangente     | `vec3`  |
|     3 | Vertexfarbe  | `vec3`  |
|     4 | UV 0         | `vec2`  |
|     5 | UV 1         | `vec2`  |
|     6 | Bone Indizes | `ivec4` |
|     7 | Bone Weights | `vec4`  |

## Texture Slots
Die Engine verwendet die in der folgenden Tabelle aufgeführten
Texture Slots für intern bereitgestellte Texturen:

| Slot | Inhalt               | Texturtyp | Quelle       |
|------|----------------------|-----------|--------------|
|    0 | Oberflächenfarbe     | 2D        | [[MATERIAL]] |
|    1 | Oberflächenattribute | 2D        | [[MATERIAL]] |
|    2 | Oberflächenemission  | 2D        | [[MATERIAL]] |
|    3 | Oberflächennormale   | 2D        | [[MATERIAL]] |

Alle Texture Slots, welche nicht in der Tabelle aufgeführt sind,
stehen dem Benutzer zur freien Verfügung und können für eigene
Effekte verwendet werden.