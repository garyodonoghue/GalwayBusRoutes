//
//  StopInfoResponseModel.swift
//  GalwayBus
//
//  Created by Gary O'Donoghue on 18/02/2017.
//  Copyright © 2017 Gary O'Donoghue. All rights reserved.
//

import Foundation
import ObjectMapper

public class StopInfoResponseModel: Mappable {
    
    var stop : StopsResponseModel?
    var times : [TimetableInfoResponseModel]?
    
    /*
     
     Sample Request - http://galwaybus.herokuapp.com/stops/535201.json
     
     {
     "stop":{
     "short_name":"Barna",
     "long_name":"Barna (Garys Cycles)",
     "stop_id":8865,
     "stop_ref":"535201",
     "irish_short_name":"Bearna",
     "irish_long_name":"",
     "latitude":53.25176,
     "longitude":-9.14863
     },
     "times":[
     {
     "timetable_id":"424",
     "display_name":"Galway",
     "depart_timestamp":"2017-01-29T08:00:42.373Z",
     "low_floor":false
     },
     {
     "timetable_id":"424",
     "display_name":"Galway",
     "depart_timestamp":"2017-01-29T08:30:42.373Z",
     "low_floor":false
     },
     {
     "timetable_id":"424",
     "display_name":"Galway",
     "depart_timestamp":"2017-01-29T09:00:42.374Z",
     "low_floor":false
     }
     ]
     }
     
     */
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        stop <- map["stop"]
        times <- map["times"]
    }
}
