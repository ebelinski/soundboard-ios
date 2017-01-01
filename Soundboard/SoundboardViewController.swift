import UIKit

class SoundboardViewController: UITableViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  
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
    searchBar.resignFirstResponder()
    AudioManager.sharedInstance.play(sound: sourceItems[indexPath.row].name)
  }
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    searchBar.resignFirstResponder()
  }
  
}


extension SoundboardViewController {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText == "" {
      showFilteredItems = false
    } else {
      filterItems(searchText)
      showFilteredItems = true
    }
    
    tableView.reloadData()
  }
  
  fileprivate func filterItems(_ text: String) {
    let lowercaseText = text.lowercased()
    
    filteredItems = []
    
    for item in items {
      if (item.name.lowercased().range(of: lowercaseText) != nil)
        || (item.description.lowercased().range(of: lowercaseText) != nil) {
          filteredItems.append(item)
      }
    }
  }
  
}
