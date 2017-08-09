# cycle
Stellt sicher, dass ein Wert innerhalb eines Minimums und eines Maximums liegt und lässt ihn dabei zwischen den Grenzwerten zyklisch wiederholen.

## Definition
```ack
var cycle(var value, var min, var max);
```

## Parameter
- **`value`**
  Der zu begrenzende Wert.
- **`min, max`**
  Ober- und Untergrenze für `value`.

## Rückgabewert
Ist `value` kleiner als `min` wird solange die Differenz zwischen `min` und `max` aufaddiert, bis der Wert wieder zwischen den Grenzwerten liegt. Entsprechend verhällt es sich, wenn `value` größer als `max` ist.

## Beispiel
```ack
…

// rotation wird immer einen Wert zwischen 0 und 360 haben, trotzdem kann
// beliebig lange in eine Richtung rotiert werden.
rotation = cycle(rotation + time_step * 4, 0.0f, 360.0f);

…
```

## Siehe auch
- 
