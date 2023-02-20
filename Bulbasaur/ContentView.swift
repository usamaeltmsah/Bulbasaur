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
    @State var shouldAddDefender1: Bool = false
    @State var shouldAddDefender2: Bool = false
    
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
                    if shouldAddDefender1 {
                        PokeTypesHScrollableView(pokemonTypes: PokeType.allCases, title: "Defender", selectedPokemon: $selectedDefender1)
                    }
                    if shouldAddDefender2 && selectedDefender1 != nil {
                        PokeTypesHScrollableView(pokemonTypes: PokeType.allCases, title: nil, selectedPokemon: $selectedDefender2)
                    }
                    if !(shouldAddDefender1 && shouldAddDefender2) {
                        AddDefenderButton()
                            .onTapGesture {
                                if shouldAddDefender1 {
                                    shouldAddDefender2 = true
                                }
                                shouldAddDefender1 = true
                            }
                    }
                    Spacer(minLength: 20)
                    
                    Divider()
                    if (selectedAttackPoke != nil && selectedDefender1 != nil) {
                        VStack {
                            Spacer(minLength: 30)
                            if let selectedAttackPoke, let selectedDefender1, let rate = GameLogic().getRate(attacker: selectedAttackPoke, defender1: selectedDefender1, defender2: selectedDefender2) {
                                HStack(spacing: 0) {
                                    Text("x")
                                        .font(.title3)
                                    Text("\(rate.formatted) \(GameLogic().getResultText(for: rate))")
                                        .font(.title2)
                                }
                                .foregroundColor(GameLogic().getColor(for: rate))
                            }
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
        shouldAddDefender1 = false
        shouldAddDefender2 = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedAttackPoke: PokeType.allCases.first!, selectedDefender1: PokeType.allCases.last!, selectedDefender2: PokeType.allCases.first!)
    }
}
