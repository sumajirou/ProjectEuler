const fs = require('fs');

class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
  dot(p) {
    return this.x * p.x + this.y * p.y;
  }
  get radius() {
    return Math.sqrt(this.x ** 2 + this.y ** 2);
  }
  get angle() {
    return Math.atan2(this.x, this.y);
  }
  toString() {
    return `${this.constructor.name}(${this.x},${this.y})`;
  }
}

// csvをテキストファイルとして読み込む
let data = fs.readFileSync('p102_triangles.csv', 'utf-8');
// テキストデータをPointの二次元配列に変換する
data = data
  .split('\n')
  .slice(0, 1000)
  .map(line => {
    const ns = line.split(',').map(n => Number(n));
    const a = new Point(ns[0], ns[1]);
    const b = new Point(ns[2], ns[3]);
    const c = new Point(ns[4], ns[5]);
    return [a, b, c];
  });
// 3点の座標を3つの偏角に変換する。
data = data.map(points => {
  const [a, b, c] = points;
  return [a.angle, b.angle, c.angle].sort((a, b) => a - b);
});
// 3つの偏角を3つの狭角に変換
data = data.map(rads => [rads[1] - rads[0], rads[2] - rads[1], Math.PI * 2 - (rads[2] - rads[0])]);
// 3つの狭角すべてが180度未満なら原点を含む
const containOrigin = data.filter(rads => rads.every(rad => rad < Math.PI));
console.log(data.length);
console.log(containOrigin.length);
