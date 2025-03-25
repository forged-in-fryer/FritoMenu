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
struct OrderItem: Equatable, Identifiable {
    // MARK: Properties

    /// Abbreviation.
    var abbreviation: String

    /// Cost.
    var cost: Double

    /// ID.
    var id: UUID

    /// Name.
    var name: String

    /// Options.
    var options: IdentifiedArrayOf<OrderItem> = []

    // MARK: Computed Properties

    /// Total.
    var total: Double { cost + options.reduce(0) { $0 + $1.cost } }

    // MARK: Lifecycle

    /// Initialize a `OrderItem`.
    /// - Parameters:
    ///   - name: Name.
    ///   - abbreviation: Abbreviation.
    ///   - cost: Cost.
    ///   - options: Options.
    init(
        name: String,
        abbreviation: String,
        cost: Double,
        options: IdentifiedArrayOf<Self> = []
    ) {
        self.name = name
        self.abbreviation = abbreviation
        self.cost = cost
        self.options = options
        id = .init()
    }
}
