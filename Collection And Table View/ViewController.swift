
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "CategoryCVC", bundle: nil), forCellWithReuseIdentifier: "CategoryCVC")
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)

        
    }

    
}


// MARK: collection View -

extension  ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCVC", for: indexPath) as? CategoryCVC
        else { return UICollectionViewCell()}
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width:(UIScreen.main.bounds.width - 48)/2,
               height: ( (UIScreen.main.bounds.width - 48)/2-20)*100/126+100)
        
    }
    
}
