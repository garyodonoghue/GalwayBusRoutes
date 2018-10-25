//
//  TimetableInfoResponseModel.swift
//  GalwayBus
//
//  Created by Gary O'Donoghue on 18/02/2017.
//  Copyright © 2017 Gary O'Donoghue. All rights reserved.
//

import Foundation
import ObjectMapper

public class TimetableInfoResponseModel: Mappable {
    
    var timetable_id : String?
    var display_name : String?
    var depart_timestamp : String?
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        timetable_id <- map["timetable_id"]
        display_name <- map["display_name"]
        depart_timestamp <- map["depart_timestamp"]
    }
}
