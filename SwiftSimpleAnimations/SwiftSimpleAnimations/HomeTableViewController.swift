//
//  HomeTableViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/4/7.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var dataSource:[String] = []        // dataSource
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // set DataSource
        dataSource = ["buttonMoveView", "TurnAroundView", "PlaneSportView", "FrameAnimiation", "GhostFireAnimation", "VolumeBeatView", "CircleAnimateView"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    // cell section
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // cell row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    // cell content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataSource[indexPath.row]

        return cell
    }
 
    // cell click
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: dataSource[indexPath.row], sender: dataSource[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
       
        if segue.identifier == "PlaneSportView" {
            let planeSportVC = viewController as! PlaneSportViewController
            planeSportVC.titleStr = "飞机停机"
        }
    }

}
