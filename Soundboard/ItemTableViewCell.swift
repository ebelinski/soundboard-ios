import UIKit

class ItemTableViewCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    backgroundColor = appColorMedium
    nameLabel.textColor = UIColor.white
    descriptionLabel.textColor = UIColor.white
  }
  
}
