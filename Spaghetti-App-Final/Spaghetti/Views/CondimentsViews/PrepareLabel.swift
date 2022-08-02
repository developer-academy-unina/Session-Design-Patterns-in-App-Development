//
//  PrepareLabel.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 24/01/22.
//

import SwiftUI

struct PrepareLabel: View {
    var body: some View {
        Label("Prepare", systemImage: "fork.knife")
            .font(.system(size: 20, weight: .bold))
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .mask(
                RoundedRectangle(cornerRadius: 16)
            )
    }
}


struct PrepareLabel_Previews: PreviewProvider {
    static var previews: some View {
        PrepareLabel()
    }
}
