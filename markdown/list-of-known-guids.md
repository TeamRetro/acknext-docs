# Liste bekannter GUIDs



## Acknext Model Format
`c4a67fe0-8274-4390-8ed6-50610b0a54f8`

## Acknext Texture Format
`b40f6426-2d6c-44b3-bd3d-629faa5aefe7`

## Acknext Material Format
`324c6780-82b0-473d-a0a9-e0a34f6beea2`

## Acknext Shader Format
`d247fbc8-7a2a-4521-a2c6-5ab5522c2843`

## Extension: Terrain Format
`5507c27d-37B7-4623-b363-ed273e7ba962`

## Acknext Sound Format
`fa76951d-49a5-4c56-94be-0fd6d8988d97`

## Acknext Music Format
`8e5c8b20-db3f-4132-87ec-bfd73841e8cb`

## Acknext Mesh Format
`ceb9e222-c803-43ac-81a9-149a32c5f39b`

## Acknexed Symbolic Link Format
`6fb9e9d6-8786-49f0-9d6d-3916a7ba9c41`

## RESERVED
`0723d144-f3df-44ff-a24e-ce9d1047ade9`

## RESERVED
`42e472e5-2ec8-4457-b1d2-34176fbb9d5d`


## "convert-to-c" code
```
perl -pe 's/(..)(..)(..)(..)-(..)(..)-(..)(..)-(..)(..)-(..)(..)(..)(..)(..)(..)/0x$1, 0x$2, 0x$3, 0x$4,\n0x$5, 0x$6, 0x$7, 0x$8,\n0x$9, 0x$10, 0x$11, 0x$12,\n0x$13, 0x$14, 0x$15, 0x$16/'
```