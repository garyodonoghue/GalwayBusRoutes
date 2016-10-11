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

class StopsViewModel{
    
    var routes: [String] = []
    
    func getRoutes(){
        
        let requestModel = StopsRequestModel()
        
        Alamofire.request(requestModel.getRoutesUrl()).validate().responseArray{ (response: DataResponse<[StopsResponseModel]>) in
            
            let stopsArray = response.result.value
            
            switch response.result {
            case .success( _):
                
                if let stopsArray = stopsArray {
                    for stop in stopsArray {
                        print(stop.long_name!)
                        self.routes.append(stop.long_name!)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    
    }
}
