//
//  ProductViewController.swift
//  MamaEarthApp
//
//  Created by sanjana pethani on 15/03/23.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrOfData: [ProductInformatino] = []
    var numberOfItemInRow: Int = 1
    var interItemSpace: CGFloat = 10
    var arrImages: [String] = ["baby jpeg","1 1","airdorp","2 1"]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
        loadData()
        
    }
    private func registerCollectionView(){
        collectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")
    }
    private func loadData(){
        arrOfData = [ProductInformatino(nameLabel: "Baby Care", bioLabel: "100% Gentle & Natural Care for Your Baby", textColor: .systemGreen),ProductInformatino(nameLabel: "Face Care", bioLabel: "Crafted with Nature for Your Skin", textColor: .systemPurple),ProductInformatino(nameLabel: "Color Care", bioLabel: "Touch of Color & a Splash of Nature", textColor: .systemRed),ProductInformatino(nameLabel: "Hair Care", bioLabel: "Natural Goodness Crafted for Your Hair", textColor: .systemBrown)]
    }
}
extension ProductViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProductsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        cell.nameLabel.text = arrOfData[indexPath.row].nameLabel
        cell.bioLabel.text = arrOfData[indexPath.row].bioLabel
        cell.backgroundImageView.image = UIImage(named:  arrImages[indexPath.row])
        cell.nameLabel.textColor = arrOfData[indexPath.row].textColor
        return cell
    }
}
extension ProductViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
struct ProductInformatino{
    var nameLabel: String
    var bioLabel: String
    var textColor: UIColor
}
