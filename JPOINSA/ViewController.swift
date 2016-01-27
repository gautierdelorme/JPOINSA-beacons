//
//  ViewController.swift
//  JPOINSA
//
//  Created by Gautier Delorme on 26/01/16.
//  Copyright © 2016 gautierdelorme. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BeaconManagerDelegate, UITableViewDelegate {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        BeaconManager.sharedInstance.delegate = self
        
        self.title = "INSA Toulouse - GEI"
        if let navigationController = self.navigationController {
            navigationController.navigationBar.barTintColor = UIColor.insaRed()
        }
        view.backgroundColor = UIColor.insaBlack()
        
        tableView = PresentationsTable(frame: CGRectMake(0, PresentationCell.margin, self.view.bounds.width, self.view.bounds.height-PresentationCell.margin), delegate: self)
        
        self.view.addSubview(tableView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        BeaconManager.sharedInstance.startRangingBeacons()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        BeaconManager.sharedInstance.stopRangingBeacons()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    // MARK: - BeaconManagerDelegate
    
    func didEnterInRegion(identifier: String) {
        self.tableView.reloadData()
        switch identifier {
        case "firstFloor":
            self.title = "INSA Toulouse - GEI - Niveau 0"
        case "secondFloor":
            self.title = "INSA Toulouse - GEI - Niveau 1"
        case "thirdFloor":
            self.title = "INSA Toulouse - GEI - Niveau 2"
        default:
            self.title = "INSA Toulouse - GEI"
        }
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        tableView.frame = CGRectMake(0, PresentationCell.margin, self.view.bounds.width, self.view.bounds.height-2*PresentationCell.margin)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

