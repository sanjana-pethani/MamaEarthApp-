//
//  CategroyViewController.swift
//  MamaEarthApp
//
//  Created by sanjana pethani on 11/03/23.
//

import UIKit

class CategroyViewController: UIViewController {

    @IBOutlet weak var secondContainer: UIView!
    @IBOutlet weak var segmentButton: UISegmentedControl!
    
    @IBOutlet weak var firstContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        handaleIndexOSegment(index: 0)
    }
    func handaleIndexOSegment(index: Int){
        switch index{
        case 0:
            firstContainerView.isHidden = false
            secondContainer.isHidden = true
        case 1:
            firstContainerView.isHidden = true
            secondContainer.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        handaleIndexOSegment(index: sender.selectedSegmentIndex)
    }
}
