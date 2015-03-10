//
//  ARVDisplayView.swift
//  ARVLongPressCell
//
//  Created by Arvindh Sukumar on 09/03/15.
//  Copyright (c) 2015 Arvindh Sukumar. All rights reserved.
//

import UIKit

class ARVDisplayView: UIView {
    var blur: UIVisualEffectView!
    var cellFrame: CGRect!
    var cell: UIView!
    var toolBar: UIToolbar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(){
        self.backgroundColor = UIColor.clearColor()
        self.blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
        self.blur.frame = self.bounds
        self.blur.alpha = 0
        
        let tap = UITapGestureRecognizer(target: self, action: "hideWhenTapped:")
        blur.addGestureRecognizer(tap)
        self.addSubview(self.blur)
        
        self.toolBar = UIToolbar(frame: CGRectMake(0, self.frame.size.height-120, self.frame.size.width, 44))
        self.toolBar.backgroundColor = UIColor.clearColor()
        self.toolBar.setBackgroundImage(UIImage(),forToolbarPosition: UIBarPosition.Any,            barMetrics: UIBarMetrics.Default)
        self.toolBar.tintColor = UIColor.whiteColor()
        self.toolBar.setShadowImage(UIImage(),forToolbarPosition: UIBarPosition.Any)
        self.addSubview(self.toolBar)
        
        let bb1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: nil)
        self.toolBar.setItems([bb1], animated: false)
        self.toolBar.alpha = 0
    }
    
    func showView(cell:UIView){
        let c = cell.snapshotViewAfterScreenUpdates(true)
        let frame = self.convertRect(cell.frame, fromView: cell.superview)

        self.cell = UIView(frame: CGRectInset(frame,0, 1))
        self.cell.backgroundColor = UIColor.clearColor()
        self.cell.addSubview(c)
        self.cell.clipsToBounds = true
        self.cellFrame = frame
        self.addSubview(self.cell)
        self.userInteractionEnabled = false
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in

            var frame = self.cell.frame
            frame.origin.y = 120
            self.cell.frame = frame
            
            self.blur.alpha = 1
            self.toolBar.alpha = 1
            
            }) { (finished:Bool) -> Void in
                    self.userInteractionEnabled = true
        }
        
    }
    
    func hideWhenTapped(tap:UITapGestureRecognizer){
        
        self.userInteractionEnabled = false
        UIView.animateWithDuration(0.25, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.cell.frame = self.cellFrame
            self.blur.alpha = 0
            self.toolBar.alpha = 0
            
            }) { (finished:Bool) -> Void in
            
                self.cell.removeFromSuperview()
                self.removeFromSuperview()
                self.userInteractionEnabled = true
        }
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
