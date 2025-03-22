//
//  OrderItem.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import Foundation
import IdentifiedCollections

/// Order item.
/// - Note: Sorted via swiftformat:sort.
struct OrderItem: Equatable, Identifiable, Hashable {
    // MARK: Properties

    /// Cost.
    var cost: Double

    /// ID.
    var id: UUID

    /// Name.
    var name: String

    /// Options.
    var options: [Self] = []

    // MARK: Computed Properties

    /// Total.
    var total: Double { cost + options.map(\.cost).reduce(0, +) }

    // MARK: Lifecycle

    /// Initialize a `OrderItem`.
    /// - Parameters:
    ///   - name: Name.
    ///   - cost: Cost.
    ///   - options: Options.
    init(name: String, cost: Double, options: [Self] = []) {
        self.name = name
        self.cost = cost
        self.options = options
        id = UUID()
    }

    // MARK: Static Functions

    /// Check equality.
    /// - Parameters:
    ///   - lhs: Left hand side.
    ///   - rhs: Right hand side.
    /// - Returns: True if `lhs` is equal to `rhs`.
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name && lhs.cost == rhs.cost && lhs.options == rhs.options
    }

    // MARK: Functions

    /// Hash `OrderItem`.
    /// - Parameter hasher: Hasher.
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(cost)
        hasher.combine(options)
    }
}
