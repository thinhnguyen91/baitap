//
//  List.swift
//  Baitaplon
//
//  Created by ThinhNX on 4/27/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit
import MapKit
class Place: NSObject, MKAnnotation{
   
    var avatar: String = ""
    var start: String = ""
    
    var image: UIImage?
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    var index = 0
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    

    var subtitle: String? {
        return locationName
    }
}
