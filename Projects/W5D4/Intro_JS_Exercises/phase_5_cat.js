function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  console.log(`${this.owner} loves ${this.name}`);
}

cat1 = new Cat('Moist', 'Moistie');
cat1.cuteStatement();

Cat.prototype.cuteStatement = function() {
  console.log(`Everybody loves ${this.name}!`);
}

cat1.cuteStatement();

Cat.prototype.meow = function() {
  console.log(`${this.name} meows..`);
}

cat1.meow();

cat2 = new Cat('Cow', 'MoistieV2');
cat2.cuteStatement();
cat2.meow();

// You can override functions on an instance
