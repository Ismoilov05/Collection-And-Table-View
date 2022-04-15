

import UIKit

protocol CategoryTVCDelegate {
    func allBtnPressed()
}

class CategoryTVC: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: CategoryTVCDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        collectionView.register(UINib(nibName: "CategoryCVC", bundle: nil), forCellWithReuseIdentifier: "CategoryCVC")
    }
    
    @IBAction func pressBtn(_ sender: Any) {
             
    }
    
    @IBAction func pressedBtn(_ sender: Any) {
        delegate?.allBtnPressed()
    }

}

// MARK: - Collection View Methods -
extension CategoryTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CategoryCVC" , for: indexPath) as? CategoryCVC
        else { return UICollectionViewCell()}
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(
            width: (UIScreen.main.bounds.width-48)/2.4,
            height: collectionView.frame.height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
    }
}




