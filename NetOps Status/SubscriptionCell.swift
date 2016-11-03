//
//  SubscriptionCell.swift
//  NetOps Status
//
//  Created by Ricardo Lozano on 11/3/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {

    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }

}
