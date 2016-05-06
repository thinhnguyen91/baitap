//
//  Station.swift
//  Baitaplon
//
//  Created by ThinhNX on 5/6/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit
import MapKit
class Station: NSObject, MKAnnotation {

    var title: String?
    var subtitle: String?
    var latitude: Double
    var longitude:Double
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
