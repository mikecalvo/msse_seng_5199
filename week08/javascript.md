footer: © Citronella Software Ltd 2015
slidenumbers: true

# Javascript
## Mike Calvo
## mike@citronellasoftware.com

---

# Javascript
- The language of the web
- Written in two weeks by Brendan Eich (Netscape)
- Original name: LiveScript (1995)
- Once only for browsers - now found on servers (NodeJS)

---

# Language Features
- C-style syntax
- Dynamic typing (var instead of def)
- Objects: associative arrays + prototypes
- Functional: functions are objects

---

# Example Syntax: Variables

``` javascript
var x;
var y = 2;

x = 3.4;
x = false;

y = 'dynamic... ohhh.';
y = "Strings can be single or double quoted";

console.log("This is Javascript's version of println");
```

---
# Conditions, Arrays and Loops

``` javascript
var a = [1, 2, 3, 4, 5];

var sum = 0;
for (var i = 0; i < a.length; i++) {
  if (a[i] % 2) {
    sum += a[i];
  }
}
console.log('sum = '+sum);

```

---
# JavaScript Functions Syntax

``` javascript
function print(parameter) {
  console.log('parameter = '+parameter);
}
print('yo');

// Optional function name assists debugging
var log = function log(words) {
  console.log('logging: '+words);
};

var forEach = function(array, fn) {
  for (var i = 0; i < array.length; i++) {
    fn(array[i]);
  }
};

forEach(['one', 'two', 'three'], log);

```

---
# Objects
- Name-value pairs
- Values can be functions
- Values can be other objects

---

# Object Examples

``` javascript
var emptyObject = {};
var person = { name: 'Mike', email: 'mjcalvo@gmail.com'};
console.log('Name: '+person.name);
console.log('Email: '+person.email);

person.address = { street: '123 Main', city: 'Lexington' };

console.log('City: '+person.address.city);

person['address']['city'] = 'London';

person.zip // !!! undefined !!!
```

---

# What are Prototypes?
- A base set of properties that are cloned/copied to form a new type
- It is not inheritence in the same way Groovy/Java/C# classes inherit from each other
- Every object has a prototype
- Prototypes can be modified at run time
- Use `new` or Object.create to extend another object

---
# Example Javascript Inheritance

``` javascript
var person = { name: 'Mike', age: 43 };
person.speak = function(words) { console.log('speaking: '+words); };

var employee = Object.create(person)
employee.work = function() { this.speak("I'm working..."); };

employee.work();
```

---
# Javascript Reflection

``` javascript
typeof 3           // 'number'
typeof 'status'    // 'string'
typeof {}          // 'object'
typeof {}.name     // 'undefined'
typeof {}.toString // 'function'

var obj = {name: 'name', count: 3};
obj.hasOwnProperty('name') // true
obj.hasOwnProperty('color') // false
```

---
# Looping Over Properties

``` javascript
var object = [name: 'a', date: new Date(), scores: [1, 2, 3]];
for (var p in object) {
  if (object.hasOwnProperty('p')) {
    console.log(p+': '+object[p]);
  }
}
```

---

# Deleting Properties

``` javascript
var object = [name: 'Mike', type: 'employee'];
delete object.type

// Now object == [name: 'Mike']
```

---
# Global Scope
- By default, Javascript puts variables in global scope
- Need tricks to avoid this:
- Trick 1: put all your variables within a single global variable
- Trick 2: declare variables within functions
---

# Excellent JavaScript Books
- 'JavaScript: The Good Parts' by Crockford
- 'Eloquent JavaScript' by Haverbeke
- 'Functional JavaScript' by Fogus
- 'JavaScript Design Patterns' by Osmani
- Others?
