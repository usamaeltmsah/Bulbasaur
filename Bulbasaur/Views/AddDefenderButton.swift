//
//  AddDefenderButton.swift
//  Bulbasaur
//
//  Created by Usama Fouad on 20/02/2023.
//

import SwiftUI

struct AddDefenderButton: View {
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            Image(systemName: "plus")
                .padding(10)
                .frame(width: 40, height: 40)
                .background(Color(.ice))
                .clipShape(Circle())
            
            Text("Add Defender")
            
            Spacer()
        } //: HStack
        .foregroundColor(Color.white)
        .font(.bold(.title2)())
        .frame(height: 60)
        .background(Color(.water))
        .cornerRadius(10)
        .padding()
    }
}

struct AddDefenderButton_Previews: PreviewProvider {
    static var previews: some View {
        AddDefenderButton()
    }
}
