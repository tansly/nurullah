# Piano Concerto No. $(RAND)

from nurullah.note import NoteSequence
from nurullah.units import Track, Song
from nurullah.frequency import Frequency
import random

pitches = list(Frequency.keys())
lengths = ["4", "8", "16"]
dots = [".", ""]

rand1 = [
    pitches[i] for i in [
        random.randint(0, len(pitches) - 1) for j in range(1, 2500)
    ]
]

rand2 = [
    pitches[i] for i in [
        random.randint(0, len(pitches) - 1) for j in range(1, 2500)
    ]
]

rand3 = [
    pitches[i] for i in [
        random.randint(0, len(pitches) - 1) for j in range(1, 2500)
    ]
]

notes1 = []
notes2 = []
notes3 = []
for i in range(1, 2499):
    lr = random.randint(0, len(lengths) - 1)
    dr = random.randint(0, len(dots) - 1)
    notes1.append(tuple([rand1[i], lengths[lr] + dots[dr], 0.85]))
    notes2.append(tuple([rand2[i], lengths[lr] + dots[dr], 0.85]))
    notes3.append(tuple([rand3[i], lengths[lr] + dots[dr], 0.85]))

ns = NoteSequence()
track1 = Track(ns.create(notes1))
track2 = Track(ns.create(notes2))
track3 = Track(ns.create(notes3))
rand = Song([track1, track2, track3])

print(rand)
