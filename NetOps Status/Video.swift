//
//  Video.swift
//  NetOps Status
//
//  Created by Ricardo Lozano on 10/13/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class SafeJsonObject: NSObject {
    override func setValue(_ value: Any?, forKey key: String) {
        let uppercasedFirstCharacter = String(key.characters.first!).uppercased()
        
//        let range = Range(uncheckedBounds: (key.startIndex, key.index(key.startIndex, offsetBy: 1)))
//        let selectorString = key.replacingCharacters(in: range, with: uppercasedFirstCharacter)
        
        let range = NSMakeRange(0, 1)
        let selectorString = NSString(string: key).replacingCharacters(in: range, with: uppercasedFirstCharacter)
        
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        if !responds {
            return
        }
        super.setValue(value, forKey: key)
    }
}

class Video: SafeJsonObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var upload_date: NSDate?
    var duration: NSNumber?
    
    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" {
            //custom channel setup
            self.channel = Channel()
            channel?.setValuesForKeys(value as! [String: Any])
        } else {
            super.setValue(value, forKey: key)    
        }
        
    }
    
    init(dictionary: [String: Any]) {
        super.init()
        setValuesForKeys(dictionary)
    }
    
}

class Channel: SafeJsonObject {
    var name: String?
    var profile_image_name: String?
}
