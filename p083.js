const fs = require('fs');
const N = 80;
// csvをテキストファイルとして読み込む
let data = fs.readFileSync('./p082_matrix.csv', 'utf-8');
path = data
  .split('\n')
  .slice(0, N)
  .map(line => line.split(',').map(n => Number(n)));
// const maxPath = [[], [], [], [], []];
const maxPath = Array(N)
  .fill(0)
  .map(() => []);

// まずProblem81と同じ解法でmaxPathを作る
// const N = 5;
// const path = [
//   [131, 673, 234, 103, 18],
//   [201, 96, 342, 965, 150],
//   [630, 803, 746, 422, 111],
//   [537, 699, 497, 121, 956],
//   [805, 732, 524, 37, 331],
// ];
// const maxPath = Array(N)
//   .fill(0)
//   .map(() => []);

for (let i = N - 1; i >= 0; i--) {
  for (let j = N - 1; j >= 0; j--) {
    if (j === N - 1 && i === N - 1) {
      maxPath[j][i] = path[j][i];
      continue;
    }
    if (i === N - 1) {
      maxPath[j][i] = path[j][i] + maxPath[j + 1][i];
      continue;
    }
    if (j === N - 1) {
      maxPath[j][i] = path[j][i] + maxPath[j][i + 1];
      continue;
    }
    maxPath[j][i] = path[j][i] + Math.min(maxPath[j][i + 1], maxPath[j + 1][i]);
  }
}
console.log(path);
console.log(maxPath);

let changed = true;
while (changed) {
  console.log(maxPath);
  changed = false;
  for (let i = N - 1; i >= 0; i--) {
    for (let j = N - 1; j >= 0; j--) {
      // 直上と比較
      if (j !== 0) {
        const up = maxPath[j - 1][i] + path[j][i];
        if (up < maxPath[j][i]) {
          maxPath[j][i] = up;
          changed = true;
        }
      }
      // 直下と比較
      if (j !== N - 1) {
        const down = maxPath[j + 1][i] + path[j][i];
        if (down < maxPath[j][i]) {
          maxPath[j][i] = down;
          changed = true;
        }
      }
      // 直左と比較
      if (i !== 0) {
        const left = maxPath[j][i - 1] + path[j][i];
        if (left < maxPath[j][i]) {
          maxPath[j][i] = left;
          changed = true;
        }
      }
      // 直右と比較
      if (i !== N - 1) {
        const right = maxPath[j][i + 1] + path[j][i];
        if (right < maxPath[j][i]) {
          maxPath[j][i] = right;
          changed = true;
        }
      }
    }
  }
}
console.log(maxPath[0][0]);
//passed. 425185
