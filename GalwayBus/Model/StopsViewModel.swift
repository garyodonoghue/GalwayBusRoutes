//
//  RoutesTableViewController.swift
//  
//
//  Created by Gary O'Donoghue on 06/09/2016.
//
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import RxSwift
import RxDataSources

public class StopsViewModel{
    
    public var stopsArr : [String] = []
    private var stopTableView :  UITableView!
    
    public func createStopObservable ( stopTableView : UITableView ){
        var stops : [String] = []
        self.stopTableView = stopTableView;
        
        let requestModel = StopsRequestModel()
            
        Alamofire.request(requestModel.getRoutesUrl()).validate().responseArray{ (response: DataResponse<[StopsResponseModel]>) in
                
                let stopsArray = response.result.value
                
                switch response.result {
                case .success( _):
                    
                    if let stopsArray = stopsArray {
                        for stop in stopsArray {
                            //print(stop)
                            stops.append(stop.long_name!)
                            self.stopsArr.append(stop.long_name!)
                        }
                    }
                    
                    self.stopTableView.reloadData()
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
}
