//
//  StopsTableViewController.swift
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
    
    public var observableStops = PublishSubject<[StopsResponseModel]>()
    public var stopsArray = [StopsResponseModel]()
    
    public init(){
        getStops()
    }
    
    
    /// Get all stops - and update observableStops with the response value so that the tableView will react to 
    /// the response
    func getStops(){
        let requestModel = StopsRequestModel()
        
        Alamofire.request(requestModel.getStopsUrl()).validate().responseObject{ (response: DataResponse<StopsRootResponseModel>) in
            
            switch response.result {
                case .success( _):
                    let responseValue = response.result.value
                    
                    if let results = responseValue?.results {
                        results[0].rootNode = true
                        self.stopsArray = [results[0]]
                        self.observableStops.on(.next(self.stopsArray)) // FIXME: Adding single element
                    }
                
                case .failure(let error):
                    self.observableStops.on(.error(error))
            }
        }
    }
    
    
    /// Get stop specific information using a stopId. This will return an array containing the next arrival
    /// times for a particular stop.
    ///
    /// - Parameters:
    ///   - stopId: Stop id used to identify a specific stop
    ///   - successHandler: handler passed by the client used to handle a successful response. This is used by
    ///     tableView to react to the newly retrieved elements, and animating this insertion in the table view
    public func getStopInfo (stopId : String, successHandler : @escaping () -> Void){
        let requestModel = StopsRequestModel()
        
        Alamofire.request(requestModel.getStopsUrl()).validate().responseObject{ (response: DataResponse<StopsRootResponseModel>) in
            
            switch response.result {
                case .success( _):
                    let responseValue = response.result.value
                    
                    if let results = responseValue?.results {
                        results[0].rootNode = false
                        self.stopsArray.append(results[0])
                        self.observableStops.on(.next(self.stopsArray))
                        successHandler()
                    }
                    
                case .failure(let error):
                    self.observableStops.on(.error(error))
            }
        }
    }
}
