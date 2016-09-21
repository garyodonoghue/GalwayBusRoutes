//
//  RoutesRequestModel.swift
//  
//
//  Created by Gary O'Donoghue on 12/09/2016.
//
//
import Foundation
import SwiftyJSON
import Alamofire

class RoutesRequestModel: NSObject {
   
    var routesArr:[JSON] = []
    
    func getRoutes(_ url: String) {
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
                case .success( _):
                    print("JSON: \(response)")
                case .failure(let error):
                    print(error)
            }
        }
    }
}
