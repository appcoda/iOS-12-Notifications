//
//  NotificationViewController.swift
//  Notification Content App Extension
//
//  Created by Andrew Jaffee on 6/28/18.
//
/*
 
 Copyright (c) 2017-2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

import UIKit
// #3.1 - import notification SDKs
import UserNotifications
import UserNotificationsUI

// #3.2 - adopt a protocol that let's us intercept
// notifications
class NotificationViewController: UIViewController, UNNotificationContentExtension {

    // #3.3 - these outlets allow me to animate buttons
    @IBOutlet weak var clearedTransactionLabel: UILabel!
    @IBOutlet weak var coverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
        
        // #3.4 - hide this label initially;
        // we'll only show it if "Cover" is tapped
        clearedTransactionLabel.alpha = 0.0
    }
    
    // #3.5 - called when a notification is received;
    // a good opportunity to decrypt things like
    // account or transaction numbers from the payload;
    // also good for parsing any other info, like the amount
    // to cover, out of the payload
    func didReceive(_ notification: UNNotification) {
        print("Extension received notification.")
    }
    
    // #3.6 - called when the user clicks "Cover"
    // in the notification; we could build a
    // payload to call a REST API to send
    // the transaction to cover the overdraft
    @IBAction func coverButtonTapped(_ sender: Any) {
        print("[Cover] button tapped.")
        
        // #3.7 - fade out the "Cover" button and
        // fade in the "Your overdraft was covered!"
        // message
        UIView.animate(withDuration: 2.0) {
            self.coverButton.alpha = 0.0
            self.clearedTransactionLabel.textColor = UIColor.red
            self.clearedTransactionLabel.alpha = 1.0
        }
        
    }
    
} // end class NotificationViewController
