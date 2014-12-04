//
//  ViewController.swift
//  InteractiveTransitionSample
//
//  Created by A12893 on 2014/12/04.
//  Copyright (c) 2014年 Ameba Studio. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController {
    required init(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    override init() { super.init(nibName: "SourceViewController", bundle: nil) }
    
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionManager.sourceViewController = self
        transitionManager.destinationViewController = DestinationViewController()
    }
}

