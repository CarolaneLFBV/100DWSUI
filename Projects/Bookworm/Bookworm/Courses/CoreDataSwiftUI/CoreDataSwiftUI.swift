////
////  CoreDataSwiftUI.swift
////  Bookworm
////
////  Created by Carolane LEFEBVRE on 31/07/2023.
////
//
//import SwiftUI
//
//struct CoreDataSwiftUI: View {
//    // Creates a request with no sorting
//    // in a 'students' property that has the type FetchedResults<Student>
//    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
//
//    // MOC handles adding and saving objects
//    @Environment(\.managedObjectContext) var moc
//
//    var body: some View {
//        VStack {
//            Button("Add") {
//                let firstNames = ["Harry", "Ginny", "Hermione", "Luna", "Ron"]
//                let lastNames = ["Potter", "Grander", "Lovegood", "Weasley"]
//
//                let chosenFirstName = firstNames.randomElement()!
//                let chosenLastName = lastNames.randomElement()!
//
//                // Creates new objects with moc so the object knows where it should be stored.
//                let student = Student(context: moc)
//                student.id = UUID()
//                student.name = "\(chosenLastName) \(chosenFirstName)"
//
//                // Save itself. Throwing function call because it might fail.
//                try? moc.save()
//            }
//            List(students) { student in
//                Text(student.name ?? "Unknown")
//            }
//        }
//    }
//}
//
//struct CoreDataSwiftUI_Previews: PreviewProvider {
//    static var previews: some View {
//        CoreDataSwiftUI()
//    }
//}
