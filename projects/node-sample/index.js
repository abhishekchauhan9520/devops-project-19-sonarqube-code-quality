function greeting(name) {
  const clean = typeof name === 'string' ? name.trim() : '';
  return clean ? `Hello, ${clean}!` : 'Hello from Node sample';
}

if (require.main === module) {
  console.log(greeting(process.argv[2]));
}

module.exports = { greeting };
