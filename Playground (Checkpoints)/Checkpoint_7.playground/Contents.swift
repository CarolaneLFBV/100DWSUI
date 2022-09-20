import UIKit

print("Dogs and Cats\n")

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = max(legs, 0) }
}

// --------------- Dog Class ---------------
class Dog: Animal {
    
    init() { super.init(legs: 4) }
    func speak() { print("The dog goes: Woof woof! 🐶") }
}

// --------------- Corgi & Poddle Class ---------------
class Corgi: Dog { override func speak() { print("That dog is special, it's a corgi! Yap Yap!") } }
class Poddle: Dog { override func speak() { print("That dog is another one special, it's a poddle! Warf Warf!") } }


// --------------- Cat Class ---------------
class Cat: Animal {
    let isTame: Bool
    init(isTame isTamefromCat: Bool) {
        isTame = isTamefromCat
        super.init(legs: 4)
    }
    func speak() { print("The cat goes: meow? 🐱") }
}


// --------------- Persian & Lion Class ---------------
class Persian: Cat {
    init() { super.init(isTame: true) }
    override func speak() { print("That cat is special, it's a persian! Maow Maow!") }
}

class Lion: Cat {
    init() { super.init(isTame: false) }
    override func speak() { print("That cat is another one special, it's a Lion! Be careful! Rawr Rawr!") }
}

// --------------- Let's try it! ---------------
let corgi = Corgi()
let poddle = Poddle()
let persian = Persian()
let lion = Lion()

print("Tim is a dog with \(corgi.legs) legs.")
corgi.speak(); print("\n")

print("Medor is another dog with \(poddle.legs) legs.")
poddle.speak(); print("\n")

print("Prince is a cat with \(persian.legs) legs. Prince is a" + (persian.isTame ? "tame " : "wild ") + "cat!")
persian.speak(); print("\n")

print("Prince is a cat with \(lion.legs) legs. Prince is a" + (lion.isTame ? "tame " : "wild ") + "cat!")
lion.speak(); print("\n")
