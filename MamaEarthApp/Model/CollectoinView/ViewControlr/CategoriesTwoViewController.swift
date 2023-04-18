//
//  CategoriesTwoViewController.swift
//  MamaEarthApp
//
//  Created by sanjana pethani on 13/03/23.
//

import UIKit

class CategoriesTwoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrOfData: [Ingredients] = []
    var arrOfImage: [String] = ["3","4","5","6","7","8","9","10","11"]
    var numberOfItemInRow: Int = 1
    var interItemSpace: CGFloat = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        registerFile()
    }
    private func registerFile(){
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    private func loadData(){
        arrOfData = [Ingredients(nameLabel: "Amla", bioLabel: "Trust Amla for Healty & Srong Hair"),
                     Ingredients(nameLabel: "Apple Cider", bioLabel: "Apple Cider Vinegar for Shiny Hair & Glowing Skin"),
                     Ingredients(nameLabel: "Coconut", bioLabel: "Give you Hair Complete Care With Coconut"),
                     Ingredients(nameLabel: "Ubtan", bioLabel:"Ban the Tan with Ubtan Goodness"),
                     Ingredients(nameLabel:"Vitamin C", bioLabel: "vitamin C Range for Glowing and Radiant Skin"),
                     Ingredients(nameLabel:"Aloe Vera", bioLabel: "Say Aloe to Healthy Skin & Hair"),
                     Ingredients(nameLabel: "Bhringraj", bioLabel: "Power of  Bhringraj for intense Hair Treatment "),
                     Ingredients(nameLabel: "Charcoal", bioLabel:"Detox your skin with Charcoal goodness"),
                     Ingredients(nameLabel: "Tea Tree", bioLabel: "Tea Tree Makes You Acne & & Dandruff-free")
        ]
    }
}
extension CategoriesTwoViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.nameLabel.text = arrOfData[indexPath.row].nameLabel
        cell.bioLabel.text = arrOfData[indexPath.row].bioLabel
        cell.backGroundImageview.image = UIImage(named:  arrOfImage[indexPath.row])
//        cell.nameLabel.textColor = arrOfData[indexPath.row].textColor
        return cell
    }
}


extension CategoriesTwoViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let space = CGFloat(numberOfItemInRow+1) * interItemSpace
        let avilabelSpace = collectionView.frame.width - space
        let cellWidth = avilabelSpace / CGFloat(numberOfItemInRow)
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
