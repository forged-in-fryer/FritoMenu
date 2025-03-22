//
//  FritoMenuView.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import SwiftUI

/// FritoMenu view.
/// - Note: Sorted via swiftformat:sort.
struct FritoMenuView: View {
    // MARK: Properties

    /// FritoMenu model.
    @Bindable var model: FritoMenuModel

    // MARK: Lifecycle

    /// Initialize a `FritoMenuView`.
    /// - Parameter model: FritoMenu model.
    init(model: FritoMenuModel) {
        self.model = model
    }

    // MARK: Content Properties

    /// FritoMenu body.
    var body: some View {
        HStack {
            // Menu
            MenuView(menu: model.menu) { model.addToOrder($0) }
                .frame(maxWidth: .infinity)
            VStack(alignment: .trailing) {
                // Order
                OrderView(order: model.order) { model.deleteFromOrder($0) }
                    .animation(.default, value: model.order)
                // Total
                Divider()
                Text(model.order.total.formatted(.currency(code: Locale.current.currency?.identifier ?? "CAD")))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .monospaced()
                    .padding(.vertical)
                    .animation(.default, value: model.order.total)
                    .contentTransition(.numericText())
                // Control
                Button {
                    AudioClient.shared.playBeep()
                    model.order.clear()
                } label: {
                    Text("CLEAR")
                        .font(.title)
                        .fontWeight(.bold)
                        .monospaced()
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .buttonBorderShape(.roundedRectangle(radius: 16))
                .buttonStyle(.borderedProminent)
            }
            .padding([.bottom, .horizontal])
            .frame(width: 352)
            .background(Color(uiColor: .systemGroupedBackground))
        }
    }
}

#Preview {
    FritoMenuView(model: .init())
}
