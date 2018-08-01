//
//  Constants.swift
//  Demo
//
//  Created by volive solutions on 01/08/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import Foundation
import UIKit

public class Constants{
    public static let BASE_URL                      =   "https://www.software.com/wordpress"
    
    public static let CONSUMER_KEY                  =   "ck_543700d9f8c08268d75d3efefb302df4fad70a8f"
    public static let CONSUMER_SECRET               =   "cs_f1514261bbe154d662eb5053880d40518367c901"
    
    public static let LOGIN_URL                     =   BASE_URL + "/wp-json/jwt-auth/v1/token"
    public static let REGISTRATION_DETAILS_URL      =   BASE_URL + "/wp-json/wc/v2/customers"
    public static let GET_PRODUCT_URL               =   BASE_URL + "/wp-json/wc/v2/products/"
    
    public static let ERROR_MESSAGE     =   "ErrorMessage"
    public static let EMAIL             =   "email"
    public static let USERNAME          =   "username"
    public static let PASSWORD          =   "password"
    public static let PHONE             =   "phone"
    public static let PRODUCT_ID        =   "productId"
    public static let CUSTOMER_ID       =   "user_id"
}
