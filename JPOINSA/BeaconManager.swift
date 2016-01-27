//
//  BeaconManager.swift
//  JPOINSA
//
//  Created by Gautier Delorme on 26/01/16.
//  Copyright © 2016 gautierdelorme. All rights reserved.
//

protocol BeaconManagerDelegate  {
    func didEnterInRegion(identifier: String)
}

class BeaconManager: NSObject, ESTBeaconManagerDelegate {
    
    static let sharedInstance   = BeaconManager()
    
    let beaconManager   :   ESTBeaconManager
    let regions         :   [CLBeaconRegion]
    
    var delegate        :   BeaconManagerDelegate?
    private(set) var currentRegion   :   CLBeaconRegion?
    
    private override init() {
        self.beaconManager = ESTBeaconManager()
        self.beaconManager.requestAlwaysAuthorization()
        self.regions = [
            CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, major: CLBeaconMajorValue(11111), identifier: "firstFloor"),
            CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, major: CLBeaconMajorValue(22222), identifier: "secondFloor"),
            CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, major: CLBeaconMajorValue(33333), identifier: "thirdFloor")
        ]
        super.init()
        self.beaconManager.delegate = self
    }
    
    func startRangingBeacons() {
        for region in self.regions {
            self.beaconManager.startRangingBeaconsInRegion(region)
        }
    }
    
    func stopRangingBeacons() {
        for region in self.regions {
            self.beaconManager.stopRangingBeaconsInRegion(region)
        }
    }
    
    
    // MARK: - ESTBeaconManagerDelegate
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        guard let beacon = beacons.first else {
            return
        }
        guard beacon.proximity == CLProximity.Near || beacon.proximity == CLProximity.Immediate else {
            return
        }
        guard let currentRegion = self.currentRegion else {
            self.currentRegion = region
            delegate?.didEnterInRegion(region.identifier)
            return
        }
        guard currentRegion.identifier != region.identifier else {
            return
        }
        self.currentRegion = region
        delegate?.didEnterInRegion(region.identifier)
    }
    
    
}
