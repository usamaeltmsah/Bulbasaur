//
//  ContentView.swift
//  Bulbasaur
//
//  Created by Usama Fouad on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectedAttackPoke: PokeType?
    @State var selectedDefender1: PokeType?
    @State var selectedDefender2: PokeType?
    @State var totalRate: Double = 0.0
    @State var refresh: Bool = false
    
    var body: some View {
        VStack(alignment: .trailing) {
            Button {
                self.resetGame()
            } label: {
                HStack {
                    Text("Reset")
                    Image(systemName: "goforward")
                }
                .padding(.trailing)
                .foregroundColor(.primary)
            }
            
            ScrollView {
                VStack {
                    PokeTypesHScrollableView(pokemonTypes: PokeType.allCases, title: "Attack", selectedPokemon: $selectedAttackPoke)
                    
                    PokeTypesHScrollableView(pokemonTypes: PokeType.allCases, title: "Defender", selectedPokemon: $selectedDefender1)
                    if selectedDefender1 != nil {
                        PokeTypesHScrollableView(pokemonTypes: PokeType.allCases, title: nil, selectedPokemon: $selectedDefender2)
                    }
                    Spacer(minLength: 20)
                    
                    Divider()
                    if (selectedAttackPoke != nil && selectedDefender1 != nil) {
                        VStack {
                            Spacer(minLength: 30)
                            if let selectedAttackPoke, let selectedDefender1, let rate = GameLogic().getRate(attacker: selectedAttackPoke, defender1: selectedDefender1, defender2: selectedDefender2) {
                                Text("\(rate)")
                            }
                            Text("Result")
                                .underline()
                                .padding(10)
                                .font(.title)
                            
                            Text("x2 Super Effective")
                                .font(.title3)
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    func resetGame() {
        selectedAttackPoke = nil
        selectedDefender1 = nil
        selectedDefender2 = nil
        totalRate = 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedAttackPoke: PokeType.allCases.first!, selectedDefender1: PokeType.allCases.last!, selectedDefender2: PokeType.allCases.first!)
    }
}
