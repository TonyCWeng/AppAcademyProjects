//
// function sum () {
//   let total = 0;
//   const args = Array.prototype.slice.call(arguments);
//   args.forEach( function (el) {
//     total += el;
//   } );
//   return total;
// }
//
// // console.log(sum(1,2,3));
//
//
//
// Function.prototype.myBind = function () {
//   const bindArgs = Array.prototype.slice.call(arguments);
//   const context = bindArgs[0];
//   const funct = this;
//
//   return function () {
//     const callArgs = Array.prototype.slice.call(arguments);
//     const allArgs = bindArgs.concat(callArgs);
//     funct.apply(context, allArgs.slice(1));
//   };
// };
//
// Function.prototype.myBind = function (firstArg, ...args) {
//   const context = firstArg;
//   const funct = this;
//
//   return (...callArgs) => {
//     const allArgs = args.concat(callArgs);
//     funct.apply(context, allArgs);
//   };
// };
//
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
// // Breakfast says meow to me!
// // true

function curriedSum(numArgs) {
  var numbers = [];

  function _curriedSum (n) {
    numbers.push(n);
    if (numbers.length === numArgs) {
      return numbers.reduce( (x, y) => {
        return x + y;
      });
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// const sum = curriedSum(3);
// console.log(sum(8)(6)(9));

Function.prototype.curry = function (numArgs) {
  var numbers = [];
  var funct = this;

  function _curry (n) {
    numbers.push(n);
    if (numbers.length === numArgs) {
      console.log(numbers);
      console.log(funct);
      return funct;
    } else {
      return _curry;
    }
  }

  return _curry;
};

function sumThree() {
  console.log(arguments);
  let args = Array.prototype.slice.call(arguments);

  return args.reduce( (x,y) => {
    return x+y;
  });

}

sumThree.curry(3)(4)(20)(6);

// or more briefly:
console.log(sumThree(4, 20, 6));


Function.prototype.curry = function (numArgs) {
  
};
