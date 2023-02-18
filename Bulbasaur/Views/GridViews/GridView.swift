//
//  GridView.swift
//  Bulbasaur
//
//  Created by Usama Fouad on 17/2/2022.
//

import SwiftUI

struct GridView: View {
    let image: Image
    let name: PokeName
    let color: Color
    @Binding var isSelected: Bool
    @State private var isRotating = false
    @State private var rotatingVal = 0.0
    @State private var prevRotatingVal = 0.0
        
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Circle()
                    .strokeBorder(.gray, lineWidth: 4)
                    .frame(width: 80)
                    .opacity(isSelected ? 1 : 0)
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .shadow(color: .white, radius: 2, x: 0, y: 3)
                    .padding(10)
                    .background(color)
                    .cornerRadius(30)
                    .shadow(color: .primary, radius: 2, x: 0, y: 0)
            }
            
            Text(name.rawValue.capitalized)
                .font(.headline)
                .foregroundColor(color)
        }
        .frame(width: 80, height: 120)
    }
}

struct AlarmSpotifyGridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(image: Image(.bug), name: .bug, color: Color(.bug), isSelected: .constant(true))
            .previewLayout(.fixed(width: 80, height: 120))
    }
}
