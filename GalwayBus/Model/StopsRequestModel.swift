//
//  StopsRequestModel.swift
//  
//
//  Created by Gary O'Donoghue on 12/09/2016.
//
//
import Foundation
import Alamofire

class StopsRequestModel {
   
    let requestUrl = "https://secret-peak-29776.herokuapp.com/routes";
    public var timetableId : Int = 0;
    
    
    public func getStopsUrl() -> String{
        return "\(requestUrl)";
    }
    
    // TODO change to use realtimebusinformation and update method name
    public func getRealTimeStopInfoUrl( stopId : String) -> String{
        return "\(requestUrl)&stopid=\(stopId)";
    }
}
