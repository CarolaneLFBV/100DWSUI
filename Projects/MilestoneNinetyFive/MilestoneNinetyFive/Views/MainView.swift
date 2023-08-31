//
//  MainView.swift
//  MilestoneNinetyFive
//
//  Created by Carolane Lefebvre on 31/08/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var addingDiceView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dices) { dice in
                    HStack {
                        Image(systemName: "dice")
                        DiceRow(dice: dice)
                    }
                }
                .onDelete { index in
                    viewModel.removeDice(at: index)
                }
            }
            .navigationTitle("Dice History")
            .sheet(isPresented: $addingDiceView) {
                AddDiceView(viewModel: viewModel)
            }
            .toolbar {
                Button("Add") {
                    addingDiceView = true
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
