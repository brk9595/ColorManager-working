//
//  ColorModel.swift
//  ColorManager2
//
//  Created by Bharath Raj Kumar B on 24/02/21.
//

import Foundation


struct ColorModel: Hashable, Identifiable, Codable {
    let id: Int
    let colorName: String
    let colorHex: String
    var isFav: Bool
}
