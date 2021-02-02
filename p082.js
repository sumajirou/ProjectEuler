const fs = require('fs');

// const N = 5;
// const path = [
//   [131, 673, 234, 103, 18],
//   [201, 96, 342, 965, 150],
//   [630, 803, 746, 422, 111],
//   [537, 699, 497, 121, 956],
//   [805, 732, 524, 37, 331],
// ];

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

for (let i = 0; i < N; i++) {
  maxPath[i][N - 1] = path[i][N - 1];
}
console.log(path);
console.log(maxPath);
// 列は右から左に処理していく
for (let i = N - 2; i >= 0; i--) {
  // 右ルートを暫定の最小値とする
  for (let j = 0; j < N; j++) {
    maxPath[j][i] = path[j][i] + maxPath[j][i + 1];
  }

  // 行は上から下に処理していく
  let changed = true;
  while (changed) {
    console.log(maxPath);

    changed = false;
    for (let j = 0; j < N; j++) {
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
    }
  }
}
const start = maxPath.map(line => line[0]);
console.log(start);
console.log(Math.min(...start));
