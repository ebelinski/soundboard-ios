import UIKit
import Crashlytics
import AVFoundation

struct AudioManager {
  
  static var sharedInstance = AudioManager()
  
  var currentPlayer: AVAudioPlayer?
  
  init() {
    do {
      try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
    } catch {
      print(error.localizedDescription)
      Crashlytics.sharedInstance().recordError(error)
    }
  }
  
  mutating func play(sound: String) {
    guard let sound = NSDataAsset(name: sound) else {
      print("Could not obtain sound asset")
      return
    }

    Answers.logCustomEvent(withName: "Play Sound",
                           customAttributes: ["Sound Name": sound])
    
    do {
      currentPlayer = try AVAudioPlayer(data: sound.data,
                                        fileTypeHint: AVFileType.mp3.rawValue)
      currentPlayer?.play()
    } catch {
      print(error.localizedDescription)
      Crashlytics.sharedInstance().recordError(error)
    }
  }
  
}
