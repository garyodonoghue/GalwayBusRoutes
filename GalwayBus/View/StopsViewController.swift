//
//  StopsTableViewController.swift
//  GalwayBus
//
//  Created by Gary O'Donoghue on 11/10/2016.
//  Copyright © 2016 Gary O'Donoghue. All rights reserved.
//
import UIKit

class StopsViewController: UITableViewController {
    
    @IBOutlet var stopsTableView: UITableView!
    var stopsViewModel = StopsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopsViewModel.getStops(stopTableView: self.stopsTableView)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stopsViewModel.stopsResponseModel.count
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 51
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StopsTableViewCell", for: indexPath) as? StopsTableViewCell
        
        cell?.stopName?.text = stopsViewModel.stopsResponseModel[indexPath.row].long_name
        cell?.stopRef = stopsViewModel.stopsResponseModel[indexPath.row].stop_ref!
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        stopsViewModel.getStopInfo(stopRef : stopsViewModel.stopsResponseModel[indexPath.row].stop_ref!)
    }
}
