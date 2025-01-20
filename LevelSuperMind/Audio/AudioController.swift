

import Foundation
import AVFoundation

class AudioController: ObservableObject {
    private var player: AVAudioPlayer?
    private var timer: Timer?
    
    @Published var progress: Double = 0.0
    @Published var elapsedTime: String = "0:00"
    @Published var remainingTime: String = "0:00"
    
    func setupAudio() {
        guard let url = Bundle.main.url(forResource: "audio", withExtension: "mp3") else {
            print("Audio file not found")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            startTimer()
        } catch {
            print("Error initializing player: \(error.localizedDescription)")
        }
    }
    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    func stopAudio() {
        player?.stop()
        timer?.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateProgress()
        }
    }
    
    func updateProgress() {
        guard let player = player else { return }
        progress = player.currentTime / player.duration
        elapsedTime = formatTime(player.currentTime)
        remainingTime = formatTime(player.duration - player.currentTime)
    }
    
    func seekToProgress(editing: Bool) {
        guard let player = player else { return }
        if !editing {
            player.currentTime = player.duration * progress
        }
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
