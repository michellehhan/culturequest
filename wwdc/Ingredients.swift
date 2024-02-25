//
//  Ingredients.swift
//  wwdc
//
//  Created by Michelle Han on 2/22/24.
//

import SwiftUI

import Foundation

struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let info: String
    let culture: String
    let mapImage: String
    let nutr: String
    let recAndUse: String
    var isFavorite: Bool = false
}

