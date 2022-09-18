import Cocoa

enum SquareRoot: Error {
    case outofBound, noSquareRoot
}

func getSquareRoot(Of number: Int) throws {
    
    var result = 1
    
    if number < 1 || number > 10_000
    {
       throw SquareRoot.outofBound
    }
    
    for root in 1...100
    {
        result = root * root
        if result == number {
            print("The squareroot of \(number) is \(root)!")
            break
        }
    }
    
    if result != number {
        throw SquareRoot.noSquareRoot
    }
}

do {
    try getSquareRoot(Of: 36)
} catch SquareRoot.outofBound {
    print("Please use a number between 1 and 10_000")
} catch SquareRoot.noSquareRoot {
    print("There is no even squareroot to this problem")
}
