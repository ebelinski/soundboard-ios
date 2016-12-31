import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var currentPlayer: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    do {
      try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  @IBAction func didTapPlayButton(_ sender: Any) {
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
