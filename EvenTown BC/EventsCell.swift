//
//  EventView.swift
//  EvenTown BC
//
//  Created by Ricardo Lozano on 11/4/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class EventsCell: FeedCell {
        
    override func fetchVideos() {
        ApiService.sharedInstance.fetchEventsFeed { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
        
}
