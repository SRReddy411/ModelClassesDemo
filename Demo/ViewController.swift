//
//  ViewController.swift
//  Demo
//
//  Created by volive solutions on 01/08/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NetworkDelegate {
    
    var productDetails:[Product] = []
    var UserDataArray                      = NSArray()
    var DisplayAllUserData                 = RegisterUserDetails()
    var registrationDetailsDict = [String:Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("age data count :\( Helper.sharedInstance.ageToData.count)")
        Helper.sharedInstance.delegate = self
        
        //Response added to 
        //self.DisplayAllUserData.updateData(self.UserDataArray)
        print(Helper.sharedInstance.getReligionId(title: "1"))
        Helper.sharedInstance.registrationDetails(input: registrationDetailsDict)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func successResponse(response: Any, ForRequestType requestType: Int) {
        print("successresponse")
    }
    func failureResponse(response: Any, ForRequestType requestType: Int) {
        print("failureresponse")
    }
    
}

