//
//  FritoMenuModel.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import SwiftUI

/// FritoMenu model.
/// - Note: Sorted via swiftformat:sort.
@Observable final class FritoMenuModel {
    // MARK: Properties

    /// Menu.
    var menu: Menu = .default

    /// Order.
    var order: Order = .init()

    // MARK: Functions

    /// Add to order.
    /// - Parameter item: Item.
    func addToOrder(_ item: MenuItem) {
        order.add(
            item: .init(
                name: item.name,
                abbreviation: item.abbreviation ?? item.name.initials,
                cost: item.price
            )
        )
    }

    /// Clear order.
    func clear() { order.clear() }
    /// Delete from order.
    /// - Parameter item: Item.
    func deleteFromOrder(_ item: OrderItem) { order.delete(item: item) }
}
