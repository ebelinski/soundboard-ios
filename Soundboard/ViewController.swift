import UIKit

class ViewController: UIViewController {
  
  @IBAction func didTapPlayButton(_ sender: Any) {
    AudioManager.sharedInstance.play(sound: ItemManager.sharedInstance.items[0].audioFileName)
  }
  
}
