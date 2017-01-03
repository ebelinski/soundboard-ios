import UIKit

class ItemTableViewCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var favoriteButtonContainer: UIView!
  @IBOutlet weak var favoriteButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    backgroundColor = appColorMedium
    nameLabel.textColor = UIColor.white
    descriptionLabel.textColor = UIColor.white
    favoriteButtonContainer.backgroundColor = appColorDark
    
    let bgColorView = UIView()
    bgColorView.backgroundColor = appColorLight
    selectedBackgroundView = bgColorView
  }
  
}
