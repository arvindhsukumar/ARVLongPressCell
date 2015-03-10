//
//  ViewController.swift
//  ARVLongPressCell
//
//  Created by Arvindh Sukumar on 09/03/15.
//  Copyright (c) 2015 Arvindh Sukumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var blur: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
        self.blur.frame = self.view.bounds
        self.blur.alpha = 0
        self.view.addSubview(self.blur)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.4, delay: 2, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.blur.alpha = 1

            }) { (fin:Bool) -> Void in
            
        }
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

