import UIKit

class SoundListViewController: UITableViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  
  let items = ItemManager.sharedInstance.items
  var filteredItems = [Item]()
  var showFilteredItems = false
  var sourceItems: [Item] {
    get {
      return showFilteredItems ? filteredItems : items
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = appColorMedium
    
    tableView.register(UINib(nibName: "ItemTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "itemcell")
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sourceItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemcell", for: indexPath) as? ItemTableViewCell else {
      return UITableViewCell()
    }
    
    cell.item = sourceItems[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    searchBar.resignFirstResponder()
    AudioManager.sharedInstance.play(sound: sourceItems[indexPath.row].name)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 130
  }
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    searchBar.resignFirstResponder()
  }
  
}


extension SoundListViewController {
  
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
