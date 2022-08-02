//
//  CondimentsView.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 17/01/22.
//

import SwiftUI

struct CondimentsView: View {
    
    var selectedPastaKind: PastaKind
    @StateObject private var viewModel = CondimentsViewModel()
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                List {
                    Section(header: Text("Select your condiments".uppercased())) {
                        ForEach(viewModel.condiments) { condiment in
                            CondimentRow(emoji: condiment.emoji, name: condiment.name, description: condiment.description, isSelected: viewModel.isCondimentSelected(id: condiment.id))
                                .onTapGesture {
                                    viewModel.toggleCondimentSelection(id: condiment.id)
                                }
                        }
                    }
                }
                
                if viewModel.getSelectedCondimentsNumber() != 0 {
                    NavigationLink(destination: ServedPastaView(selectedPastaKind: selectedPastaKind, selectedCondiments: viewModel.getSelectedCondiments())) {
                        PrepareLabel()
                    }
                    .padding([.leading, .trailing])
                }
            }
            
            Text("\(viewModel.getSelectedCondimentsNumber()) selections")
        }
        .toolbar {
            ToolbarItem {
                if viewModel.areOtherCondimentsLeft() {
                    Button(action: viewModel.addNewCondiment) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationTitle("Condiments")
    }
}


struct CondimentsView_Previews: PreviewProvider {
    static var previews: some View {
        CondimentsView(selectedPastaKind: PastaKind(name: "Spaghetti", description: "Long sticks!", imageName: "spaghetti"))
    }
}
