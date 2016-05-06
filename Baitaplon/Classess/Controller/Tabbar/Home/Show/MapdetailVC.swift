//
//  MapdetailVC.swift
//  Baitaplon
//
//  Created by ThinhNX on 5/5/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit
import MapKit
class MapdetailVC: UIViewController {
    @IBOutlet weak var mapdetailview: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //mapview
        
        let location = CLLocationCoordinate2D(
            latitude: 16.0755968,
            longitude: 108.2339355 )
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapdetailview.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Asia Tech,Đà Nẵng"
        annotation.subtitle = "Việt Nam"
        mapdetailview.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
