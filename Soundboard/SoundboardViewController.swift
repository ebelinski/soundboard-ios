import UIKit

class SoundboardViewController: UICollectionViewController {
  
  var items = ItemManager.sharedInstance.allFavoritedItemsByShortName()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.backgroundColor = appColorMedium
    
    collectionView?.register(UINib(nibName: "ItemCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "itemcell")
    
    NotificationCenter.default.addObserver(self, selector: #selector(SoundboardViewController.updateCollection), name: NSNotification.Name(rawValue: itemFavoritesDidUpdateNotificationKey), object: nil)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if items.count == 0 {
      let instructionLabel = UILabel(frame: CGRect(x: 40, y: 100, width: screenWidth-80, height: 300))
      instructionLabel.text = "Go to the All Sounds tab and tap on a heart to add a sound to your soundboard!"
      instructionLabel.textColor = UIColor.white
      instructionLabel.numberOfLines = 10
      instructionLabel.sizeToFit()
      view.addSubview(instructionLabel)
    }
  }
  
}

// MARK: Data source

extension SoundboardViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemcell", for: indexPath) as? ItemCollectionViewCell else {
      return UICollectionViewCell()
    }
    
    cell.shortNameLabel?.text = items[indexPath.row].shortName
    
    return cell
  }
  
  func updateCollection() {
    items = ItemManager.sharedInstance.allFavoritedItemsByShortName()
    collectionView?.reloadData()
  }
  
}

// MARK: Delegate

extension SoundboardViewController {
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    AudioManager.sharedInstance.play(sound: items[indexPath.row].name)
  }
  
}

// MARK: Flow layout

extension SoundboardViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: screenWidth/3, height: screenWidth/3)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
}
