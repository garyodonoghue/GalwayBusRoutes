//
//  StopsRequestModel.swift
//  
//
//  Created by Gary O'Donoghue on 12/09/2016.
//
//
import Foundation
import ObjectMapper

/*
 
 Response from getting a list of all stops
 
 Request URL:
 https://data.dublinked.ie/cgi-bin/rtpi/busstopinformation?format=json&stopid=2
 
 Response:
 {
	"errorcode": "0",
	"errormessage": "",
	"numberofresults": 10139,
	"timestamp": "25\/02\/2017 15:17:27",
	"results": [{
         "stopid": "2",
         "displaystopid": "2",
         "shortname": "Parnell Square",
         "shortnamelocalized": "Cearnóg Parnell",
         "fullname": "Parnell Square",
         "fullnamelocalized": "",
         "latitude": "53.35224111",
         "longitude": "-6.263695",
         "lastupdated": "20\/02\/2017 10:12:21",
         "operators": [{
         "name": "bac",
         "routes": ["46A", "46E", "38", "38D", "38A", "38B"]
    }]
}
 
 
 Example resopnse getting real time stop info for stopId 2
 
 Request URL: 
 https://data.dublinked.ie/cgi-bin/rtpi/realtimebusinformation?stopid=2&format=json
 
 Response:
 {
	"errorcode": "0",
	"errormessage": "",
	"numberofresults": 9,
	"stopid": "2",
	"timestamp": "26\/02\/2017 13:21:53",
	"results": [{
         "arrivaldatetime": "26\/02\/2017 13:25:07",
         "duetime": "3",
         "departuredatetime": "26\/02\/2017 13:25:07",
         "departureduetime": "3",
         "scheduledarrivaldatetime": "26\/02\/2017 13:10:00",
         "scheduleddeparturedatetime": "26\/02\/2017 13:10:00",
         "destination": "Phoenix Pk",
         "destinationlocalized": "Prc an Fhionnuisce",
         "origin": "Crofton Road",
         "originlocalized": "Crofton Road",
         "direction": "Inbound",
         "operator": "bac",
         "additionalinformation": "",
         "lowfloorstatus": "no",
         "route": "46A",
         "sourcetimestamp": "26\/02\/2017 13:19:39",
         "monitored": "true"
    }
 }
 
 */

class StopsResponseModel: Mappable {
 
    var fullname : String?
    var stopid : String?
    var shortname : String?
    var longitude : String?
    var latitude : String?
    var duetime : String?
    var rootNode : Bool! = false // default to being a header row, accordian children rows will have this set to false
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        fullname <- map["fullname"]
        shortname <- map["shortname"]
        longitude <- map["longitude"]
        latitude <- map["latitude"]
        stopid <- map["stopid"]
        duetime <- map["duetime"]
    }
}
