//
//  MainVC.swift
//  Collection And Table View
//
//  Created by Abdulloh Murodilloyev on 24/03/22.
//

import UIKit

class MainVC: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableView.showsVerticalScrollIndicator = false
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "ImageTVC", bundle: nil), forCellReuseIdentifier: "ImageTVC")
            tableView.register(UINib(nibName: "CategoryTVC", bundle: nil),
                               forCellReuseIdentifier: "CategoryTVC")
            
            tableView.register(UINib(nibName: "ViewController", bundle: nil), forCellReuseIdentifier: "ViewController")
            tableView.register(UINib(nibName: "PopularTVC", bundle: nil), forCellReuseIdentifier: "PopularTVC")
            
            tableView.register(UINib(nibName: "SecondImageTVC", bundle: nil), forCellReuseIdentifier: "SecondImageTVC")
            
            tableView.register(UINib(nibName: "PhoneBrandsTVC", bundle: nil), forCellReuseIdentifier:  "PhoneBrandsTVC")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchController()
    }
    
    
    func setSearchController(){
        
        title = "🛖Home"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self as? UISearchControllerDelegate
        
        let searchBar = searchController.searchBar
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
        }
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
}

//MARK: - Table View -
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTVC", for: indexPath) as? ImageTVC else {return UITableViewCell()}
            cell.selectionStyle = .none
            return cell
//
//        } else if indexPath.row == 1 || indexPath.row > 2 && indexPath.row <= 6 || indexPath.row > 7 && indexPath.row >= 9 || indexPath.row >= 11 && indexPath.row >= 12 {
        }  else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTVC", for: indexPath) as? PopularTVC
            else{ return UITableViewCell()}
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 7 {
            guard let cell =   tableView.dequeueReusableCell(withIdentifier: "SecondImageTVC", for: indexPath) as? SecondImageTVC
            else{ return UITableViewCell()}
            return cell
        } else if indexPath.row == 10  {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneBrandsTVC", for: indexPath) as? PhoneBrandsTVC
            else{return UITableViewCell()}
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTVC", for: indexPath) as? CategoryTVC
            else{return UITableViewCell()}
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.row == 0 {
            return 120
        }  else if indexPath.row == 2 {
            return 160
        } else if indexPath.row == 7 {
            return UIScreen.main.bounds.width * 218/344 + 32
        } else if indexPath.row == 10  {
            return 170
        } else {
            return 294
        }
        
    }
    
}

//MARK: - CategoryTVCDelegate -
extension MainVC: CategoryTVCDelegate {
    func allBtnPressed() {
        let vc = ViewController(nibName: "ViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        //        vc.modalPresentationStyle = .fullScreen
        //        self.present(vc, animated: true, completion: nil)
    }
}
