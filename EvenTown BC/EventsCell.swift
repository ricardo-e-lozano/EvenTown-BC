//
//  EventView.swift
//  EvenTown BC
//
//  Created by Ricardo Lozano on 11/4/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class EventsCell: EventFeed {
        
    override func fetchEvents() {
        ApiService.sharedInstance.fetchEvents { (events: [Event]) in
            self.events = events
            self.collectionView.reloadData()
        }
    }
        
}
