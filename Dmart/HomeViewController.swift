//
//  HomeViewController.swift
//  Dmart
//
//  Created by Avinash Shirsath on 04/12/21.
//

import UIKit
import SDWebImage

class HomeViewController: DmartBase{
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.layer.cornerRadius = 3
            collectionView.clipsToBounds = true
        }
    }
    @IBOutlet weak var tblHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var grideCollectionView: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    
    var homeVM = HomeViewVM()
    var bannerArray = ["bannerImg","bannerImg","bannerImg","bannerImg"]
    var productListArray : [String] = ["1","2","3","4","5","6","7","8","9","10"]
    var collectionListArray : [SampleImageModel] = []
    
    
    // MARK:- Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductListTableViewCell")
        self.initialSetUp()
    }
    
    private func initialSetUp(){
        self.navigationItem.title = "Home"
        self.backNavigation()
        
        self.homeVM.fetchDataFromURL(urlString: Constant.fetchImgUrl) { response in
            self.collectionListArray.removeAll()
            self.collectionListArray = Array(response.prefix(upTo: 15))
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.grideCollectionView.reloadData()
            }
        }
        tblView.rowHeight = 220
        tblView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

/// MARK:- UITableViewDelegate,UITableViewDataSource -

extension HomeViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tblView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell") as? ProductListTableViewCell  else {
            return UITableViewCell()
        }
        cell.customCellSetUp(image: self.productListArray[indexPath.row])
        
        cell.onTapOfAddToCart = { addToCart in
            print("Add to Cart")
        }
        cell.onTapOfQuantityInLtr = { quantityInLtr in
            print("Quantity in Ltr")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.tblHeightConstraint.constant = self.tblView.contentSize.height
    }
}

// MARK:- UICollectionViewDelegate,UICollectionViewDataSource -

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == self.collectionView ? collectionListArray.count :  collectionListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.grideCollectionView {
            guard let cell : GridCollectionViewCell = self.grideCollectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath)as? GridCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            if let url = URL(string: self.collectionListArray[indexPath.item].url ?? "") {
                cell.grideImageView.sd_setImage(with: url)
                cell.lblTitle.text = self.collectionListArray[indexPath.item].thumbnailUrl ?? ""
            }
            return cell
        } else {
            guard let cell : SimpleCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "SimpleCell", for: indexPath)as? SimpleCell else {
                return UICollectionViewCell()
            }
            if let url = URL(string: self.collectionListArray[indexPath.item].url ?? "") {
                cell.imgView.sd_setImage(with: url)
            }
            cell.imgView.contentMode = .scaleAspectFill
            return cell
        }
    }
}

// MARK:- UICollectionViewDelegateFlowLayout -

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.collectionView {
            return CGSize(width: self.collectionView.frame.width , height: self.collectionView.frame.height)
        } else {
            return CGSize(width: self.grideCollectionView.frame.width / 3, height: self.grideCollectionView.frame.height / 3 )
        }
    }
}

// MARK:- Banner

class SimpleCell : UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
}
