//
//  SecondVC.swift
//  aa
//
//  Created by Megha on 11/06/19.
//  Copyright © 2019 Megha. All rights reserved.
//

import UIKit
import MapKit

class SecondVC: UIViewController,MKMapViewDelegate {
  
  
    //var complitionHandler:((Int) -> (Int) = {})
    var completionString:((String)->(Void))?

    @IBOutlet weak var mapView: MKMapView!
    var arrState = ["Rajstan","Gujarat"]
    var arrCood = [CLLocation.init(latitude: 24.879999, longitude: 74.629997),CLLocation.init(latitude: 23.033863, longitude: 72.585022)]
    var venueLat  = "23.033863"
    var venueLng = "72.585022"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.mapType = .standard
        self.openMapForPlace()
      
        let result = completionString
        print("==>\(result)")
//           let result = self.complitionHandler(100)
//            print("==>\(result)")
    
        //self.addAnotation(coords: arrCood)
//    let chidvc = self.storyboard?.instantiateViewController(withIdentifier:"ChildVC") as! ChildVC
//        self.add(chidvc)
    }
    func openMapForPlace() {
        
        let lat1 : NSString = "23.033863"
        let lng1 : NSString = "72.585022"
        
        let latitude:CLLocationDegrees =  lat1.doubleValue
        let longitude:CLLocationDegrees =  lng1.doubleValue
        
        let regionDistance:CLLocationDistance = 100
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Gujarat"
        mapItem.openInMaps(launchOptions: options)
        
    }
    @IBAction func BackTap(_ sender: Any) {
        globaName = "Good Day"
        self.navigationController?.popViewController(animated: true)
    }
    func addAnotation(coords:[CLLocation]){
        for cood in coords{
            let clType = CLLocationCoordinate2D.init(latitude: cood.coordinate.latitude, longitude:cood.coordinate.longitude)
            let anno = MKPointAnnotation()
            anno.title = "Gujarat"
            anno.subtitle = "Jamnagar"
            anno.coordinate = clType
            mapView.addAnnotation(anno)
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil;
        }else{
            let pinIdent = "Pin";
            var pinView: MKPinAnnotationView;
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation;
                pinView = dequeuedView;
                pinView.tag = 1
            }else{
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinIdent)
                
            }
            pinView.pinTintColor = UIColor.green
            return pinView
        }
        
    }
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("==>\(userLocation)")
    }
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
     print("Start map view load  ....")
    }
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("Finish Map...")
    }
    
}

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
