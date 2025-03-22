//
//  MenuItemButton.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import SwiftUI

/// Menu item button.
/// - Note: Sorted via swiftformat:sort.
struct MenuItemButton: View {
    // MARK: Properties

    /// Action .
    let action: ((MenuItem) -> Void)?

    /// Menu item.
    let item: MenuItem
    

    // MARK: Lifecycle

    /// Initialize a `MenuItem`.
    /// - Parameter item: Item.
    init(item: MenuItem, action: ((MenuItem) -> Void)? = nil) {
        self.item = item
        self.action = action
    }

    // MARK: Content Properties

    /// Menu item button body.
    var body: some View {
        Button {
            AudioClient.shared.playBeep()
            action?(item)
        } label: {
            VStack {
                Text(item.abbreviation ?? item.name.initials)
                    .font(.title2)
                    .fontWeight(.heavy)
                Text(item.price.formatted(.currency(code: Locale.current.currency?.identifier ?? "CAD")))
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .monospaced()
            .padding(4)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
        }
        .buttonBorderShape(.roundedRectangle(radius: 16))
        .buttonStyle(.bordered)
        .tint(item.colour)
    }
}

#Preview {
    MenuItemButton(item: .init(name: "Some Item", price: 4.00)) { print($0.price) }
        .padding()
}
