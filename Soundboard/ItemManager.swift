import UIKit
import Crashlytics

struct ItemManager {
    
  static var sharedInstance = ItemManager()
  
  let items: [Item]
  
  init() {
    var items = [Item]()
    
    guard let pathForCSV = Bundle.main.path(forResource: itemsCSVFileName,
                                            ofType: "csv") else {
      print("Could not get pathForCSV")
      self.items = items
      return
    }
    
    do {
      let contents = try String(contentsOfFile: pathForCSV)
      let rawItems = contents.characters.split{$0 == "\n"}.map(String.init)
      for line in rawItems {
        let rawItem = line.characters.split{$0 == "|"}.map(String.init)
        if rawItem.count != 3 {
          print("Invalid rawItem length")
          continue
        }
        items.append(Item(rawItem: rawItem))
      }
    } catch {
      print(error.localizedDescription)
      Crashlytics.sharedInstance().recordError(error)
    }
    
    items.sort(by: {
      if $0.name.isEmpty && $1.name.isEmpty { return true }
      if $1.name.isEmpty { return true }
      if $0.name.isEmpty { return false }
      return $0.name.uppercased() < $1.name.uppercased()
    })
    
    self.items = items
  }
  
  func isFavorited(item: Item) -> Bool {
    return UserDefaults.standard.bool(forKey: String.localizedStringWithFormat(itemFavoritedKey, item.name))
  }
  
  func toggleFavorite(item: Item) {
    UserDefaults.standard.set(!isFavorited(item: item),
                              forKey: String.localizedStringWithFormat(itemFavoritedKey,
                                                                       item.name))
  }
  
  func allFavoritedItemsByShortName() -> [Item] {
    var favoritedItems = [Item]()
    
    for item in items {
      if isFavorited(item: item) {
        favoritedItems.append(item)
      }
    }
    
    favoritedItems.sort(by: {
      if $0.shortName.isEmpty && $1.shortName.isEmpty { return true }
      if $1.shortName.isEmpty { return true }
      if $0.shortName.isEmpty { return false }
      return $0.shortName.uppercased() < $1.shortName.uppercased()
    })
    
    return favoritedItems
  }
  
}
