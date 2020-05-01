import pandas as pd
import numpy as np

big = np.zeros((30, 30), dtype=int)
big = big - 1
array = big.tolist()

data = pd.read_csv("./data.csv")

arrays = [np.copy(big), np.copy(big), np.copy(big), np.copy(big), np.copy(big)]
possible = [data.head(30), data.head(60), data.head(90), data.head(120), data]

def check(pair, data, index):
    print(index)
    to_set = [0, 0]
    if pair == 4:
        to_set = [1, 2]
    elif pair == 5:
        to_set = [1, 3]
    else:
        to_set = [2, 3]
    if data[pair] == 1:
        arrays[index][data[to_set[0]]][data[to_set[1]]] = 1
        arrays[index][data[to_set[1]]][data[to_set[0]]] = 1
    else:
        arrays[index][data[to_set[0]]][data[to_set[1]]] = 0
        arrays[index][data[to_set[1]]][data[to_set[0]]] = 0

for ar in possible:
    print(ar.shape)

for index, value in enumerate(possible):
    for checker, row in enumerate(value.iterrows()):
        print(checker)
        check(4, row[1], index)
        check(5, row[1], index)
        check(6, row[1], index)

for index, value in enumerate(arrays):
    pd.DataFrame(value).to_csv(f"./adj{index}.csv", header=None, index=None)

