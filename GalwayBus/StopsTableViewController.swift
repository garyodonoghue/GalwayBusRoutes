//
//  RoutesTableViewController.swift
//  
//
//  Created by Gary O'Donoghue on 06/09/2016.
//
//

import UIKit
import RxSwift
import RxDataSources

class StopsTableViewController: ViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = StopsViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let routes = viewModel.getRoutes()
        
        routes
            .bindTo(tableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "StopsTableViewCell")!
                cell.textLabel?.text = "\(element)"
                return cell
            }
            .addDisposableTo(disposeBag)
    }
}
