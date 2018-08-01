//
//  Helper.swift
//  Demo
//
//  Created by volive solutions on 01/08/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit
public protocol NetworkDelegate{
    
    /// Called when request is sent to server successfully
    ///
    /// - Parameters:
    ///   - response: Success response which is coming from server
    ///   - requestType: Type of request
    func successResponse(response:Any, ForRequestType requestType:Int)
    
    /// Called when request is failed
    ///
    /// - Parameters:
    ///   - response: Failure response which is coming from server
    ///   - requestType: Type of request
    func failureResponse(response:Any, ForRequestType requestType:Int)
}

enum RequestType : Int
{
    case SIGNUP_REQ
    case GETPRODUCTS_REQ
    case REGISTRATIONDETAILS_REQ
}
class Helper: NSObject {
    static let sharedInstance = Helper()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    public var delegate:NetworkDelegate?
    
    /// age information in the form of array
    var ageToData: [String]   = ["18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77"]
    
    /// Called when user select gender option
    ///
    /// - Parameters:
    ///   - male: if sender select gender
    ///   - female:if sender select gender
    /// - Returns:  int value
    func getgenderValue(male: Bool,female: Bool)->Int{
        
        if female {
            return 2
            //print("female is selected")
        }else if male{
            return 1
        }else{
            return 0
        }
    }

    func getReligionId(title:String) -> String {
        switch title {
        case "0":
            return "--select--"
        case "1":
            return "Hindu"
        case "2":
            return "Christian"
        case "3":
            return "Muslim"
        case "6":
            return "Other"
        case "9":
            return "Catholic"
        case "15":
            return "Roma Catholic"
        case "16":
            return "ROMAN CATHOLIC"
        default:
            return ""
        }
    }
    
    /// Called when user register
    ///
    /// - Parameter input: input parameters for register
    
    public func registrationDetails(input:[String:Any]){
        self.postRequestToServer(urlString: Constants.REGISTRATION_DETAILS_URL, input: input as NSDictionary, forType: RequestType.REGISTRATIONDETAILS_REQ.rawValue)
    }
    public func getAllProducts(){
        appDelegate.activityIndicatorStart()
        self.getRequestToServer(urlString:Constants.GET_PRODUCT_URL, input: [:], forType:RequestType.GETPRODUCTS_REQ.rawValue)
    }
    //MARK: - Post Request
    
    /// Used to send data to server
    ///
    /// - Parameters:
    ///   - urlString: url for sending data to server
    ///   - input: input data which is send to server
    ///   - type: type of request to server
    internal func postRequestToServer(urlString:String, input:NSDictionary, forType type: Int){
        
        do {
            if(JSONSerialization.isValidJSONObject(input)){
                let loginString = String(format: "%@:%@", Constants.CONSUMER_KEY, Constants.CONSUMER_SECRET)
                let loginData = loginString.data(using: String.Encoding.utf8)!
                let base64LoginString = loginData.base64EncodedString()
                
                let requestUrl = URL(string:urlString)! as URL
                let request = NSMutableURLRequest(url: requestUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
                request.httpMethod = "POST"
                request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
                // if(!input.isEmpty){
                
                let inputData = try JSONSerialization.data(withJSONObject: input, options: JSONSerialization.WritingOptions.prettyPrinted) as Data
                request.httpBody = inputData
                // }
                let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                    if data != nil{
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                            print("json data:\(json)")
                            DispatchQueue.main.async(execute: {
                                self.delegate?.successResponse(response:json as! [String : Any], ForRequestType: type)
                                self.appDelegate.activityIndicatorStop()
                                
                            })
                        }
                        catch {
                            
                        }
                    }
                    else{
                        let errorMessage = [Constants.ERROR_MESSAGE :"Some thing went wrong, Please try agaain"]
                        DispatchQueue.main.async(execute: {
                            self.delegate?.failureResponse(response:errorMessage, ForRequestType: type)
                            self.appDelegate.activityIndicatorStop()
                        })
                        print("no response")
                    }
                })
                task.resume()
            }
            else{
                
                let errorMessage = [Constants.ERROR_MESSAGE:"Invalid input"]
                self.delegate?.failureResponse(response:errorMessage, ForRequestType: type)
                self.appDelegate.activityIndicatorStop()
                
            }
        }
        catch{
            print("error")
        }
    }
    //MARK: - Get Request
    
    /// Used to get data from server
    ///
    /// - Parameters:
    ///   - urlString: url for getting data from server
    ///   - input: input data which used to get data from server
    ///   - type: type of request to server
    internal func getRequestToServer(urlString:String, input:[String:Any], forType type: Int){
        print("getRequestToServer:\(urlString)")
        
        do {
            if(JSONSerialization.isValidJSONObject(input)){
                let loginString = String(format: "%@:%@", Constants.CONSUMER_KEY, Constants.CONSUMER_SECRET)
                let loginData = loginString.data(using: String.Encoding.utf8)!
                let base64LoginString = loginData.base64EncodedString()
                
                // create the request
                
                let url = URL(string: urlString)!
                print(("uf:\(String(describing: url))"))
                let request = NSMutableURLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
                request.httpMethod = "GET"
                request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
                
                if(!input.isEmpty){
                    let inputData = try JSONSerialization.data(withJSONObject: input, options: JSONSerialization.WritingOptions.prettyPrinted) as Data
                    request.httpBody = inputData
                }
                
                let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                    if data != nil{
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                            print("json:\(json)")
                            DispatchQueue.main.async(execute: {
                                self.delegate?.successResponse(response: json, ForRequestType: type)
                                self.appDelegate.activityIndicatorStop()
                            })
                        }
                        catch {
                            
                        }
                    }
                    else{
                        print("no response")
                        let errorMessage = [Constants.ERROR_MESSAGE :"Some thing went wrong, Please try again"]
                        self.delegate?.failureResponse(response:errorMessage, ForRequestType: type)
                        self.appDelegate.activityIndicatorStop()
                    }
                })
                task.resume()
            }
            else{
                let errorMessage = [Constants.ERROR_MESSAGE:"Invalid input"]
                self.delegate?.failureResponse(response:errorMessage, ForRequestType: type)
                self.appDelegate.activityIndicatorStop()
            }
        }
        catch{
            print("error")
        }
    }
}
 
