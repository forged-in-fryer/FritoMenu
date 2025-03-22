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
    
    /// Player.
    private var player: AVAudioPlayer?
    
    /// `AudioClient` singleton.
    static let shared: AudioClient = .init()
    
    /// Initialize an `AudioClient`.
    private init() {}
    
    /// Play beep.
    func playBeep() {
        guard let url = Bundle.main.url(forResource: "beep", withExtension: "wav") else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            // Do nothing
            return
        }
    }
}
