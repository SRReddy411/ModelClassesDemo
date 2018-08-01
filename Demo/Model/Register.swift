//
//  Register.swift
//  Demo
//
//  Created by volive solutions on 01/08/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import Foundation
import UIKit

class RegisterUserData: NSObject {
    
    var email : String!
    var mobileNo : String!
    var emailverified : Bool!
    var numberverified : Bool!
    var casteID : String!
    var casteName : String!
    var custID : Int!
    var dateOfBirth : String!
    var familyID: Int!
    var firstName : String = ""
    var custName : String = ""
    var paidStatus: Int!
    var gender: Int!
    var profileId: String!
    //    var email : String!
    //    var teamid: String!
    //    var teamInviteStatusStr: String!
    //    var team_matches_played = ""
    //    var team_typeId = ""
    //    var team_lat = ""
    //    var team_long = ""
    //    var team_chat_id = ""
    
    init(data : NSDictionary) {
        // print(" data %@", data)
        if let _email = data["email"]{
            self.email = _email as! String
            //print("uesrname%@", _email)
        }
        
        if let _userDesc = data["DateOfBirth"]{
            self.dateOfBirth = _userDesc as! String
        }
        
        if let _userImage = data["FamilyID"]{
            self.familyID = _userImage as! Int
        }
        
        if let _teamSize = data["CasteName"]{
            self.casteName = _teamSize as! String
        }
        
        if let _teamSize = data["isnumberverifed"]{
            self.numberverified = _teamSize as! Bool
            print(numberverified)
        }
        
        if let _teamSize = data["isemailverified"]{
            self.emailverified = _teamSize as! Bool
        }
        
        if let _teamSize = data["CustID"]{
            self.custID = _teamSize as! Int
        }
        
        if let _teamSize = data["PaidStatus"]{
            self.paidStatus = _teamSize as! Int
        }
        
        if let _teamSize = data["GenderID"]{
            self.gender = _teamSize as! Int
        }
        if let _teamSize = data["ProfileID"]{
            self.profileId = _teamSize as! String
        }
        
        
        
    }
}

class RegisterUserDetails: NSObject {
    
    var allList : [RegisterUserData] = []
    
    func updateData(_ data : NSArray) {
        let _tempArray = NSMutableArray()
        for _sport in data{
            let _s = _sport as! NSDictionary
            _tempArray.add(RegisterUserData(data: _s))
        }
        self.allList = _tempArray.mutableCopy() as! [RegisterUserData]
    }
    
    
}
