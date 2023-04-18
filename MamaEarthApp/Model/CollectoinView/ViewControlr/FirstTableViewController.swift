//
//  ViewController.swift
//  MamaEarthApp
//
//  Created by sanjana pethani on 16/02/23.
//

import UIKit


class FirstTableViewController: UIViewController {
    
    @IBOutlet weak var myCollectionCell: UICollectionView!
    @IBOutlet weak var MyProdecCollectionView: UICollectionView!
    @IBOutlet weak var myMacaqup: UICollectionView!
    @IBOutlet weak var BTN: UIButton!
    @IBOutlet weak var OnionRangeCollectionView: UICollectionView!
    @IBOutlet weak var MAkeUpCollectionViewCell: UICollectionView!
    
    @IBOutlet weak var BabycollectionViewCell: UICollectionView!
    
    
    
    
    
    
    var arrImage: [String] = ["Banar1", "Banar2", "Banar3", "Banar4", "Banar5"]
    
    var arrProdec:[String] = ["prodec1","prodec2","prodec3","prodec4","prodec5","prodec6"]
    
    var arrNamelable:[String] = ["Best Seller","Make up","Face","Hair","body","Baby"]
    
    var arrOnionImage: [String] = ["onion 1","onion 2","onion 3","onion 4","onion 5"]
    
    var ArrOnionDetails: [OnionSaleDatails] = []
    
    var arrMakeupDetails: [MakeUpDetails] = []
    
    var arrBabyDetails: [BabyDetails] = []
    
    
    var arrmakeupImages: [String] = ["makeup 1","makeup 2","makeup 3","makeup 4","makeup 5"]
    
    var arrBabyImages: [String] = ["Baby 1","Baby 2","Baby 3","Baby 4","Baby 5"]
    
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        setup()
        
    }
    
    
    @IBAction func BTNTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let abc: OffersViewController = storyBoard.instantiateViewController(withIdentifier: "OffersViewController") as! OffersViewController
        navigationController?.pushViewController(abc, animated: true)
    }
    
    private func LoadOnionDetails() {
        let onionSale1: OnionSaleDatails = OnionSaleDatails(name: "Shampoo", Price: "₹499", instruction: "Reducing hair fall...", Rating: "4.9")
        let onionSale2: OnionSaleDatails = OnionSaleDatails(name: "Hair Oil", Price: "₹419", instruction: "Hair Growth...", Rating: "4.8")
        let onionSale3: OnionSaleDatails = OnionSaleDatails(name: "Conditionar", Price: "₹349", instruction: "Reducing hair fall...", Rating: "4.8")
        let onionSale4: OnionSaleDatails = OnionSaleDatails(name: "Onion Hair Mask", Price: "₹599", instruction: "Reducing hair fall...", Rating: "4.9")
        let onionSale5: OnionSaleDatails = OnionSaleDatails(name: "Shampoo with Conditioner", Price: "₹699", instruction: "Reducing hair fall...", Rating: "4.5")
        ArrOnionDetails = [onionSale1, onionSale2, onionSale3, onionSale4,onionSale5]
    }
    private func loadMakeUpDetails() {
        let makeUP1: MakeUpDetails = MakeUpDetails(name1: "Glow serum Foundation", Price1: "₹599", instruction1: "12-Hour Long Stay")
        let makeUP2: MakeUpDetails = MakeUpDetails(name1: "Glow serum Foundation", Price1: "₹599", instruction1: "12-Hour Long Stay")
        let makeUP3: MakeUpDetails = MakeUpDetails(name1: "charcol Black kajal", Price1: "₹499", instruction1: "11-Hour Long Stay")
        let makeUP4: MakeUpDetails = MakeUpDetails(name1: " Foundation", Price1: "₹699", instruction1: "24-Hour Long Stay")
        let makeUP5: MakeUpDetails = MakeUpDetails(name1: "lipStick", Price1: "₹299", instruction1: "6-Hour Long Stay")
        arrMakeupDetails = [makeUP1, makeUP2, makeUP3, makeUP4, makeUP5]
    }
    
    private func BabyDetails() {
        let Baby1: BabyDetails = MamaEarthApp.BabyDetails(name2: "Deeply nourishing Body Wash for babies", price2: "399",instruction2: "10-Hour long stay")
        
        let Baby2: BabyDetails = MamaEarthApp.BabyDetails(name2: " Milk Soft Body Wash  for Babies With Oats", price2: "200",instruction2: "9-Hour long stay")
        
        let Baby3: BabyDetails = MamaEarthApp.BabyDetails(name2: "baby shampoo", price2: "395",instruction2: "10-Hour long stay")
        
        let Baby4: BabyDetails = MamaEarthApp.BabyDetails(name2: "Super strawberry Body Wash for kids with Strawberry and Oat Protein", price2: "500",instruction2: "12-Hour long stay")
        
        let Baby5: BabyDetails = MamaEarthApp.BabyDetails(name2: "Nourshing Bathing Bar soap for kids", price2: "380",instruction2: "12-Hour long stay")
        arrBabyDetails = [Baby1, Baby2, Baby3, Baby4, Baby5]
}
    private func setup() {
        
        register()
        LoadOnionDetails()
        loadMakeUpDetails()
        BabyDetails()
        
    }
    
    private func register(){
        let nibFile = UINib(nibName: "CollectionViewCell", bundle: nil)
        myCollectionCell.register(nibFile, forCellWithReuseIdentifier: "cell")
        
        let nibFile2 = UINib(nibName: "twoCollectionViewCell", bundle: nil)
        MyProdecCollectionView.register(nibFile2, forCellWithReuseIdentifier: "cell2")
        
        let nibFile3 = UINib(nibName: "threeCollectionViewCell", bundle: nil)
        OnionRangeCollectionView.register(nibFile3, forCellWithReuseIdentifier: "cell3")
        
        let nibFile4 = UINib(nibName: "fourCollectionViewCell", bundle: nil)
        MAkeUpCollectionViewCell.register(nibFile4, forCellWithReuseIdentifier: "cell4")
        
        let nibFile5 = UINib(nibName: "fiveCollectionViewcellCollectionViewCell", bundle: nil)
        BabycollectionViewCell.register(nibFile5,forCellWithReuseIdentifier: "cell5")
        BabycollectionViewCell.delegate = self
        BabycollectionViewCell.dataSource = self
    }
}


