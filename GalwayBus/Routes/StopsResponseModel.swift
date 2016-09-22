//
//  RoutesRequestModel.swift
//  
//
//  Created by Gary O'Donoghue on 12/09/2016.
//
//
import Foundation
import Stop

/* Sample response
 
 {
 "401": {
 "timetable_id": 401,
 "long_name": "Salthill - Eyre Square",
 "short_name": "Salthill"
 },
 "402": {
 "timetable_id": 402,
 "long_name": "Merlin Park - Eyre Square - Seacrest",
 "short_name": "Merlin Park - Seacrest"
 },
 
*/
class StopsResponseModel: Mappable {
 
    var timetable_id : String?
    var long_name : String?
    var short_name : String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        timetable_id <- map["timetable_id"]
        long_name <- map["long_name"]
        short_name <- map["short_name"]
    }
}
