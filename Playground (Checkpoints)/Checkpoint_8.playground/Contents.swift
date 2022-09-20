import UIKit

print("Buildings and Houses\n")

// ------------------------------ Protocole -------------------------------
protocol Building {
    var rooms: Int { get set }
    var price: Int { get set }
    var agentName: String { get }
    
    func saleSummary()
}

// -------------------------------- House --------------------------------
struct House: Building {
    var rooms: Int
    var price: Int
    var agentName: String
    
    func saleSummary() {
        print("This beautiful house has currently \(rooms) rooms and costs $\(price). Don't hesitate to contact our agent \(agentName) if needed.")
    }
}

// ------------------------------- Office --------------------------------
struct Office: Building {
    var rooms: Int
    var price: Int
    var agentName: String
    
    func saleSummary() {
        print("This office has currently \(rooms) rooms and costs around $\(price). Don't hesitate to contact our agent \(agentName) if needed.")
    }
}

// ------------------------------- Tests --------------------------------
let house = House(rooms: 5, price: 150_000, agentName: "Paul Hudson")
house.saleSummary() ; print("\n")

let office = Office(rooms: 10, price: 250_000, agentName: "Mario Luigi")
office.saleSummary() ; print("\n")



