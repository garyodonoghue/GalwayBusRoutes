//
//  RoutesRequestModel.swift
//  
//
//  Created by Gary O'Donoghue on 12/09/2016.
//
//
import Foundation

class RoutesRequestModel: NSObject {
   
    var responseString:NSString = "";
    
    func getRoutes(_ url: String, callback: (String, String?) -> Void) {
        let session = URLSession.shared;
        
        session.dataTask(with: URL(string: url)!) {(data, response, error) in
            print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
        }
    }
}
