//
//  UserDefaultsHelper.swift
//  Responder
//
//  Created by Jeff Chimney on 2018-12-18.
//  Copyright © 2018 Jeff Chimney. All rights reserved.
//

import Foundation

class UserDefaultsHelper {
    
    static func set(loginString: String) {
        let defaults = UserDefaults.standard
        defaults.set(loginString, forKey: "loginString")
    }
    
    static func get(string forKey: String) -> String {
        let defaults = UserDefaults.standard
        let value = defaults.string(forKey: forKey)
        return value ?? ""
    }
}
