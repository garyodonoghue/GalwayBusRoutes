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
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getRoutes()
            .bindTo(tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element.long_name)"
            }
            .addDisposableTo(disposeBag)
    }
}
