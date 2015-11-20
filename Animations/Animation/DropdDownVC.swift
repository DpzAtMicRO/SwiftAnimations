//
//  DropdDownVC.swift
//  Animation
//
//  Created by Deepak on 20/11/15.
//  Copyright © 2015 Deepak. All rights reserved.
//
// Landing page
// A project to try out and modify Custom Animations with Swift2.0 and Autolyout. 
// Starting the first VC with a simple dropdown
//


// **** VC 1 - Simple Dropdown view from Navigationbar bottom , with slide down animation *****


import UIKit

class DropdDownVC: UIViewController {

//    MARK: Class Variables
    var droppedDown:Bool = false
    var dropDownHeight:CGFloat = 0
    
//    MARK: Outlets
    @IBOutlet weak var dropDownViewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var dropDoanViewTopPadding: NSLayoutConstraint!
    
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var dropDownBackgroundView: UIView!
    
//    MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {

        // IMP: this plays the key role, bounds retounrs worong values if not done
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
        // hide the view initially
        self.dropDownHeight = self.dropDownView.bounds.size.height
        dropDoanViewTopPadding.constant = -dropDownHeight
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    MARK: Actions
    @IBAction func dropDown(sender: UIBarButtonItem) {
        
        if droppedDown {
            // show drop down menu
            
            //set the desired constarint first
            self.dropDoanViewTopPadding.constant = -self.dropDownHeight
            
            // start aniamting
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                                self.dropDownBackgroundView.layoutIfNeeded()
                                }, completion: nil)
            droppedDown = false
            
            
        }
        else {
            // hide drop down menu
            
            //set the desired constarint first
            dropDownBackgroundView.layoutIfNeeded()
            self.dropDoanViewTopPadding.constant = 0
            
            // start aniamting
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.dropDownBackgroundView.layoutIfNeeded()
                }, completion: nil)
            droppedDown = true
        }
    }
}


