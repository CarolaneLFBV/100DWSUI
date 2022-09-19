import UIKit

print("Gear up or down your car")


struct Car {
    let model: String
    let numberSeat: Int
    var currentGear: Int
    
    public mutating func upGear() {
        if currentGear + 1 > 10 {
            print("You can't add more than 10!")
        } else {
            print("Added a gear to your car!")
            currentGear += 1
        }
    }
    
    public mutating func downGear() {
        if currentGear - 1 < 0 {
            print("You are already at 0!")
        } else {
            print("Retrieve a gear to your car!")
            currentGear -= 1
        }
    }
}

var tesla = Car(model: "Tesla", numberSeat: 5, currentGear: 0)
for _ in 1...11 {
    tesla.upGear()
}
tesla.currentGear

/** ------------------------------------------------
                Tesla Model - More than 10
    ------------------------------------------------
var tesla = Car(model: "Tesla", numberSeat: 5, currentGear: 0)
for _ in 1...11 {
    tesla.upGear()
}
tesla.currentGear
    ------------------------------------------------
**/

/** ------------------------------------------------
                Mercedes Model - Less than 0
    ------------------------------------------------
 var mercedes = Car(model: "Mercedes", numberSeat: 5, currentGear: 1)
 for _ in 0...3 {
     mercedes.downGear()
 }
 mercedes.currentGear
    ------------------------------------------------
 */




