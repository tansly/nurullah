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
for pitch in rand1:
    lr = random.randint(0, len(lengths) - 1)
    dr = random.randint(0, len(dots) - 1)
    notes1.append(tuple([pitch, lengths[lr] + dots[dr], 0.85]))

notes2 = []
for pitch in rand1:
    lr = random.randint(0, len(lengths) - 1)
    dr = random.randint(0, len(dots) - 1)
    notes2.append(tuple([pitch, lengths[lr] + dots[dr], 0.85]))

notes3 = []
for pitch in rand1:
    lr = random.randint(0, len(lengths) - 1)
    dr = random.randint(0, len(dots) - 1)
    notes3.append(tuple([pitch, lengths[lr] + dots[dr], 0.85]))

ns = NoteSequence()
track1 = Track(ns.create(notes1))
track2 = Track(ns.create(notes2))
track3 = Track(ns.create(notes3))
rand = Song([track1, track2, track3])

print(rand)
