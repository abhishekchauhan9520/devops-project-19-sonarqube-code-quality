const assert = require('node:assert/strict');
const { greeting } = require('./index');

assert.equal(greeting(), 'Hello from Node sample');
assert.equal(greeting('  Abhishek  '), 'Hello, Abhishek!');
console.log('Node tests passed.');
