//
//  Menu.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import IdentifiedCollections

// MARK: - Menu

/// Menu.
/// - Note: Sorted via swiftformat:sort.
struct Menu {
    /// Items.
    var items: IdentifiedArrayOf<MenuItem> = []
}

/// Default implementations on `Menu`.
extension Menu {
    /// Default menu.
    static var `default`: Self {
        .init(
            items: .init(uniqueElements: [
                // Fries
                .init(name: "Small Fry", price: 5.0, colour: .orange),
                .init(name: "Medium Fry", price: 6.0, colour: .orange),
                .init(name: "Large Fry", price: 8.0, colour: .orange),
                .init(name: "Family Fry", price: 13.0, colour: .orange),
                // Gravy (Part 1)
                .init(name: "Small Gravy", price: 1.5, colour: .primary),
                .init(name: "Medium Gravy", price: 3.0, colour: .primary),
                .init(name: "Large Gravy", price: 4.0, colour: .primary),
                // Poutine
                .init(name: "Small Poutine", price: 7.0, colour: .brown),
                .init(name: "Medium Poutine", price: 8.0, colour: .brown),
                .init(name: "Large Poutine", price: 10.0, colour: .brown),
                .init(name: "Family Poutine", price: 18.0, colour: .brown),
                // Toppings
                .init(name: "Topping", price: 2.5, abbreviation: "TOP", colour: .pink),
                // Gravy (Part 2)
                .init(name: "Extra Gravy", price: 0.5, abbreviation: "XG", colour: .primary),
                // Cheese
                .init(name: "Extra Cheese", price: 2.5, abbreviation: "XC", colour: .orange),
                // Dogs
                .init(name: "Hot Dog", price: 3.0, colour: .blue),
                .init(name: "Cheese Dog", price: 3.75, colour: .blue),
                .init(name: "Bacon Dog", price: 3.50, colour: .blue),
                .init(name: "Bacon Cheese Dog", price: 6.25, colour: .blue),
                // Poutine
                .init(name: "With Poutine", price: 8.0, colour: .brown),
                // Fry
                .init(name: "With Fries", price: 6.0, colour: .orange),
                // Gravy (Part 3)
                .init(name: "With Gravy", price: 0.75, colour: .primary),
                // Burgers
                .init(name: "Hamburger", price: 7.5, abbreviation: "HB", colour: .brown),
                .init(name: "Cheeseburger", price: 8.25, abbreviation: "CB", colour: .brown),
                .init(name: "Bacon Hamburger", price: 10.0, abbreviation: "B.HB", colour: .brown),
                .init(name: "Bacon Cheeseburger", price: 10.75, abbreviation: "BCB", colour: .brown),
                // Onion ring
                .init(name: "Onion Ring", price: 7.0, colour: .orange),
                // Mozzarella sticks
                .init(name: "Mozzarella Sticks", price: 8.0, abbreviation: "MOZ", colour: .primary),
                // Deep-fried cheese curds
                .init(name: "Deep-Fried Cheese Curds", price: 10.0, abbreviation: "DFCC", colour: .orange),
                // Chicken burger
                .init(name: "Chicken Burger", price: 10.75, abbreviation: "CkB", colour: .brown),
                // Sausages
                .init(name: "Italian Sausage", price: 3.0, abbreviation: "IS", colour: .brown),
                .init(name: "Polish Sausage", price: 3.0, abbreviation: "PS", colour: .brown),
                // Popcorn chicken
                .init(name: "Popcorn Chicken", price: 6.0, abbreviation: "PCk", colour: .mint),
                .init(name: "Chicken Fingers", price: 7.5, abbreviation: "CF", colour: .mint),
                // Cheese slice
                .init(name: "Cheese Slice", price: 0.75, abbreviation: "CS", colour: .orange),
                // Fried onion
                .init(name: "Fried Onion", price: 1.5, abbreviation: "FO", colour: .orange),
                // Pogo
                .init(name: "Pogo", price: 3.0, abbreviation: "POGO", colour: .pink),
                // Drink
                .init(name: "Drink", price: 1.75, abbreviation: "DRI", colour: .mint),
                // Flat
                .init(name: "0.50", price: 0.50, abbreviation: "$", colour: .primary),
                .init(name: "1.00", price: 1.00, abbreviation: "$", colour: .primary),
                .init(name: "2.00", price: 2.00, abbreviation: "$", colour: .primary),
                .init(name: "3.00", price: 3.00, abbreviation: "$", colour: .primary),
                .init(name: "4.00", price: 4.00, abbreviation: "$", colour: .primary),
            ])
        )
    }
}
