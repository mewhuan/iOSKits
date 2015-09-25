//
//  MyPin.swift
//  Around
//
//  Created by Dong Li on 9/25/15.
//  Copyright © 2015 Dong Li. All rights reserved.
//

import MapKit
import UIKit

class MyPin: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }
}