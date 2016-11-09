//
//  FeedCell.swift
//  NetOps Status
//
//  Created by Ricardo Lozano on 10/31/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit
import MapKit

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIApplicationDelegate {
    
    lazy var  collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var videos: [Video]?

    let cellId = "cellId"
    
    func fetchVideos()
    {
        ApiService.sharedInstance.fetchVideos { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
            
        }
    }

    override func setupViews() {
        super.setupViews()
        
        fetchVideos()
        
        backgroundColor = .brown
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9/16
        return CGSize(width: frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    var navController: UINavigationController?
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let videoLauncher = VideoLauncher()
        videoLauncher.showVideoPlayer()
        
        
//        let video = videos?[indexPath.item]
//        
//        navController = window?.rootViewController as! UINavigationController?
//        
//        let eventViewController = EventViewController()
//        let title = (video?.title)! as String
//        let eventImageURL = (video?.thumbnail_image_name)! as String
//        let hostName = (video?.channel?.name)! as String
//        let eventType = "Birthday Party"
//        let eventAddress = "Bosque del Pino 444, Bosques del Sol, Mexicali, BC"
//        let eventLocation = CLLocation(latitude: 32.6312, longitude: -115.3861)
//        let eventAnnotation = Artwork(title: title, locationName: hostName, discipline: eventType, coordinate: eventLocation.coordinate)
//        
//        
//        eventViewController.navigationItem.title = title
//        eventViewController.eventImage.loadImageUsingUrlString(urlString: eventImageURL)
//        eventViewController.eventTitleLabel.text = title
//        eventViewController.eventTypeLabel.text = eventType
//        eventViewController.eventLocationLabel.text = eventAddress
//        eventViewController.eventLocation = eventLocation
//        eventViewController.mapView.addAnnotation(eventAnnotation)
//        
//        eventViewController.view.backgroundColor = .white
//        
//        self.navController?.navigationBar.tintColor = UIColor.white
//        self.navController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
//        self.navController?.pushViewController(eventViewController, animated: true)
//
        
        
        


        
        
        
        
        
        
    }
    
}





