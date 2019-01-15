var common = [
  '*.sw*',
  '.DS_Store'
];

var node = common.concat([
  'node_modules',
  'npm-debug.log*',
]);

module.exports = {
  default: common,
  node: node
}
