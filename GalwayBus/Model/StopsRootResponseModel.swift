//
//  StopsRootResponseModel.swift
//  GalwayBus
//
//  Created by Gary O'Donoghue on 25/02/2017.
//  Copyright © 2017 Gary O'Donoghue. All rights reserved.
//

import Foundation
import ObjectMapper


class StopsRootResponseModel: Mappable {

    var results : [StopsResponseModel]!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        results <- map["results"]
    }
}
