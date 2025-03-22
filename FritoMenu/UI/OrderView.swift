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
        List(order.items.sorted { $0.key.name < $1.key.name }, id: \.key.name) { item, quantity in
            HStack {
                Text("\(quantity)x")
                Spacer()
                OrderItemView(item: item)
            }
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
            items: [
                OrderItem(name: "Burger", cost: 5.0): 2,
                OrderItem(name: "Fries", cost: 3.0): 1,
                OrderItem(name: "Poutine", cost: 7.0, options: [
                    .init(name: "Bacon Topping", cost: 2.50),
                ]): 1,
            ]
        )
    ) { print($0.name) }
}
