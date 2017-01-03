import UIKit

struct Item {
  
  let name: String
  let shortName: String
  let description: String
  
  init(rawItem: [String]) {
    name = rawItem[0]
    shortName = rawItem[1]
    description = rawItem[2]
  }
  
}
