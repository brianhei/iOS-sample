//
//  ViewController.swift
//  Auth
//
//  Created by Brian on 27/10/15.
//  Copyright (c) 2015 noble. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClick(sender: AnyObject) {
        let localAuthContext = LAContext()
        var error : NSError?
        
        if localAuthContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            localAuthContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Are you the device owner?", reply: { (success : Bool, error : NSError!) -> Void in
                dispatch_async(dispatch_get_main_queue()) {
                    if error != nil {
                        let alertViewController = UIAlertController(title: "Error", message: "You device cannot cannot authenticate using TouchID.", preferredStyle: UIAlertControllerStyle.Alert)
                        alertViewController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
                        self.presentViewController(alertViewController, animated: true, completion: nil)
                        return
                    }
                    
                    if success {
                        let alertViewController = UIAlertController(title: "Info", message: "You are device owner", preferredStyle: UIAlertControllerStyle.Alert)
                        alertViewController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
                        self.presentViewController(alertViewController, animated: true, completion: nil)
                    } else {
                        let alertViewController = UIAlertController(title: "Error", message: "You device cannot cannot authenticate using TouchID.", preferredStyle: UIAlertControllerStyle.Alert)
                        alertViewController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
                        self.presentViewController(alertViewController, animated: true, completion: nil)
                    }
                }
            })
        } else {
            let alertViewController = UIAlertController(title: "Error", message: "You device cannot cannot authenticate using TouchID.", preferredStyle: UIAlertControllerStyle.Alert)
            alertViewController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
            presentViewController(alertViewController, animated: true, completion: nil)
        }
    }
}

