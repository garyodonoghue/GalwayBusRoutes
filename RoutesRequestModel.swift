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
    
    func getRoutes(request: String, callback: (String, String?) -> Void) {
        
        let url:NSURL = NSURL(string: request)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        
        let task = session.dataTaskWithRequest(request) {
            (
            let data, let response, let error) in
            
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(dataString)
            self.responseString = dataString!
        }
        task.resume()    
    }
}
