//
//  String+Helpers.swift
//  FritoMenu
//
//  Created by Khoa Tran on 2025-03-21.
//

/// Helpers for `String`.
/// - Note: Sorted via swiftformat:sort.
extension String {
    /// Initials.
    var initials: String {
        components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .compactMap(\.first)
            .map { String($0).uppercased() }
            .joined()
    }
}
