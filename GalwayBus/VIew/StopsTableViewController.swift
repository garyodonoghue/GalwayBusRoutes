//
//  StopsTableViewController.swift
//  
//
//  Created by Gary O'Donoghue on 06/09/2016.
//
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class StopsTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = StopsViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.observableStops.bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "StopsTableViewCell")! as! StopsTableViewCell
            cell.textLabel?.text = "\(element.shortname!) Stop no: \(element.stopid!)"
            cell.stopId = element.stopid
            
            if(element.rootNode){
                cell.backgroundColor = UIColor.darkGray
                cell.textLabel?.textColor = UIColor.white
                cell.textLabel?.backgroundColor = UIColor.darkGray
            }
            else{
                cell.backgroundColor = UIColor.white
                cell.textLabel?.textColor = UIColor.black
                cell.textLabel?.backgroundColor = UIColor.white
            }
            
            return cell
            }.disposed(by: disposeBag)
        
        self.tableView.rx.itemSelected.subscribe { index in
            let cell = self.tableView.cellForRow(at: index.element!) as! StopsTableViewCell
            
            self.tableView.beginUpdates()
            self.viewModel.getStopInfo(stopId: cell.stopId, successHandler: {
                self.tableView.insertRows(at: [index.element!], with: UITableViewRowAnimation.fade)
                self.tableView.endUpdates()

            })
            }.disposed(by: disposeBag)
        
    }
}
