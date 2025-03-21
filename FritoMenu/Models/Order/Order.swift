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
    var items: IdentifiedArrayOf<OrderItem>

    // MARK: Computed Properties

    /// Total.
    var total: Double { items.reduce(0) { $0 + $1.total } }

    // MARK: Lifecycle

    /// Initialize an `Order`.
    /// - Parameter items: Items.
    init(items: IdentifiedArrayOf<OrderItem> = []) {
        self.items = items
        id = .init()
    }

    // MARK: Functions

    /// Add an item.
    /// - Parameter item: Item.
    mutating func add(item: OrderItem) { items.append(item) }

    /// Clear.
    mutating func clear() { items.removeAll() }
    /// Delete an item.
    /// - Parameter item: Item.
    mutating func delete(item: OrderItem) { items.remove(id: item.id) }
}
