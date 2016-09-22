//
//  RoutesRequestModel.swift
//  
//
//  Created by Gary O'Donoghue on 12/09/2016.
//
//
import Foundation
import Alamofire

class StopsRequestModel: NSObject {
   
    let requestUrl = "http://galwaybus.herokuapp.com/routes";
    public var timetableId : Int;
    
    
    public func getRoutesUrl(){
        return requestUrl + ".json";
    }
    
    public func getRoutesByTimetableIdUrl( timetableId : int){
        return requestUrl + "/" + timetableId + ".json";
    }
}
