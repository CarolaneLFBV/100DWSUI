//
//  WorkingWithDates.swift
//  BetterRest
//
//  Created by Carolane LEFEBVRE on 20/04/2023.
//

import SwiftUI

struct WorkingWithDates: View {
    /*let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0*/

    var body: some View {
        Text(Date.now, format: .dateTime.day().month().year())
    }
}
struct WorkingWithDates_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithDates()
    }
}
