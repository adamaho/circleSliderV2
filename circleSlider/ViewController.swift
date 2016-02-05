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
    @IBOutlet weak var ZeroSeconds: UILabel!
    @IBOutlet weak var fiveSeconds: UILabel!
    @IBOutlet weak var tenSeconds: UILabel!
    @IBOutlet weak var fifteenSeconds: UILabel!
    @IBOutlet weak var twentySeconds: UILabel!
    @IBOutlet weak var twentyFiveSeconds: UILabel!
    @IBOutlet weak var thirtySeconds: UILabel!
    @IBOutlet weak var thirtyFiveSeconds: UILabel!
    @IBOutlet weak var fortySeconds: UILabel!
    @IBOutlet weak var fortyFiveSeconds: UILabel!
    @IBOutlet weak var fiftySeconds: UILabel!
    
    
    
    let textColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)

    
    var cx, cy, angle, angled, mag, rad, radb, ox, oy, x, y: CGFloat!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the background color of the Canvas
        let backgroundColor = UIColor(red: 177/255, green: 0, blue: 5/255, alpha: 1.0)
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
        let sliderColor = UIColor(red: 1, green: 195/255, blue: 70/255, alpha: 1.0)
        topSlider.layer.cornerRadius = 17.5
        topSlider.layer.masksToBounds = true
        topSlider.layer.backgroundColor = sliderColor.CGColor
        
        // Setting the color of the bottomSlider
        bottomSlider.layer.cornerRadius = 17.5
        bottomSlider.layer.masksToBounds = true
        bottomSlider.layer.backgroundColor = sliderColor.CGColor
        
        // Configuring Label for zero seconds
        ZeroSeconds.textAlignment = NSTextAlignment.Center
        ZeroSeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        ZeroSeconds.font = UIFont(name: "Azo Sans", size: 12)
        ZeroSeconds.text = "00"
        
        // Configuring Label for five seconds
        fiveSeconds.textAlignment = NSTextAlignment.Center
        fiveSeconds.textColor = textColor
        fiveSeconds.font = UIFont(name: "Azo Sans", size: 12)
        fiveSeconds.text = "05"
        
        // Configuring Label for ten seconds
        tenSeconds.textAlignment = NSTextAlignment.Center
        tenSeconds.textColor = textColor
        tenSeconds.font = UIFont(name: "Azo Sans", size: 12)
        tenSeconds.text = "10"
        
        // Configuring Label for fifteen seconds
        fifteenSeconds.textAlignment = NSTextAlignment.Center
        fifteenSeconds.textColor = textColor
        fifteenSeconds.font = UIFont(name: "Azo Sans", size: 12)
        fifteenSeconds.text = "15"
        
        // Configuring Label for twenty seconds
        twentySeconds.textAlignment = NSTextAlignment.Center
        twentySeconds.textColor = textColor
        twentySeconds.font = UIFont(name: "Azo Sans", size: 12)
        twentySeconds.text = "20"
        
        // Configuring Label for twenty five seconds
        twentyFiveSeconds.textAlignment = NSTextAlignment.Center
        twentyFiveSeconds.textColor = textColor
        twentyFiveSeconds.font = UIFont(name: "Azo Sans", size: 12)
        twentyFiveSeconds.text = "25"
        
        // Configuring Label for thirty seconds
        thirtySeconds.textAlignment = NSTextAlignment.Center
        thirtySeconds.textColor = textColor
        thirtySeconds.font = UIFont(name: "Azo Sans", size: 12)
        thirtySeconds.text = "30"
        
        // Configuring Label for thirty five seconds
        thirtyFiveSeconds.textAlignment = NSTextAlignment.Center
        thirtyFiveSeconds.textColor = textColor
        thirtyFiveSeconds.font = UIFont(name: "Azo Sans", size: 12)
        thirtyFiveSeconds.text = "35"
        
        // Configuring Label for thirty five seconds
        fortySeconds.textAlignment = NSTextAlignment.Center
        fortySeconds.textColor = textColor
        fortySeconds.font = UIFont(name: "Azo Sans", size: 12)
        fortySeconds.text = "40"
        
        // Configuring Label for thirty five seconds
        fortyFiveSeconds.textAlignment = NSTextAlignment.Center
        fortyFiveSeconds.textColor = textColor
        fortyFiveSeconds.font = UIFont(name: "Azo Sans", size: 12)
        fortyFiveSeconds.text = "45"
        
        // Configuring Label for thirty five seconds
        fiftySeconds.textAlignment = NSTextAlignment.Center
        fiftySeconds.textColor = textColor
        fiftySeconds.font = UIFont(name: "Azo Sans", size: 12)
        fiftySeconds.text = "50"
        
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
        mag  = sqrt(pow(x,2) + pow(y,2))
        angle = atan(y/x)
        angled = angle * 180/3.14159
        print(angled)
        rad = 123
        radb = 75
        
        // If statement for when x values are greater than 0 wrt the origin of the circle
        if (mag >= 100 && mag <= 150 && cx > 160) {
            
            topSlider.center.x = ox + rad*cos(angle)
            topSlider.center.y = oy - rad*sin(angle)
            
            
            // Configuring Angles and text highlighting for 05 seconds
            if (angled >= 85 && angled <= -85) {
                
                ZeroSeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                ZeroSeconds.textColor = textColor
            }
            
            // Configuring Angles and text highlighting for 05 seconds
            if (angled >= 60 && angled <= 70) {
                
                fiveSeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                fiveSeconds.textColor = textColor
            }
            
            // Configuring Angles and text highlighting for 10 seconds
            if (angled >= 35 && angled <= 45) {
                
                tenSeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

            } else {
                
                tenSeconds.textColor = textColor
            }
            
            // Configuring Angles and text highlighting for 15 seconds
            if (angled >= 10 && angled <= 20) {
                
                fifteenSeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                fifteenSeconds.textColor = textColor
            }
            
            // Configuring Angles and text highlighting for 20 seconds
            if (angled >= -28 && angled <= -18) {
                
                twentySeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                twentySeconds.textColor = textColor
            }
            
            // Configuring Angles and text highlighting for 25 seconds
            if (angled >= -45 && angled <= -35) {
                
                twentyFiveSeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                twentyFiveSeconds.textColor = textColor
            }
            
            // Configuring Angles and text highlighting for 30 seconds
            if (angled >= -65 && angled <= -55) {
    
                thirtySeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                thirtySeconds.textColor = textColor
            }
            
        }
            
        // If statement for when x values are less than 0 wrt the origin of the circle
        else if (mag >= 100 && mag <= 150 && cx < 160) {
            
            topSlider.center.x = ox - rad*cos(angle)
            topSlider.center.y = oy + rad*sin(angle)
            
            // Configuring Angles and text highlighting for 35 seconds
            if (angled >= 53 && angled <= 63) {
                
                thirtyFiveSeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                thirtyFiveSeconds.textColor = textColor
            }
            
            // Configuring Angles and text highlighting for 40 seconds
            if (angled >= 36 && angled <= 46) {
                
                fortySeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                fortySeconds.textColor = textColor
            }
            
            // Configuring Angles and text highlighting for 40 seconds
            if (angled >= 15 && angled <= 25) {
                
                fortyFiveSeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                fortyFiveSeconds.textColor = textColor
            }

            // Configuring Angles and text highlighting for 40 seconds
            if (angled >= -23 && angled <= -13) {
                
                fiftySeconds.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                fiftySeconds.textColor = textColor
            }

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

