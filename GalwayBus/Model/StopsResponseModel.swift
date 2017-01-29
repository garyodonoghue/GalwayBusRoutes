//
//  RoutesRequestModel.swift
//  
//
//  Created by Gary O'Donoghue on 12/09/2016.
//
//
import Foundation
import ObjectMapper

/* Sample response
 
 [{
	"long_name": "Clydagh Bridge (Eastbound)",
	"stop_id": 8788,
	"stop_ref": "532211",
	"irish_long_name": "",
	"latitude": 53.32686,
	"longitude": -9.16784
 }, {
	"long_name": "Clydagh Bridge (Westbound)",
	"stop_id": 8747,
	"stop_ref": "531651",
	"irish_long_name": "",
	"latitude": 53.32664,
	"longitude": -9.16774
 }, {
 
*/
public class StopsResponseModel: Mappable {
 
    var long_name : String?
    var stop_id : Int?
    var stop_ref : String?
    var irish_long_name : String?
    var latitude : Decimal?
    var longitude : Decimal?
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        long_name <- map["long_name"]
        stop_id <- map["stop_id"]
        stop_ref <- map["stop_ref"]
        irish_long_name <- map["irish_long_name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
