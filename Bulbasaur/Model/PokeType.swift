//
//  PokeType.swift
//  Bulbasaur
//
//  Created by Usama Fouad on 17/02/2023.
//

import Foundation

struct PokeType: Hashable {
    var name: PokeName
    var image: PokeName
    var color: PokeName
    
    init(_ name: PokeName) {
        self.name = name
        self.image = name
        self.color = name
    }
    
    static var allCases: [PokeType] = {
        var pokeTypes: [PokeType] = []
        for pokeName in PokeName.allCases {
            pokeTypes.append(PokeType(pokeName))
        }
        
        return pokeTypes
    }()
}