extension FirstTableViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.myCollectionCell{
            return arrImage.count
        } else if collectionView == self.MyProdecCollectionView{
            return arrProdec.count
        } else if collectionView == self.OnionRangeCollectionView{
            return arrImage.count
        } else  if collectionView == self.MAkeUpCollectionViewCell{
            return arrmakeupImages.count
        }else {
            return arrBabyImages.count
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.myCollectionCell{
            let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cell.myImageView.image = UIImage(named: arrImage[indexPath.row])
            return cell
        } else if collectionView == self.MyProdecCollectionView{
            let cell: twoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! twoCollectionViewCell
            // cell.layer.borderWidth = 1
            //  cell.layer.cornerRadius = 57
            //cell.myImageView2.layer.cornerRadius = 30
            //cell.namelabel.layer.borderWidth = 0.1
            cell.layer.masksToBounds = true
            
            cell.nameLabel.text = arrNamelable[indexPath.row]
            let images = arrProdec[indexPath.row]
            cell.myImageView2.image = UIImage(named: images)
            //  cell.namelabel.text = "\(arrNamelable[indexPath.row])"
            
            return cell
        } else if collectionView == self.OnionRangeCollectionView{
            let cell: threeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! threeCollectionViewCell
            cell.nameLableInCollectionView.text = ArrOnionDetails[indexPath.row].name
            cell.instructionLabelInCollectionView.text = ArrOnionDetails[indexPath.row].instruction
            cell.PriceLabelInCollectionView.text = ArrOnionDetails[indexPath.row].Price
            cell.RatingLabelInCollectionView.text = ArrOnionDetails[indexPath.row].Rating
            cell.ImageViewINCollectionView.image = UIImage(named: arrOnionImage[indexPath.row])
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.cornerRadius = 5
            cell.layer.masksToBounds = true
            cell.ADDButtonInCollectionView.layer.cornerRadius = 13
            cell.ADDButtonInCollectionView.layer.masksToBounds = true
            return cell
        } else if collectionView == self.MAkeUpCollectionViewCell{
            let cell =  myMacaqup.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath) as! fourCollectionViewCell
            //            cell.nameLableInCollectionView.text = arrMakeupDetails[indexPath.row].name1
            cell.nameLableInCollectionView.text = arrMakeupDetails[indexPath.row].name1
            cell.instructionLabelInCollectionView.text =
            arrMakeupDetails[indexPath.row].instruction1
            cell.PriceLabelInCollectionView.text = arrMakeupDetails[indexPath.row].Price1
            cell.ImageViewINCollectionView.image = UIImage(named: arrmakeupImages[indexPath.row])
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.cornerRadius = 5
            cell.layer.masksToBounds = true
            cell.ADDButtonInCollectionView.layer.cornerRadius = 13
            cell.ADDButtonInCollectionView.layer.masksToBounds = true
            return cell
        } else {
            let cell: fiveCollectionViewcell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell5", for: indexPath) as! fiveCollectionViewcell
            cell.nameLableInCollectionView.text = arrBabyDetails[indexPath.row].name2
            cell.instructionLabelInCollectionView.text = arrBabyDetails[indexPath.row].instruction2
            cell.PriceLabelInCollectionView.text = arrBabyDetails[indexPath.row].price2
            cell.ImageViewINCollectionView.image = UIImage(named: arrBabyImages[indexPath.row])
            cell.layer.cornerRadius = 5
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.masksToBounds = true
            cell.ADDButtonInCollectionView.layer.cornerRadius = 17.5
            cell.ADDButtonInCollectionView.layer.masksToBounds = true
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension FirstTableViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.myCollectionCell{
            return CGSize(width: 398, height: 194)
        } else if collectionView == self.MyProdecCollectionView {
            return CGSize(width: 75, height: 120)
        } else if collectionView == self.OnionRangeCollectionView{
            return CGSize(width: 148, height: 237)
        } else if collectionView == self.MAkeUpCollectionViewCell{
            return CGSize(width: 148, height: 250)
        } else {
            return CGSize(width: 171, height: 265)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.MyProdecCollectionView{
            return 25
        } else if collectionView == self.OnionRangeCollectionView{
            return 20
        }else if collectionView == self.MAkeUpCollectionViewCell{
            return 20
        } else  if collectionView == self.BabycollectionViewCell{
            return 20
        } else {
            
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        
        if collectionView == self.MyProdecCollectionView{
            return 25
        } else if collectionView == self.OnionRangeCollectionView{
            return 20
        }else if collectionView == self.MAkeUpCollectionViewCell{
            return 20
        } else if collectionView == self.BabycollectionViewCell{
            return 20
        }else {
            return 0
        }
    }
}

