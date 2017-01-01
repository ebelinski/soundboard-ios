import UIKit

class SoundboardViewController: UITableViewController {
  
  let items = ItemManager.sharedInstance.items
  var filteredItems = [Item]()
  var showFilteredItems = false
  var sourceItems: [Item] {
    get {
      return showFilteredItems ? filteredItems : items
    }
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sourceItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = sourceItems[indexPath.row].name
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    AudioManager.sharedInstance.play(sound: sourceItems[indexPath.row].name)
  }
  
}
