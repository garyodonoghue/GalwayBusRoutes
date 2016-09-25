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
   
    let requestUrl = "http://galwaybus.herokuapp.com/routes";
    public var timetableId : Int = 0;
    
    
    public func getRoutesUrl() -> String{
        return "\(requestUrl).json";
    }
    
    public func getRoutesByTimetableIdUrl( timetableId : Int) -> String{
        return "\(requestUrl)/\(timetableId).json";
    }
}
