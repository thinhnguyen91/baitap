//
//  MapVC.swift
//  Baitaplon
//
//  Created by ThinhNX on 4/26/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit
import MapKit
class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "MAP"
        self.navigationController?.navigationBar.barTintColor = uicolorFromHex(16729344)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        // map
        zoomToRegion()
        let annotations = getMapAnnotations()
        // Add mappoints to Map
        mapView.addAnnotations(annotations)
    }
    
    //MARK:- Zoom to region
    
    func zoomToRegion() {
        
        let location = CLLocationCoordinate2D(latitude: 16.0718911, longitude: 108.2228753)
        //let region = MKCoordinateRegionMakeWithDistance(location, 5000.0, 7000.0)
        let span = MKCoordinateSpanMake(0.05, 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func getMapAnnotations() -> [Station] {
        var annotations:Array = [Station]()
        
        //load plist file
        var stations: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("stations", ofType: "plist") {
            stations = NSArray(contentsOfFile: path)
        }
        
        //iterate and create annotations
        if let items = stations {
            for item in items {
                let lat = item.valueForKey("lat") as! Double
                let long = item.valueForKey("long")as! Double
                let annotation = Station(latitude: lat, longitude: long)
                annotation.title = item.valueForKey("title") as? String
                annotation.subtitle = item.valueForKey("subtitle") as? String
                annotations.append(annotation)
            }
        }
        
        return annotations
    }
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
 
}

extension MapVC: MKMapViewDelegate {
    
}
