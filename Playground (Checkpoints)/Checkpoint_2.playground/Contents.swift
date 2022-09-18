import UIKit

print("How many items are there on a list and a set?\n")
var list = ["Robert", "Jeanne", "Robert", "Christophe", "Jack", "John", "John"]

print("Items on the list: \(list.count)")

var set = Set(list)
print("Unique items on the list: \(set.count)")
