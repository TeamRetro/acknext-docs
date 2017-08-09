# oscillate
Stellt sicher, dass ein Wert innerhalb eines Minimums und eines Maximums liegt.

## Definition
```ack
var oscillate(var value, var min, var max);
```

## Parameter
- **`value`**
  Der zu begrenzende Wert.
- **`min, max`**
  Ober- und Untergrenze für `value`.

## Rückgabewert
Ist `value` kleiner als `min` wird die Differenz zu `min` wieder aufaddiert. Entsprechend verhällt es sich, wenn `value` größer als `max` ist.

## Beispiel
```ack
…

vec_fill(my->scale, oscillate(total_time, 0.8f, 1.2f));

…
```

## Siehe auch
- 
