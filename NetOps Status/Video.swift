//
//  Video.swift
//  NetOps Status
//
//  Created by Ricardo Lozano on 10/13/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
    
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
