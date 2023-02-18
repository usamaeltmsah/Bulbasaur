import Foundation
import SwiftUI

extension Image {
    
    /// Creates an image using `ImageName`, an enum which contains the names of
    /// all the image assets.
    init(_ name: PokeName) {
        self.init(name.rawValue)
    }
    
}

extension UIImage {
    
    /// Creates an image using `ImageName`, an enum which contains the names of
    /// all the image assets.
    convenience init?(_ name: PokeName) {
        self.init(named: name.rawValue)
    }
    
}

