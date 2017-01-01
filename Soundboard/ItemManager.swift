import UIKit

struct ItemManager {
    
  static var sharedInstance = ItemManager()
  
  let items: [Item]
  
  init() {
    var items = [Item]()
    
    guard let pathForCSV = Bundle.main.path(forResource: itemsCSVFileName, ofType: "csv") else {
      print("Could not get pathForCSV")
      self.items = items
      return
    }
    
    do {
      let contents = try String(contentsOfFile: pathForCSV)
      let rawItems = contents.characters.split{$0 == "\n"}.map(String.init)
      for line in rawItems {
        let rawItem = line.characters.split{$0 == "|"}.map(String.init)
        if rawItem.count != 2 {
          print("Invalid rawItem length")
          continue
        }
        items.append(Item(rawItem: rawItem))
      }
    } catch {
      print(error.localizedDescription)
    }
    
    self.items = items
  }
    
}
