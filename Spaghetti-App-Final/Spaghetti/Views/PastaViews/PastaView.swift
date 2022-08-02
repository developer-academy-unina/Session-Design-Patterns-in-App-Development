//
//  PastaView.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 13/01/22.
//

import SwiftUI

struct PastaView: View {
    
    @StateObject private var viewModel = PastaViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                PastaGridView(pastaKinds: viewModel.pastaKinds)
            }
            .toolbar {
                ToolbarItem {
                    if viewModel.areOtherPastaKindsLeft() {
                        Button(action: viewModel.addNewPastaKind) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .navigationTitle("Pasta")
        }
    }
}


struct PastaView_Previews: PreviewProvider {
    static var previews: some View {
        PastaView()
    }
}
