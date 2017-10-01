import UIKit

class LinkButton: UIButton {

  var link: Link? {
    didSet {
      if let title = self.link?.title {
        setTitle(title, for: .normal)
      }
    }
  }

}
