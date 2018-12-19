//
//  UserDefaultsHelper.swift
//  Responder
//
//  Created by Jeff Chimney on 2018-12-18.
//  Copyright © 2018 Jeff Chimney. All rights reserved.
//

import Foundation

class UserDefaultsHelper {
    
    static func set(firehallId: String) {
        let defaults = UserDefaults.standard
        defaults.set(firehallId, forKey: "firehallId")
    }
    
    static func set(userId: String) {
        let defaults = UserDefaults.standard
        defaults.set(userId, forKey: "userId")
    }
    
    static func get(string forKey: String) -> String {
        let defaults = UserDefaults.standard
        let value = defaults.string(forKey: forKey)
        return value ?? ""
    }
}
