//
//  ViewController.swift
//  findMyLocation
//
//  Created by Vinte on 2019/7/31.
//  Copyright © 2019 vinte. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    // 强制自动解包，可以赋值为nil，为nil后再调用会报错
    // 建议定义为：
    // var locationManager: CLLocationManager
    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    @IBAction func findMyLocationEvent(_ sender: Any) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization();
        locationManager.startUpdatingLocation()
    }
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLabel.text = "Error while location updating" + error.localizedDescription;
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(locations.first!) { (placeMarks, error) in
            guard error == nil else {
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if placeMarks!.count > 0{
                let containsPlacemark = placeMarks?.first
                
                self.displayLocationInfo(containsPlacemark)
            }
            else {
                self.locationLabel.text = "Problem with the data received from geocoder"
            }
        }
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            print("位置：\(placemark?.name as Any)");
            print("街道：\(placemark?.thoroughfare as Any)");
            print("子街道(门牌号)：\(placemark?.subThoroughfare as Any)");
            print("市名：\(placemark?.locality as Any)");
            print("区名：\(placemark?.subLocality as Any)");
            print("省(州)：\(placemark?.administrativeArea as Any)");
            print("行政信息:\(placemark?.subAdministrativeArea as Any)");
            print("邮政编码:\(placemark?.postalCode as Any)");
            print("国家代码:\(placemark?.isoCountryCode as Any)");
            print("国家:\(placemark?.country as Any)");
            print("水源或者湖泊:\(placemark?.inlandWater as Any)");
            print("海洋:\(placemark?.ocean as Any)");
            print("关联的或利益相关的地标:\(placemark?.areasOfInterest as Any)");
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            let subLocality = (containsPlacemark.subLocality != nil) ? containsPlacemark.subLocality : ""
            let name = (containsPlacemark.name != nil) ? containsPlacemark.name : ""
            let iosCode = (containsPlacemark.isoCountryCode != nil) ? containsPlacemark.isoCountryCode : ""
            
            self.locationLabel.text = postalCode! + " " + locality! + " " + subLocality! + " " + name!
            
            self.locationLabel.text?.append("\n" + administrativeArea! + ", " + country! + "(" + iosCode! + ")")
        }
        
    }
}
