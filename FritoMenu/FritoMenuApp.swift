//
//  FritoMenuApp.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-17.
//

import SwiftUI

/// Main entry app point.
/// - Note: Sorted via swiftformat:sort.
@main struct FritoMenuApp: App {
    // MARK: Static Properties

    /// FritoMenu model.
    private static let model: FritoMenuModel = .init()

    // MARK: Computed Properties

    /// Main body.
    var body: some Scene {
        WindowGroup {
            FritoMenuView(model: Self.model)
        }
    }
}
