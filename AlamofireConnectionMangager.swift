//
//  AlamofireConnectionMangager.swift
//  GeekGuns
//
//  Created by Anup Gupta on 23/01/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireConnectionMangager {
    
    
//     static let sharedInstance = AlamofireConnectionMangager()
    
//    private init() {
        
//     }
    private static var _instance: AlamofireConnectionMangager?;
    
    private init() {
        
    }
    
    public static func getSingleton() -> AlamofireConnectionMangager {
        if (AlamofireConnectionMangager._instance == nil) {
            AlamofireConnectionMangager._instance = AlamofireConnectionMangager.init();
        }
        return AlamofireConnectionMangager._instance!;
    }
    
    func getDataFromServer( url: String , param : NSDictionary, success: @escaping (NSDictionary) -> () , failure: @escaping (Bool) -> () ) {
        
        
    Alamofire.request(url , method: .post, parameters: param as? [String: Any] , encoding: URLEncoding.default, headers: nil).responseJSON
            {
                (response:DataResponse<Any>) in
                
                print("response.request :", response.request as Any)
                print("response.response :", response.response as Any)
                print("response.result:", response.result as Any)
                print("response.value: ", response.value as Any)
                print("response.error:", response.error as Any)
                
                let StatusCode = response.response?.statusCode
                if response.result.isSuccess && StatusCode == 200{
                    
                    print("post data")
                    let dic : NSDictionary = response.value as! NSDictionary

                    success(dic)
                    
                }
                else{
                    print(response.error?.localizedDescription as Any)
                    let messageStr : String = (response.error?.localizedDescription)!
                    print("error message:::",messageStr)
                    failure(true)
                }
                
        }
        
    }
    
}


// This is Use Description
/*

AlamofireConnectionMangager.sharedInstance.getDataFromServer( url: urlSting , param : params as NSDictionary, success: {(responseResult) -> Void in
    
    print("responseResult :::",responseResult)
    print("Success")
 
}, failure:{(error) -> Void in
 
    if error {
        print("Somting went wrong")
    }
    self.showAlert(alertMessage: "Somthing went wrong")
    
}) */
