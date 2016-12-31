import UIKit
import AVFoundation

struct AudioManager {
  
  static var sharedInstance = AudioManager()
  
  var currentPlayer: AVAudioPlayer?
  
  init() {
    do {
      try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  mutating func playSound() {
    if let sound = NSDataAsset(name: "catapult-the-propaganda") {
      do {
        let player = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeMPEGLayer3)
        currentPlayer = player
        player.play()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
}
