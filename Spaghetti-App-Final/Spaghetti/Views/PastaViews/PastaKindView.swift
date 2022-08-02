//
//  PastaKindView.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 13/01/22.
//

import SwiftUI

struct PastaKindView: View {
    
    var pastaKindImage: Image
    var pastaKindName: String
    var pastaKindDescription: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing) {
                pastaKindImage
                    .resizable()
                    .frame(minWidth: 17.3, maxWidth: 173, minHeight: 15.5, maxHeight: 155)
                    .cornerRadius(5)
            }
            Text(pastaKindName)
                .bold()
                .font(.system(size: 16))
                .foregroundColor(.primary)
            Text(pastaKindDescription)
                .font(.system(size: 13))
                .foregroundColor(.secondary)
        }
    }
}


struct PastaKindView_Previews: PreviewProvider {
    static var previews: some View {
        PastaKindView(pastaKindImage: Image("spaghetti"), pastaKindName: "Spaghetti", pastaKindDescription: "Spaghet-it, won't regret it")
    }
}
