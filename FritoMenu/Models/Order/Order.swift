//
//  Order.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import Foundation
import IdentifiedCollections

/// Order.
/// - Note: Sorted via swiftformat:sort.
struct Order: Equatable, Identifiable {
    // MARK: Properties

    /// ID.
    var id: UUID

    /// Items.
    var items: [OrderItem: Int]

    // MARK: Computed Properties

    var count: Int { items.values.reduce(0, +) }

    /// Total.
    var total: Double {
        items.reduce(0) { $0 + ($1.key.cost * Double($1.value)) }
    }

    // MARK: Lifecycle

    /// Initialize an `Order`.
    /// - Parameter items: Items.
    init(items: [OrderItem: Int] = [:]) {
        self.items = items
        id = .init()
    }

    // MARK: Functions

    /// Add an item.
    /// - Parameter item: Item.
    mutating func add(item: OrderItem) {
        if items.contains(where: { $0.key == item }) {
            items[item]? += 1
        } else {
            items[item] = 1
        }
    }

    /// Clear.
    mutating func clear() { items.removeAll() }
    /// Delete an item.
    /// - Parameter item: Item.
    mutating func delete(item: OrderItem) { items.removeValue(forKey: item) }
    /// Subtract an item.
    /// - Parameter item: Item.
    mutating func subtract(item: OrderItem) {
        if let count = items[item], count > 1 {
            items[item] = count - 1
        } else {
            items.removeValue(forKey: item)
        }
    }
}
