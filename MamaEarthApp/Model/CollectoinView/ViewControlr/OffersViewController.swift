//
//  ViewController.swift
//  MamaEarthApp
//
//  Created by sanjana pethani on 23/02/23.
//

import UIKit

class OffersViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    var arrImage: [String] = ["Screnshort 1","Screenshot 2","Screenshot 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
 }
   private func configureTableView() {
       let nibFile: UINib = UINib(nibName: "OfferTableViewCell", bundle: nil)
       TableView?.register(nibFile, forCellReuseIdentifier: "cell1")
       TableView.delegate = self
       TableView.dataSource = self
    }
    
}
extension OffersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImage.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OffersTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! OffersTableViewCell
        cell.IamagView.image = UIImage(named: arrImage[indexPath.row])
        return cell
}
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
}
