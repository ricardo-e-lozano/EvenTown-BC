//
//  EventViewController.swift
//  EvenTown BC
//
//  Created by Ricardo Lozano on 11/4/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit
import MapKit

class EventViewController: UIViewController, MKMapViewDelegate {

    let eventImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let eventTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        
        return label
    }()
    
    var eventLocation:CLLocation = {
        let location = CLLocation(latitude: 21.282778, longitude: -157.829444)
        return location
    }()
    
    let mapView: MKMapView = {
        let map = MKMapView()
        
        return map
    }()


    func setEventImage(imageUrl: String)
    {
        eventImage.loadImageUsingUrlString(urlString: imageUrl)
    }
    func setTitleLabel(title: String) {
        eventTitleLabel.text = title
    }
    func setEventLocation(location: CLLocation)
    {
        eventLocation = location
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupEventView()

        mapView.delegate = self

    
    }
    
    let eventView: EventsCell = {
        let view = EventsCell()
        
        return view
    }()
    
    func setupEventView() {
        
//        view.addSubview(eventView)
//        let width = view.frame.width
        let height = view.frame.width * 9 / 16
        view.addSubview(eventImage)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: eventImage)
        
        view.addSubview(eventTitleLabel)
        view.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: eventTitleLabel)
        
        view.addSubview(mapView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: mapView)
        
        view.addConstraintsWithFormat(format: "V:|[v0(\(height))]-8-[v1(44)]-8-[v2(\(height*2))]", views: eventImage, eventTitleLabel, mapView)
        
        centerMapOnLocation(location: eventLocation)

    }
    
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
   
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Artwork {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Artwork
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }


}
