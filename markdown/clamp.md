# clamp
Stellt sicher, dass ein Wert innerhalb eines Minimums und eines Maximums liegt.

## Definition
```c
var clamp(var value, var min, var max);
```

## Parameter
- **`value`**
  Der zu begrenzende Wert.
- **`min, max`**
  Ober- und Untergrenze für `value`.

## Rückgabewert
Ist `value` kleiner als `min` wird `min` zurückgegeben; ist `value` größer als `max` wird `max` zurückgegegen. Trifft beides nicht zu wird `value` zurückgegeben.

## Beispiel
```c
…

volume += key_plus * time_step;
volume -= key_minus * time_step;

volume = clamp(volume, 0, 100);

…
```
