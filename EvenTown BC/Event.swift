//
//  Event.swift
//  EvenTown BC
//
//  Created by Ricardo Lozano on 11/7/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class Event: SafeJsonObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var upload_date: NSDate?
    var duration: NSNumber?
    
    var publisher: Publisher?
    var location: EventLocation?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "publisher" {
            //custom channel setup
            self.publisher = Publisher()
            publisher?.setValuesForKeys(value as! [String: Any])
        } else if key == "location" {
            self.location = EventLocation()
            location?.setValuesForKeys(value as! [String: Any])
        } else {
            super.setValue(value, forKey: key)
        }
        
    }
    
    init(dictionary: [String: Any]) {
        super.init()
        setValuesForKeys(dictionary)
    }
    
}

class Publisher: SafeJsonObject {
    var name: String?
    var profile_image_name: String?
}

class EventLocation: SafeJsonObject {
    var address: String?
    var location_name: String?
    var type: String?
    var latitude: NSNumber?
    var longitude: NSNumber?
}
