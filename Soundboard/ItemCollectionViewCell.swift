import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var shortNameLabelContainer: UIView!
  @IBOutlet weak var shortNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    shortNameLabel.textColor = appColorText
    backgroundColor = appColorMedium
    shortNameLabelContainer.backgroundColor = appColorDark
    
    if screenWidth >= 768 {
      shortNameLabel.font = shortNameLabel.font.withSize(40)
    }
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    shortNameLabelContainer.layer.cornerRadius = shortNameLabelContainer.frame.width / 2
  }
  
}
