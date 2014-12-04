//
//  DestinationViewController.swift
//  InteractiveTransitionSample
//
//  Created by A12893 on 2014/12/04.
//  Copyright (c) 2014年 Ameba Studio. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {
    required init(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    override init() { super.init(nibName: "DestinationViewController", bundle: nil) }
    
    @IBAction func tapped(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
