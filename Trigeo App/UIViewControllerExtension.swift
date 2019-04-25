//
//  UIViewControllerExtension.swift
//  iOSOngoTemplate
//
//  Created by Mahesh on 23/10/18.
//  Copyright © 2018 ongoframework. All rights reserved.
//

import UIKit
//import SVProgressHUD
import MapKit
extension UIViewController {
    // use this for all over the project
    func showAlert(withTitle title:String, andMessage message:String) {
        let alert = UIAlertController(title: "Trigeo App", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithTitle(withTitle title:String, andMessage message:String,completion:@escaping (_ success:Bool)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (alert) in
            completion(true)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithConformation(withTitle title:String, andMessage message:String,completion:@escaping (_ success:Bool)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (alert) in
            completion(true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (alert) in
            completion(false)
        }
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
 
    func showAlertForEnableNotification(withTitle title:String, andMessage message:String,completion:@escaping (_ success:Bool)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Settings", style: .default) { (alert) in
            completion(true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (alert) in
            completion(false)
        }
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func actionSheet(mapView:MKMapView) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Map Type", preferredStyle: .actionSheet)
        let standardAction = UIAlertAction(title: "Standard", style: .default, handler: {(alert: UIAlertAction!) -> Void in
            mapView.mapType = .standard
        })
        
        let hybridAction = UIAlertAction(title: "Hybrid", style: .default, handler: {(alert: UIAlertAction!) -> Void in
            mapView.mapType = .hybrid
        })
        let satelliteAction = UIAlertAction(title: "Satellite", style: .default, handler: {(alert: UIAlertAction!) -> Void in
            mapView.mapType = .satellite
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) -> Void in
        })
        optionMenu.addAction(standardAction)
        optionMenu.addAction(hybridAction)
        optionMenu.addAction(satelliteAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func applyDropShadowForView(_ view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        view.layer.shadowOpacity = 0.3
        view.layer.masksToBounds = false
    }
    
    func showLoader(message:String){
        //SVProgressHUD.show(withStatus: message)
        // self.view.addSubview(UIView().customActivityIndicator(view: self.view, widthView: nil, backgroundColor:.black, textColor: .yellow, message: message))
    }
//
    func hideLoader(){
        //SVProgressHUD.dismiss()
        // UIView().hideLoader(self.view)
    }
    
    
   
    
    func getDateFormat(dateinStringFormat:String,startTime:String,endTime:String,isRequestDetails:Bool) -> String {
        var Msg_Date_ = dateinStringFormat
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MMM-yy"  //"MMM d, h:mm a" for  Sep 12, 2:11 PM
        let datee = dateFormatterGet.date(from: dateinStringFormat)
        Msg_Date_ =  dateFormatterPrint.string(from: datee ?? Date())
        
        if isRequestDetails {
            if startTime.isEmpty {
                let endTime = timeFormat(time: endTime)
                return Msg_Date_ + ",  \(endTime)"
            }else{
                let startTime = timeFormat(time: startTime)
                return Msg_Date_ + ",  \(startTime)"
            }
        }
        else
        {
            let startTime = timeFormat(time: startTime)
            let endTime = timeFormat(time: endTime)
            return Msg_Date_ + ",  \(startTime) to \(endTime)"
        }
        
    }
    
    func timeFormat(time:String) -> String {
        // let timestart = startTime
        //  let timeend = endTime
        let timeFormater = DateFormatter()
        timeFormater.dateFormat = "HH:mm:ss"
        let timeFormaterPrint = DateFormatter()
        timeFormaterPrint.dateFormat = "HH:mm"
        let timee = timeFormater.date(from: time)
        let timeresult = timeFormaterPrint.string(from: timee ?? Date())
        return timeresult
    }
    
    func getBackendless() -> Backendless {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return Backendless.sharedInstance()
        }
        return delegate.backendless!
    }
}

extension UIView{
    func animateBorderColor(toColor: UIColor, duration: Double) {
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "borderColor")
        animation.fromValue = layer.borderColor
        animation.toValue = toColor.cgColor
        animation.duration = duration
        layer.add(animation, forKey: "borderColor")
        layer.borderColor = toColor.cgColor
    }
}
