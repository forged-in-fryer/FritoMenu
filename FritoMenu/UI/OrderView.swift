//
//  OrderView.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import SFSafeSymbols
import SwiftUI

/// Order view.
/// - Note: Sorted via swiftformat:sort.
struct OrderView: View {
    // MARK: Properties

    /// On delete.
    let onDelete: (OrderItem) -> Void

    /// Order.
    let order: Order

    // MARK: Lifecycle

    /// Initialize a `OrderView`.
    /// - Parameters:
    ///   - order: Order.
    ///   - onDelete: On delete action.
    init(order: Order, onDelete: @escaping (OrderItem) -> Void) {
        self.order = order
        self.onDelete = onDelete
    }

    // MARK: Content Properties

    /// Order body.
    var body: some View {
        List(order.items, id: \.id) { item in
            OrderItemView(item: item)
                .swipeActions(edge: .trailing) {
                    Button("Delete", systemSymbol: .trashFill, role: .destructive) {
                        onDelete(item)
                    }
                }
        }
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
    }
}

#Preview("Without Items") {
    OrderView(order: .init()) { print($0.name) }
}

#Preview("With Items") {
    OrderView(
        order: .init(
            items: .init(
                uniqueElements: [
                    .init(name: "Some Item", cost: 5.0),
                    .init(name: "Some Item", cost: 5.0),
                    .init(name: "Some Item", cost: 5.0),
                    .init(name: "Some Item", cost: 5.0),
                    .init(
                        name: "Poutine",
                        cost: 7.00,
                        options: [
                            .init(name: "Bacon Topping", cost: 2.50),
                        ]
                    ),
                ]
            )
        )
    ) { print($0.name) }
}
