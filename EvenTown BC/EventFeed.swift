//
//  EventFeed.swift
//  EvenTown BC
//
//  Created by Ricardo Lozano on 11/8/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit
import MapKit

class EventFeed: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIApplicationDelegate {
    
    lazy var  collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var events: [Event]?
    
    let cellId = "eventCellId"
    
    func fetchEvents()
    {
        ApiService.sharedInstance.fetchEvents { (events: [Event]) in
            self.events = events
            self.collectionView.reloadData()
            
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        fetchEvents()
        
        backgroundColor = .brown
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCellId", for: indexPath) as! EventCell
        cell.event = events?[indexPath.item]
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
        
        let event = events?[indexPath.item]
        
        navController = window?.rootViewController as! UINavigationController?
        
        let eventViewController = EventViewController()
        eventViewController.loadEventInfo(event: event!)
        eventViewController.view.backgroundColor = .white
        
        self.navController?.navigationBar.tintColor = UIColor.white
        self.navController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navController?.pushViewController(eventViewController, animated: true)
        
    }
    
}
