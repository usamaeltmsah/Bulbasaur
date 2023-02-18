//
//  TrackHScrollableView.swift
//  Topotify
//
//  Created by Usama Fouad on 17/02/2022.
//

import SwiftUI

struct PokeTypesHScrollableView: View {
    let pokemonTypes: Array<PokeType>
    let title: String?
    @State private var currentSelectedPoke: PokeType?
    @Binding var selectedPokemon: PokeType?
    
    var body: some View {
        if !pokemonTypes.isEmpty {
            VStack(alignment: .leading, spacing: 10) {
                if let title {
                    Text(title)
                        .padding([.top, .horizontal], 10)
                        .font(.system(size: 25).bold())
                        .foregroundColor(Color.secondary)
                }
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())]) {
                        ForEach(Array(pokemonTypes.enumerated()),
                                id: \.element.self) { pokemon in
                            GridView(image: Image(pokemon.element.image), name: pokemon.element.name, color: Color(pokemon.element.color), isSelected: .constant(selectedPokemon != nil && currentSelectedPoke == pokemon.element))
                                .onTapGesture {
                                    currentSelectedPoke = pokemon.element
                                    selectedPokemon = currentSelectedPoke
                                } //: onTapGesture
                        } //: ForEach
                    }
                } //: LazyHGrid
            }  //: ScrollView
        }
    }
}


struct TrackHScrollableView_Previews: PreviewProvider {
    static var previews: some View {
        PokeTypesHScrollableView(pokemonTypes: PokeType.allCases, title: "Attack", selectedPokemon: .constant(PokeType.allCases.first!))
            .previewLayout(.fixed(width: 360, height: 240))
    }
}

