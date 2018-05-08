import UIKit

class ItemTableViewCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var favoriteButtonContainer: UIView!
  @IBOutlet weak var favoriteButton: UIButton!
  
  var item: Item? {
    didSet {
      guard let item = item else { return }
      nameLabel.text = item.name
      descriptionLabel.text = item.description
      refreshFavoriteButton()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    backgroundColor = Color.medium
    nameLabel.textColor = Color.text
    descriptionLabel.textColor = Color.text
    favoriteButtonContainer.backgroundColor = Color.dark
    
    let bgColorView = UIView()
    bgColorView.backgroundColor = Color.light
    selectedBackgroundView = bgColorView
  }
  
  @IBAction func didTapFavoriteButton(_ sender: Any) {
    guard let item = item else { return }
    
    ItemManager.sharedInstance.toggleFavorite(item: item)
    refreshFavoriteButton()
    NotificationCenter.default.post(name: Notification.Name(rawValue: itemFavoritesDidUpdateNotificationKey), object: self)
  }
  
  fileprivate func refreshFavoriteButton() {
    guard let item = item else { return }
    
    if ItemManager.sharedInstance.isFavorited(item: item) {
      favoriteButton.setImage(UIImage(named: "heart_filled"), for: UIControlState())
    } else {
      favoriteButton.setImage(UIImage(named: "heart_unfilled"), for: UIControlState())
    }
  }
  
}
