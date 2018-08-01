//
//  SampleArray.swift
//  Demo
//
//  Created by volive solutions on 01/08/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import Foundation
class Product{
    
    var id:Int
    var name:String?
    var desc:String?
    var image:[String]
    var price:Int?
    
    init(id:Int, name:String?, desc:String?, image:[String], price:Int?)
    {
        self.id = id
        self.name = name
        self.desc = desc
        self.image = image
        self.price = price
    }
    
}
