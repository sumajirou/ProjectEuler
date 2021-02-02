import math
import itertools
from math import log10
import sys


def main():
  if len(sys.argv) != 2:
    print('Need 1 argument.')
    return
  limit = int(sys.argv[1])
  min = log10(1.23)
  max = log10(1.24)
  count = 0
  for j in itertools.count(start=0):
    if min <= j * log10(2) % 1 < max:
      count += 1
      if count % 10000 == 0:
        print(count, j)
      if count >= limit:
        print(count, j)
        return


if __name__ == "__main__":
    main()
