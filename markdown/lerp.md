# lerp
Berechnet eine lineare Interpolation zwischen zwei Werten.

## Definition
```c
var lerp(var lhs, var rhs, var factor);
```

## Parameter
- **`lhs, rhs`**
  Die Grenzwerte, zwischen denen interpoliert werden soll.
- **`factor`**
  Der Interpolationsfaktor.

## Rückgabewert
Ist `factor` ein Wert zwischen 0 und 1 liegt das Ergebnis entsprechend `factor` dazwischen. Ist `factor` größer 1 oder kleiner 0 ist das Ergebnis eine Extrapolation.

## Beispiel
```c
Sinnvolles Beispiel hier...
```
