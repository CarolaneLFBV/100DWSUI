import UIKit

print("Optionals \n")

// Function
func arrayInt(inputArray: [Int]?) -> Int { return inputArray?.randomElement() ?? Int.random(in: 1...100) }


// Tests
print(arrayInt(inputArray: [0,10,32,45,55]))
print(arrayInt(inputArray: nil))
