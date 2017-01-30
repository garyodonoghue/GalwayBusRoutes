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

public class StopsViewModel {

    private var stopTableView :  UITableView!
    public var stopsResponseModel : [StopsResponseModel] = []
    public var stopInfo : StopInfoResponseModel?
    
    public func getStops ( stopTableView : UITableView ){
        self.stopTableView = stopTableView;
        
        let requestModel = StopsRequestModel()
            
        Alamofire.request(requestModel.getStopsUrl()).validate().responseArray{ (response: DataResponse<[StopsResponseModel]>) in
                
            let stopsArray = response.result.value
            
            switch response.result {
            case .success( _):
                
            if let stopsArray = stopsArray {
                self.stopsResponseModel = stopsArray
            }
            
            self.stopTableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func getStopInfo ( stopRef : String, stopsTableView : UITableView, responseModel : StopsResponseModel){
        let requestModel = StopsRequestModel()
        
        Alamofire.request(requestModel.getStopsByStopRefUrl(stopRef: stopRef)).responseObject { (response: DataResponse<StopInfoResponseModel>) in
            
            let stopInfo = response.result.value
            
            switch response.result {
            case .success( _):
                if let stopInfo = stopInfo {
                    self.stopInfo = stopInfo
                    
                    responseModel.long_name = stopInfo.times?[0].timetable_id
                    stopsTableView.endUpdates()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
