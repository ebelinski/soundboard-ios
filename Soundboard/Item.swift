import UIKit

struct Item {
  
  let name: String
  let description: String
  
  init(rawItem: [String]) {
    name = rawItem[0]
    description = rawItem[1]
  }
  
}
