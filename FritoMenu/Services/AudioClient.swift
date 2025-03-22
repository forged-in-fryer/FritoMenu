//
//  AudioClient.swift
//  FritoMenu
//
//  Created by Jason Tran on 2025-03-22.
//

import AVFoundation

/// Audio client.
/// - Note: Sorted via swiftformat:sort.
@MainActor final class AudioClient {
    // MARK: Static Properties

    /// `AudioClient` singleton.
    static let shared: AudioClient = .init()

    // MARK: Properties

    /// Player.
    private var player: AVAudioPlayer?

    // MARK: Lifecycle

    /// Initialize an `AudioClient`.
    private init() {}

    // MARK: Functions

    /// Play beep.
    func playBeep() {
        guard let url = Bundle.main.url(forResource: "beep", withExtension: "wav") else {
            return
        }
        do {
            if player == nil {
                player = try AVAudioPlayer(contentsOf: url)
            }
            player?.play()
        } catch {
            // Do nothing
            return
        }
    }
}
