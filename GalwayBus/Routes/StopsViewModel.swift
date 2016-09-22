//
//  RoutesTableViewController.swift
//  
//
//  Created by Gary O'Donoghue on 06/09/2016.
//
//

import UIKit
import AlamofireObjectMapper
import StopsResponseModel

// class should expose prmitive objects to the view controller for binding to the view
class StopsViewModel{

    var routes = String[]
    
    func getRoutes(){
        let requestModel = StopsRequestModel()
        
        Alamofire.request(requestModel.requestUrl).validate().responseJSON { (response: Response<[StopsResponseModel], NSError>) in
            
            switch response.result {
            case .success( _):
                let stopsArray = response.result.value
                
                if let stopsArray = stopsArray {
                    for stop in stopsArray {
                        print(stop.timetable_id)
                        routes.append(stop.timetable_id)
                    }
                }
                
            // format response array into an array of strings representing all the stops
            case .failure(let error):
                print(error)
            }
        }
    }
}
