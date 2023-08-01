//
//  SelfForForEach.swift
//  CoreDataTutorial
//
//  Created by Carolane LEFEBVRE on 01/08/2023.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct SelfForForEach: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct SelfForForEach_Previews: PreviewProvider {
    static var previews: some View {
        SelfForForEach()
    }
}
