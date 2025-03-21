//
//  MenuItem.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import SwiftUI

/// Menu item.
/// - Note: Sorted via swiftformat:sort.
struct MenuItem: Identifiable {
    // MARK: Properties

    /// Abbreviation.
    var abbreviation: String?

    /// Colour.
    var colour: Color

    /// Name.
    var name: String

    /// Options category.
    var optionsCategory: MenuItemOptionsCategory

    /// Price.
    var price: Double

    // MARK: Computed Properties

    /// ID.
    var id: String { name }

    // MARK: Lifecycle

    /// Initialize a `MenuItem`.
    /// - Parameters:
    ///   - name: Name.`
    ///   - price: Price.
    ///   - optionsCategory: Options category.
    ///   - abbreviation: Abbreviation.
    ///   - colour: Colour.
    init(
        name: String,
        price: Double,
        optionsCategory: MenuItemOptionsCategory = .none,
        abbreviation: String? = nil,
        colour: Color = .accentColor
    ) {
        self.name = name
        self.optionsCategory = optionsCategory
        self.price = price
        self.abbreviation = abbreviation
        self.colour = colour
    }
}
