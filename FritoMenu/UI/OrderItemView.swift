//
//  OrderItemView.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import SwiftUI

/// Order item view.
/// - Note: Sorted via swiftformat:sort.
struct OrderItemView: View {
    // MARK: Properties

    /// Item.
    let item: OrderItem

    // MARK: Lifecycle

    /// Initialize an `OrderItemView`.
    /// - Parameter item: Order item.
    init(item: OrderItem) {
        self.item = item
    }

    // MARK: Content Properties

    /// Order item body.
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            main
            if !item.options.isEmpty {
                options.padding(.leading)
            }
        }
        .font(.headline)
    }

    /// Main.
    private var main: some View {
        HStack {
            ViewThatFits {
                Text(item.name)
                Text(item.abbreviation)
            }
            Spacer()
            Text(item.cost.formatted(.currency(code: Locale.current.currency?.identifier ?? "CAD")))
                .monospaced()
                .foregroundStyle(item.options.isEmpty ? .primary : .secondary)
        }
    }

    /// Options.
    private var options: some View {
        VStack(spacing: 8.0) {
            // Options
            ForEach(item.options, id: \.id) { option in
                HStack {
                    Text(option.name)
                    Spacer()
                    Text(option.cost.formatted(.currency(code: Locale.current.currency?.identifier ?? "CAD")))
                        .monospaced()
                }
                .foregroundStyle(.secondary)
            }
            // Total
            HStack {
                Spacer()
                Text(item.total.formatted(.currency(code: Locale.current.currency?.identifier ?? "CAD")))
                    .monospaced()
                    .foregroundStyle(.primary)
            }
            .padding(.top)
        }
    }
}

#Preview {
    List {
        OrderItemView(item: .init(name: "Some Item", abbreviation: "SI", cost: 4.00))
        OrderItemView(item: .init(name: "Some Item", abbreviation: "SI", cost: 4.00))
        OrderItemView(
            item: .init(
                name: "Some Item",
                abbreviation: "SI",
                cost: 4.00,
                options: [
                    .init(name: "Some Option", abbreviation: "SO", cost: 2.00),
                    .init(name: "Some Option", abbreviation: "SO", cost: 2.00),
                    .init(name: "Some Option", abbreviation: "SO", cost: 2.00),
                ]
            )
        )
        OrderItemView(
            item: .init(
                name: "Hamburger",
                abbreviation: "HB",
                cost: 7.5,
                options: [
                    .init(name: "All Dressing", abbreviation: "AD", cost: 0),
                    .init(name: "Extra Patty", abbreviation: "EP", cost: 1.5),
                    .init(name: "Some Option", abbreviation: "SO", cost: 2.00),
                ]
            )
        )
    }
}
