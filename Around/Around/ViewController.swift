//
//  ViewController.swift
//  Around
//
//  Created by Dong Li on 9/25/15.
//  Copyright © 2015 Dong Li. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var buttonHotel: UIButton!
    @IBOutlet weak var buttonShop: UIButton!
    @IBOutlet weak var buttonHosp: UIButton!
    var opened = false
    let initialLocation = CLLocation(latitude: 40.758895, longitude: -73.985131)
    let searchRadius: CLLocationDistance = 4000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainButton.alpha = 1
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {() -> Void in
            self.mainButton.alpha = 1
            self.mainButton.transform = CGAffineTransformMakeRotation(0.25*3.1415927)
        }, completion: nil)
        self.buttonHotel.alpha = 0
        self.buttonHosp.alpha = 0
        self.buttonShop.alpha = 0
        self.buttonHosp.layer.cornerRadius = 10
        self.buttonHotel.layer.cornerRadius = 10
        self.buttonShop.layer.cornerRadius = 10
        
        let region = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, searchRadius, searchRadius)
        mapView.setRegion(region, animated: true)
        searchMap("place")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonHotelClick(sender: UIButton) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("hotal")
        reset()
    }
    @IBAction func buttonShopClick(sender: UIButton) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("supermarket")
        reset()
    }
    @IBAction func buttonHospClick(sender: UIButton) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("hospital")
        reset()
    }
    func reset() {
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {() -> Void in
            self.mainButton.transform = CGAffineTransformMakeRotation(0.25*3.1415927)
            self.buttonHotel.alpha = 0
            self.buttonHosp.alpha = 0
            self.buttonShop.alpha = 0
            self.buttonHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeTranslation(0, 0))
            self.buttonHosp.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeTranslation(0, 0))
            self.buttonShop.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeTranslation(0, 0))
            }, completion: nil)
        opened = false
    }
    
    func addLocation(title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MyPin(coordinate: location, title: title)
        mapView.addAnnotation(annotation)
    }
    
    func searchMap(place: String) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = place
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center: initialLocation.coordinate, span: span)
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler { (response: MKLocalSearchResponse?, error: NSError?) -> Void in
            for item in response!.mapItems {
                self.addLocation(item.name!, latitude: item.placemark.location!.coordinate.latitude, longitude: item.placemark.location!.coordinate.longitude)
            }
        }
        
    }

    @IBAction func mainButtonClick(sender: UIButton) {
        if opened {
            reset()
        } else {
            UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.mainButton.transform = CGAffineTransformMakeRotation(0)
                self.buttonHotel.alpha = 0.7
                self.buttonHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5, 1.5), CGAffineTransformMakeTranslation(-80, -25))
                self.buttonHosp.alpha = 0.7
                self.buttonHosp.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5, 1.5), CGAffineTransformMakeTranslation(0, -50))
                self.buttonShop.alpha = 0.7
                self.buttonShop.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5, 1.5), CGAffineTransformMakeTranslation(80, -25))
                }, completion: nil)
            opened = true
        }
    }

}

