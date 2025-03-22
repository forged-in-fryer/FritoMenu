//
//  MenuView.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

import SwiftUI

/// Menu view.
/// - Note: Sorted via swiftformat:sort.
struct MenuView: View {
    // MARK: SwiftUI Properties

    /// Horizontal size class.
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass: UserInterfaceSizeClass?

    // MARK: Properties

    /// Menu.
    let menu: Menu

    /// On select action.
    let onSelect: (MenuItem) -> Void

    // MARK: Lifecycle

    /// Initialize a `MenuView`.
    /// - Parameters:
    ///   - menu: Menu.
    ///   - onSelect: On select action.
    init(menu: Menu, onSelect: @escaping (MenuItem) -> Void) {
        self.menu = menu
        self.onSelect = onSelect
    }

    // MARK: Content Properties

    /// Menu body.
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 84))]) {
                ForEach(menu.items, id: \.id) { item in
                    MenuItemButton(item: item) { onSelect($0) }
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    MenuView(menu: .default) { print($0.name) }
}
