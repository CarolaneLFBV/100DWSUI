import UIKit

print("FizzBuzz\n")

for i in 1...100 {
    if i.isMultiple(of: 3) {
        print("Fizz\n")
    }
    else if i.isMultiple(of: 5) {
        print("Buzz\n")
    }
    else if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz!\n")
    }
    else {
        print("\(i)\n")
    }
}
