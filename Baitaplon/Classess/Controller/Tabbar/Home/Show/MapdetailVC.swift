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
    var place: Place!
    var mypapvc: MapVC!
    var myshow: ShowVC!
    var myhome: HomeVC!
    var btn = UIButton()
    @IBOutlet weak var mapdetailview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MapdetailVC"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "MarkerFelt-Thin", size: 20)!,
            NSForegroundColorAttributeName: UIColor.whiteColor()]
         //custom button
        btn.setImage(UIImage(named: "backhome"), forState: .Normal)
        btn.frame = CGRectMake(0, 0, 25, 25)
        btn.addTarget(self, action: Selector("backhome:"), forControlEvents: .TouchUpInside)
        let item = UIBarButtonItem()
        item.customView = btn
        self.navigationItem.rightBarButtonItem = item
        self.navigationItem.rightBarButtonItem!.setTitleTextAttributes([
            NSFontAttributeName : UIFont(name: "MarkerFelt-Thin", size: 15)!],
            forState: UIControlState.Normal)
        self.navigationItem.leftBarButtonItem!.setTitleTextAttributes([
            NSFontAttributeName : UIFont(name: "MarkerFelt-Thin", size: 15)!],
            forState: UIControlState.Normal)
        
        
        //mapview
        let location = CLLocationCoordinate2D(
            latitude: 16.0755968,
            longitude: 108.2339355 )
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        mapdetailview.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        
        annotation.title = place.title
        annotation.subtitle = place.subtitle
        
        mapdetailview.addAnnotation(annotation)
        mapdetailview.delegate = self
        
    }
    
    func backhome (sender: UIBarButtonItem){
     self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    func mapView(mapView: MKMapView,
        viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            
            let annotationReuseId = "Restaurant30"
            var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(annotationReuseId)
            if anView == nil {
                anView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationReuseId)
            } else {
                anView!.annotation = annotation
            }
            anView!.image = UIImage(named: "Restaurant30")
            anView!.backgroundColor = UIColor.clearColor()
            anView!.canShowCallout = true
            
            let buttonlift: UIButton = UIButton(type: UIButtonType.Custom)
            buttonlift.frame.size.width = 44
            buttonlift.frame.size.height = 44
            buttonlift.setImage(UIImage(named: "nhahang")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forState:UIControlState.Normal)
            anView!.leftCalloutAccessoryView = buttonlift
            
            return anView
            
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension MapdetailVC: MKMapViewDelegate {
    
}