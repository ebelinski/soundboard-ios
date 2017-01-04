import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var shortNameLabelContainer: UIView!
  @IBOutlet weak var shortNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    shortNameLabel.textColor = UIColor.white
    backgroundColor = appColorMedium
    shortNameLabelContainer.backgroundColor = appColorDark
    shortNameLabelContainer.layer.cornerRadius = shortNameLabelContainer.frame.width / 2
  }
  
}
