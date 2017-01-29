//
//  RoutesRequestModel.swift
//  
//
//  Created by Gary O'Donoghue on 12/09/2016.
//
//
import Foundation
import Alamofire

class StopsRequestModel {
   
    let requestUrl = "http://galwaybus.herokuapp.com/stops";
    public var timetableId : Int = 0;
    
    
    public func getStopsUrl() -> String{
        return "\(requestUrl).json";
    }
    
    public func getStopsByStopRefUrl(stopRef : String) -> String{
        return "\(requestUrl)/\(stopRef).json";
    }
    
    public func getRoutesByTimetableIdUrl( timetableId : Int) -> String{
        return "\(requestUrl)/\(timetableId).json";
    }
}
