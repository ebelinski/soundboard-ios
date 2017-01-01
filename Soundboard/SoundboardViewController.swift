import UIKit

class SoundboardViewController: UITableViewController {
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ItemManager.sharedInstance.items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = ItemManager.sharedInstance.items[indexPath.row].name
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    AudioManager.sharedInstance.play(sound: ItemManager.sharedInstance.items[indexPath.row].audioFileName)
  }
  
}
