// mysteryScoping3 throws an error because x can't be changed from a const to a var
// mysteryScoping5 throws an error because x can't be redefined

const madLib = (verb, adj, noun) => { console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`)};
// madLib('make', 'best', 'guac');

const isSubstring = function(searchString, subString) {
    return searchString.includes(subString)
}
// console.log(isSubstring("time to program", "time"))
// console.log(isSubstring("Jump for joy", "joys"))

const fizzBuzz = function(array) {
    let result = []
    array.forEach(function(ele) {
        if ((ele % 3 === 0 || ele % 5 === 0) && ele % 15 != 0)
            result.push(ele)
    })
    return result;
}
// console.log(fizzBuzz([6, 50, 150, 77]))

const isPrime = function(number) {
    for (let i = 2; i <= number/2; i++) {
        if (number % i === 0)
            return false
    }
    return true
}
// console.log(isPrime(2))
// console.log(isPrime(10))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))

const sumOfNPrimes = function(n) {
    let sum = 0;
    let start = 2
    while (n > 0) {
        if (isPrime(start)) {
            sum += start
            n --
        }
        start ++
    }
    return sum
}
// console.log(sumOfNPrimes(0))
// console.log(sumOfNPrimes(1))
// console.log(sumOfNPrimes(4))