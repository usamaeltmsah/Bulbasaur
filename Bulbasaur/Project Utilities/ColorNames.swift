//
//  ColorNames.swift
//  Topotify
//
//  Created by Usama Fouad on 17/02/2022.
//

import SwiftUI

extension Color {
    
    /// Creates an image using `ColorName`, an enum which contains the names of
    /// all the image assets.
    init(_ name: PokeName) {
        self.init(name.rawValue)
    }
}

extension UIColor {
    /// Creates an image using `ColorName`, an enum which contains the names of
    /// all the image assets.
    convenience init?(_ name: PokeName) {
        self.init(named: name.rawValue)
    }
}
