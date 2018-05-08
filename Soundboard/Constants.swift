import UIKit

let itemsCSVFileName = "items"

enum Color {
  static let dark = UIColor(red: 0.176, green: 0.294, blue: 0.376, alpha: 1) // #2d4b60
  static let medium = UIColor(red: 0.278, green: 0.522, blue: 0.576, alpha: 1) // #478593
  static let light = UIColor(red: 0.373, green: 0.651, blue: 0.714, alpha: 1) // #5fa6b6
  static let text = UIColor.white
}

let screenWidth = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)

let itemFavoritedKey = "com.ebelinski.Soundboard.item.with.name.%@.favorited"

let itemFavoritesDidUpdateNotificationKey = "com.ebelinski.Soundboard.itemFavoritesDidUpdateNotification"
