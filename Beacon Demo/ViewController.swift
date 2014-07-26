//
//  ViewController.swift
//  Beacon Demo
//
//  Created by Christopher Beloch on 19.07.14.
//  Copyright (c) 2014 Some Kind Of Code. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var beaconLabel: UILabel!
    
    private var beaconUUIDString = "ADD-THE-UUID-HERE"
    private var beaconIdentifier = "com.somekindofcode.sample"
    
    var locationManager = CLLocationManager()
    var beaconRegion : CLBeaconRegion
    
    init(coder aDecoder: NSCoder!){
        // This is the main beacon we want to get notified about
        beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: beaconUUIDString), identifier: beaconIdentifier)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.requestAlwaysAuthorization()
        beaconRegion.notifyEntryStateOnDisplay = true
        
        locationManager.delegate = self
        locationManager.startMonitoringForRegion(beaconRegion)
        locationManager.startRangingBeaconsInRegion(beaconRegion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
        CLLocationManagerDelegate
    */
    func locationManager(manager: CLLocationManager!, monitoringDidFailForRegion region: CLRegion!, withError error: NSError!){
        beaconLabel.text = "monitoring for region failed: \(error)"
    }
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        beaconLabel.text  = "locationmanager failed: \(error)"
    }
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        beaconLabel.text = "You entered"
    }
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        beaconLabel.text = "You exited"
    }
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        // You can scan for any beacon in here!
        // Find the closest one by RSSI etc
        beaconLabel.text = "Ranged \(beacons.count) Beacons"
    }
}

