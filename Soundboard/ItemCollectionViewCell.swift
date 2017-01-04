import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var shortNameLabelContainer: UIView!
  @IBOutlet weak var shortNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    shortNameLabel.textColor = UIColor.white
    backgroundColor = appColorMedium
    shortNameLabelContainer.backgroundColor = appColorDark
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    shortNameLabelContainer.layer.cornerRadius = shortNameLabelContainer.frame.width / 2
  }
  
}
