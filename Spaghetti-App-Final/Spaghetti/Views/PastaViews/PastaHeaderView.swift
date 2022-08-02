//
//  PastaHeaderView.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 24/01/22.
//

import SwiftUI

struct PastaHeaderView: View {
    var body: some View {
        Text("Select your favourite pasta".uppercased())
            .font(.system(size: 13))
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white.opacity(0.9))
            .foregroundColor(.secondary)
    }
}


struct PastaHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PastaHeaderView()
    }
}
