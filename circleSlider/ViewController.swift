//
//  ViewController.swift
//  circleSlider
//
//  Created by Aho on 2016-02-04.
//  Copyright © 2016 Aho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var largeCircle: UIImageView!
    @IBOutlet weak var smallCircle: UIImageView!
    @IBOutlet weak var topSlider: UIImageView!
    @IBOutlet weak var bottomSlider: UIImageView!
    var cx, cy, angle, mag, rad, radb, ox, oy, x, y: CGFloat!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the background color of the Canvas
        let backgroundColor = UIColor(red: 0.4, green: 0.5, blue: 0.7, alpha: 1.0)
        view.backgroundColor = backgroundColor
        
        
        // Setting the color of the Big Circle
        let CircleColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        largeCircle.layer.cornerRadius = 125
        largeCircle.layer.masksToBounds = true
        largeCircle.layer.backgroundColor = backgroundColor.CGColor
        largeCircle.layer.borderWidth = 5.0
        largeCircle.layer.borderColor = CircleColor.CGColor
        
        // Setting the color of the small Circle
        smallCircle.layer.cornerRadius = 75
        smallCircle.layer.masksToBounds = true
        smallCircle.layer.backgroundColor = backgroundColor.CGColor
        smallCircle.layer.borderWidth = 5.0
        smallCircle.layer.borderColor = CircleColor.CGColor
        
        
        // Setting the color of the topSlider
        let sliderColor = UIColor(red: 0.6, green: 0.8, blue: 0.9, alpha: 1.0)
        topSlider.layer.cornerRadius = 17.5
        topSlider.layer.masksToBounds = true
        topSlider.layer.backgroundColor = sliderColor.CGColor
        
        // Setting the color of the bottomSlider
        bottomSlider.layer.cornerRadius = 17.5
        bottomSlider.layer.masksToBounds = true
        bottomSlider.layer.backgroundColor = sliderColor.CGColor
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let position = touch!.locationInView(view)
        
        // Gathering event data for calculation
        cx = position.x
        cy = position.y
        ox = 160
        oy = 285
        x = cx - ox
        y = oy - cy
        mag  = sqrt((x*x) + (y*y))
        angle = atan(y/x)
        rad = 125
        radb = 75
        
        // If statement for when x values are greater than 0 wrt the origin of the circle
        if (mag >= 100 && mag <= 150 && cx > 160) {
            
            topSlider.center.x = ox + rad*cos(angle)
            topSlider.center.y = oy - rad*sin(angle)

            
        }
            
        // If statement for when x values are less than 0 wrt the origin of the circle
        else if (mag >= 100 && mag <= 150 && cx < 160) {
            
            topSlider.center.x = ox - rad*cos(angle)
            topSlider.center.y = oy + rad*sin(angle)

        }
        
        // If statement for when x values are greater than 0 wrt the origin of the circle
        if (mag >= 50 && mag <= 90 && cx > 160) {
            
            bottomSlider.center.x = ox + radb*cos(angle)
            bottomSlider.center.y = oy - radb*sin(angle)
            
            
        }
            
            // If statement for when x values are less than 0 wrt the origin of the circle
        else if (mag >= 50 && mag <= 90 && cx < 160) {
            
            bottomSlider.center.x = ox - radb*cos(angle)
            bottomSlider.center.y = oy + radb*sin(angle)
            
        }
    }
}

