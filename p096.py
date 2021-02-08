init = [
  [0,0,3,0,2,0,6,0,0],
  [9,0,0,3,0,5,0,0,1],
  [0,0,1,8,0,6,4,0,0],
  [0,0,8,1,0,2,9,0,0],
  [7,0,0,0,0,0,0,0,8],
  [0,0,6,7,0,8,2,0,0],
  [0,0,2,6,0,9,5,0,0],
  [8,0,0,2,0,3,0,0,9],
  [0,0,5,0,1,0,3,0,0]
]

def print_board(board):
  print("\n".join([" ".join([str(x) for x in line]) for line in board]))

def make_candidate(board):
  t_board = list(map(list, zip(*board)))
  for j in range(9):
    for i in range(9):
      print(i,j)
  return board
