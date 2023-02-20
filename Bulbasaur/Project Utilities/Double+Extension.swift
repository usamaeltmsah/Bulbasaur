//
//  Double+Extension.swift
//  Bulbasaur
//
//  Created by Usama Fouad on 20/02/2023.
//

import Foundation

extension Double {
    var formatted: String {
        switch self.truncatingRemainder(dividingBy: 1) {
        case 0:
            return String(format: "%.0f", self)
        case 0.5:
            return String(format: "%.1f", self)
        default:
            return String(format: "%.2f", self)
        }
    }
}
