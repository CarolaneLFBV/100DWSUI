//
//  DiceRow.swift
//  MilestoneNinetyFive
//
//  Created by Carolane Lefebvre on 31/08/2023.
//

import SwiftUI

struct DiceRow: View {
    let dice: Dice
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(dice.name)
                .font(.title)
            
            Text("\(dice.side)-sided dice")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("Result: \(dice.result)")
                .font(.callout)
        }
    }
}

struct DiceRow_Previews: PreviewProvider {
    static var previews: some View {
        DiceRow(dice: Dice.example)
    }
}
