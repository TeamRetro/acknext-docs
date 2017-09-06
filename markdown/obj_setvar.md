# obj_setvar
Setzt eine dynamische Variable in einem Engine-Objekt.

## Definition
```ack
void obj_setvar(void * obj, char const * name, GLenum type, ...)
```

## Parameter
- **`obj`**
  Das Objekt, das die Variable enthalten soll.
- **`name`**
  Der Name der Variable, *case sensitive*.
- **`type`**
	Ein OpenGL-Typ, welcher auch für Uniforms erlaubt ist.
- **`...`**
	Von `type` abhängige Werte, welche den Wert der Variable angeben.
	
## Beispiel
```ack
…
ENTITY * ent;
…
// Speichere das Geburtsdatum in einem Drei-Tupel ab
obj_setvar(ent, "geburtsdatum", GL_INT_VEC3, 13, 9, 1993);
…
```

## Unterstützte Datentypen
`obj_setvar` unterstützt eine Vielzahl an verschiedenen Datentypen, welche von den OpenGL-Datentypen
für Shadervariablen abgeleitet wurden. In der folgenden Tabelle sind alle möglichen OpenGL-Datentypen
aufgelistet und es wird für jeden Typ angegeben, welche Parameter in `...` erwartet werden.

| Typ                                            | GLSL-Typ               | Unterstützt | Parameterliste |
|------------------------------------------------|------------------------|-------------|----------------|
| `GL_FLOAT`                                     | `float`                | ✓           | `float` |
| `GL_FLOAT_VEC2`                                | `vec2`                 | ✓           | `float,float` |
| `GL_FLOAT_VEC3`                                | `vec3`                 | ✓           | `float,float,float` |
| `GL_FLOAT_VEC4`                                | `vec4`                 | ✓           | `float,float,float,float` |
| `GL_DOUBLE`                                    | `double`               | ✓           | `double` |
| `GL_DOUBLE_VEC2`                               | `dvec2`                | ✓           | `double,double` |
| `GL_DOUBLE_VEC3`                               | `dvec3`                | ✓           | `double,double,double` |
| `GL_DOUBLE_VEC4`                               | `dvec4`                | ✓           | `double,double,double,double` |
| `GL_INT`                                       | `int`                  | ✓           | `int` |
| `GL_INT_VEC2`                                  | `ivec2`                | ✓           | `int,int` |
| `GL_INT_VEC3`                                  | `ivec3`                | ✓           | `int,int,int` |
| `GL_INT_VEC4`                                  | `ivec4`                | ✓           | `int,int,int,int` |
| `GL_UNSIGNED_INT`                              | `unsigned`             | ✓           | `uint` |
| `GL_UNSIGNED_INT_VEC2`                         | `uvec2`                | ✓           | `uint,uint` |
| `GL_UNSIGNED_INT_VEC3`                         | `uvec3`                | ✓           | `uint,uint,uint` |
| `GL_UNSIGNED_INT_VEC4`                         | `uvec4`                | ✓           | `uint,uint,uint,uint` |
| `GL_BOOL`                                      | `bool`                 | ✓           | `bool` |
| `GL_BOOL_VEC2`                                 | `bvec2`                | ✓           | `bool,bool` |
| `GL_BOOL_VEC3`                                 | `bvec3`                | ✓           | `bool,bool,bool` |
| `GL_BOOL_VEC4`                                 | `bvec4`                | ✓           | `bool,bool,bool,bool` |
| `GL_FLOAT_MAT2`                                | `mat2`                 | ✗           | - |
| `GL_FLOAT_MAT3`                                | `mat3`                 | ✗           | - |
| `GL_FLOAT_MAT4`                                | `mat4`                 | ✗           | `MATRIX` |
| `GL_FLOAT_MAT2x3`                              | `mat2x3`               | ✗           | - |
| `GL_FLOAT_MAT2x4`                              | `mat2x4`               | ✗           | - |
| `GL_FLOAT_MAT3x2`                              | `mat3x2`               | ✗           | - |
| `GL_FLOAT_MAT3x4`                              | `mat3x4`               | ✗           | - |
| `GL_FLOAT_MAT4x2`                              | `mat4x2`               | ✗           | - |
| `GL_FLOAT_MAT4x3`                              | `mat4x3`               | ✗           | - |
| `GL_DOUBLE_MAT2`                               | `dmat2`                | ✗           | - |
| `GL_DOUBLE_MAT3`                               | `dmat3`                | ✗           | - |
| `GL_DOUBLE_MAT4`                               | `dmat4`                | ✗           | - |
| `GL_DOUBLE_MAT2x3`                             | `dmat2x3`              | ✗           | - |
| `GL_DOUBLE_MAT2x4`                             | `dmat2x4`              | ✗           | - |
| `GL_DOUBLE_MAT3x2`                             | `dmat3x2`              | ✗           | - |
| `GL_DOUBLE_MAT3x4`                             | `dmat3x4`              | ✗           | - |
| `GL_DOUBLE_MAT4x2`                             | `dmat4x2`              | ✗           | - |
| `GL_DOUBLE_MAT4x3`                             | `dmat4x3`              | ✗           | - |
| `GL_SAMPLER_1D`                                | `sampler1D`            | ✓           | `BITMAP*` |
| `GL_SAMPLER_2D`                                | `sampler2D`            | ✓           | `BITMAP*` |
| `GL_SAMPLER_3D`                                | `sampler3D`            | ✓           | `BITMAP*` |
| `GL_SAMPLER_CUBE`                              | `samplerCube`          | ✓           | `BITMAP*` |
| `GL_SAMPLER_1D_SHADOW`                         | `sampler1DShadow`      | ✓           | `BITMAP*` |
| `GL_SAMPLER_2D_SHADOW`                         | `sampler2DShadow`      | ✓           | `BITMAP*` |
| `GL_SAMPLER_1D_ARRAY`                          | `sampler1DArray`       | ✓           | `BITMAP*` |
| `GL_SAMPLER_2D_ARRAY`                          | `sampler2DArray`       | ✓           | `BITMAP*` |
| `GL_SAMPLER_1D_ARRAY_SHADOW`                   | `sampler1DArrayShadow` | ✓           | `BITMAP*` |
| `GL_SAMPLER_2D_ARRAY_SHADOW`                   | `sampler2DArrayShadow` | ✓           | `BITMAP*` |
| `GL_SAMPLER_2D_MULTISAMPLE`                    | `sampler2DMS`          | ✓           | `BITMAP*` |
| `GL_SAMPLER_2D_MULTISAMPLE_ARRAY`              | `sampler2DMSArray`     | ✓           | `BITMAP*` |
| `GL_SAMPLER_CUBE_SHADOW`                       | `samplerCubeShadow`    | ✓           | `BITMAP*` |
| `GL_SAMPLER_BUFFER`                            | `samplerBuffer`        | ✓           | `BITMAP*` |
| `GL_SAMPLER_2D_RECT`                           | `sampler2DRect`        | ✓           | `BITMAP*` |
| `GL_SAMPLER_2D_RECT_SHADOW`                    | `sampler2DRectShadow`  | ✓           | `BITMAP*` |
| `GL_INT_SAMPLER_1D`                            | `isampler1D`           | ✓           | `BITMAP*` |
| `GL_INT_SAMPLER_2D`                            | `isampler2D`           | ✓           | `BITMAP*` |
| `GL_INT_SAMPLER_3D`                            | `isampler3D`           | ✓           | `BITMAP*` |
| `GL_INT_SAMPLER_CUBE`                          | `isamplerCube`         | ✓           | `BITMAP*` |
| `GL_INT_SAMPLER_1D_ARRAY`                      | `isampler1DArray`      | ✓           | `BITMAP*` |
| `GL_INT_SAMPLER_2D_ARRAY`                      | `isampler2DArray`      | ✓           | `BITMAP*` |
| `GL_INT_SAMPLER_2D_MULTISAMPLE`                | `isampler2DMS`         | ✓           | `BITMAP*` |
| `GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY`          | `isampler2DMSArray`    | ✓           | `BITMAP*` |
| `GL_INT_SAMPLER_BUFFER`                        | `isamplerBuffer`       | ✗           | - |
| `GL_INT_SAMPLER_2D_RECT`                       | `isampler2DRect`       | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_1D`                   | `usampler1D`           | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_2D`                   | `usampler2D`           | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_3D`                   | `usampler3D`           | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_CUBE`                 | `usamplerCube`         | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_1D_ARRAY`             | `usampler2DArray`      | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_2D_ARRAY`             | `usampler2DArray`      | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE`       | `usampler2DMS`         | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY` | `usampler2DMSArray`    | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_BUFFER`               | `usamplerBuffer`       | ✓           | `BITMAP*` |
| `GL_UNSIGNED_INT_SAMPLER_2D_RECT`              | `usampler2DRect`       | ✓           | `BITMAP*` |
| `GL_IMAGE_1D`                                  | `image1D`              | ✗           | - |
| `GL_IMAGE_2D`                                  | `image2D`              | ✗           | - |
| `GL_IMAGE_3D`                                  | `image3D`              | ✗           | - |
| `GL_IMAGE_2D_RECT`                             | `image2DRect`          | ✗           | - |
| `GL_IMAGE_CUBE`                                | `imageCube`            | ✗           | - |
| `GL_IMAGE_BUFFER`                              | `imageBuffer`          | ✗           | - |
| `GL_IMAGE_1D_ARRAY`                            | `image1DArray`         | ✗           | - |
| `GL_IMAGE_2D_ARRAY`                            | `image2DArray`         | ✗           | - |
| `GL_IMAGE_2D_MULTISAMPLE`                      | `image2DMS`            | ✗           | - |
| `GL_IMAGE_2D_MULTISAMPLE_ARRAY`                | `image2DMSArray`       | ✗           | - |
| `GL_INT_IMAGE_1D`                              | `iimage1D`             | ✗           | - |
| `GL_INT_IMAGE_2D`                              | `iimage2D`             | ✗           | - |
| `GL_INT_IMAGE_3D`                              | `iimage3D`             | ✗           | - |
| `GL_INT_IMAGE_2D_RECT`                         | `iimage2DRect`         | ✗           | - |
| `GL_INT_IMAGE_CUBE`                            | `iimageCube`           | ✗           | - |
| `GL_INT_IMAGE_BUFFER`                          | `iimageBuffer`         | ✗           | - |
| `GL_INT_IMAGE_1D_ARRAY`                        | `iimage1DArray`        | ✗           | - |
| `GL_INT_IMAGE_2D_ARRAY`                        | `iimage2DArray`        | ✗           | - |
| `GL_INT_IMAGE_2D_MULTISAMPLE`                  | `iimage2DMS`           | ✗           | - |
| `GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY`            | `iimage2DMSArray`      | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_1D`                     | `uimage1D`             | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_2D`                     | `uimage2D`             | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_3D`                     | `uimage3D`             | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_2D_RECT`                | `uimage2DRect`         | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_CUBE`                   | `uimageCube`           | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_BUFFER`                 | `uimageBuffer`         | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_1D_ARRAY`               | `uimage1DArray`        | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_2D_ARRAY`               | `uimage2DArray`        | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE`         | `uimage2DMS`           | ✗           | - |
| `GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY`   | `uimage2DMSArray`      | ✗           | - |
| `GL_UNSIGNED_INT_ATOMIC_COUNTER`               | `atomic_uint`          | ✗           | - |

## Aliase
Diese Funktion steht auch unter den folgenden Namen als Alias zur Verfügung:
- `mtl_setvar`
- `ent_setvar`
- `mesh_setvar`
- `bmap_setvar`
- `shader_setvar`

## Siehe auch
- [[Objektvariablen]]
- [glGetActiveUniform](https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/glGetActiveUniform.xhtml)
