import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var currentSound: AVAudioPlayer?
  
  @IBAction func didTapPlayButton(_ sender: Any) {
    if let soundURL = Bundle.main.url(forResource: "catapult-the-propaganda", withExtension: "mp3") {
      do {
        let sound = try AVAudioPlayer(contentsOf: soundURL)
        currentSound = sound
        sound.play()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
}
