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
        
        dataSource.configureCell = { table, indexPath, user in
            let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            let string = "\(user.screenName) is following \(user.followingCount) users and is followed by \(user.followersCount) users."
            cell.textLabel?.text = string
            cell.textLabel?.numberOfLines = 0
            cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.whiteColor() : UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            return cell
        }
        
        viewModel.getRoutes()
            .bindTo(tableView.rx.items(dataSource))
            .addDisposableTo(disposeBag)
    }
}
