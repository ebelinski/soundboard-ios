import UIKit

class SoundboardViewController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.register(UINib(nibName: "ItemCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "itemcell")
  }
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemcell", for: indexPath) as? ItemCollectionViewCell else {
      return UICollectionViewCell()
    }
    
    return cell
  }
  
}

extension SoundboardViewController : UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: screenWidth/3, height: screenWidth/3)
  }
  
}
