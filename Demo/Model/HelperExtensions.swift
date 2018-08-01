//
//  HelperExtensions.swift
//  Demo
//
//  Created by volive solutions on 01/08/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showToast(message : String) {
        
        let message = message
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        self.present(alert, animated: true)
        
        // duration in seconds
        let duration: Double = 2
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
}
}
