//
//  MapController.swift
//  ProjectMeet2018
//
//  Created by Tomas Bykowski on 2018-07-05.
//  Copyright © 2018 meet. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true);
        
        // Do any additional setup after loading the view, typically from a nib.
        mapView.showsUserLocation = true ; requestLocationAccess()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Checks current status of location authorization
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case.authorizedAlways, .authorizedWhenInUse:
            return
            
        case.denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
