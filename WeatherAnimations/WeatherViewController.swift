//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    
    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    let newView = UIView()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        newView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        newView.backgroundColor = UIColor.blue
        view.addSubview(newView)
        view.addSubview(sun)
        view.addSubview(moon)
        view.addSubview(cloud)
        view.addSubview(lightning)
        lightning.translatesAutoresizingMaskIntoConstraints = false
        
        self.sun.frame = CGRect(x: self.sun.center.x + width, y: self.sun.center.y + height, width: width * 0.40, height: width * 0.40)
        self.moon.frame = CGRect(x: self.moon.center.x + width, y: self.moon.center.y + height, width: width * 0.40, height: width * 0.40)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpButton()
        animateBackground()
        animateSunAndMoon()
    }
    
    func pressed(_ : UIButton!) {
        UIView.animateKeyframes(withDuration: 8.0, delay: 0.0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.50, animations: {self.cloud.alpha = 0.75
                self.lightning.alpha = 0.75
                self.cloud.frame = CGRect(x: self.cloud.frame.origin.x, y: self.cloud.frame.origin.y - 300 , width: self.cloud.frame.width, height: self.cloud.frame.height)
                self.lightning.frame = CGRect(x: self.lightning.frame.origin.x , y: self.lightning.frame.origin.y - 300 , width: 100, height: 75)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 0.50, animations: {self.cloud.alpha = 0.0
                self.lightning.alpha = 0.0
                self.cloud.frame = CGRect(x: self.cloud.frame.origin.x, y: self.cloud.frame.origin.y + 300 , width: self.cloud.frame.width, height: self.cloud.frame.height)
                self.lightning.frame = CGRect(x: self.lightning.frame.origin.x , y: self.lightning.frame.origin.y + 300 , width: 100, height: 75)
            })
        }, completion: nil)
        
        UIView.animateKeyframes(withDuration: 1.0, delay: 3.0, options: [.calculationModeLinear, .autoreverse] , animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.20, animations:
                {
                self.lightning.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 0.20, animations:
                {
                self.lightning.alpha = 0.0
            })
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 0.20, animations:
                {
                    self.lightning.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 0.20, animations:
                {
                    self.lightning.alpha = 0.0
            })
        }, completion: nil)
        
        
    }
    
    
}






extension WeatherViewController {
    
    func setUpButton () {
        
        cloud.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        cloud.center = CGPoint(x: view.center.x, y: view.center.y * 1.5)
        
        lightning.frame = CGRect(x: 50, y: 0, width: 50, height: 10)
        
        
        lightning.topAnchor.constraint(equalTo: cloud.bottomAnchor).isActive = true
        lightning.centerXAnchor.constraint(equalTo: cloud.centerXAnchor).isActive = true
        
        
        cloud.alpha = 0.0
        lightning.alpha = 0.0
        
        let stormButton = UIButton()
        stormButton.frame = CGRect(x: self.view.center.x - 25.0 , y: self.view.frame.height * 0.8, width: 50.0, height: 50.0)
        stormButton.backgroundColor = UIColor.white
        stormButton.layer.borderWidth = 3.0
        stormButton.layer.borderColor = UIColor.gray.cgColor
        stormButton.setTitle("Zap!", for: .normal)
        stormButton.setTitleColor(UIColor.blue, for: .normal)
        stormButton.addTarget(self, action: #selector(self.pressed(_:)), for: .touchUpInside)
        view.addSubview(stormButton)
    }
    
    func animateBackground() {
        let duration = 20.0
        let frames = 3.0
        let relativeDuration = duration/frames
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: [.repeat], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: relativeDuration, animations: {
                self.newView.backgroundColor = UIColor.blue
                print("hi")
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: relativeDuration, animations: {
                self.newView.backgroundColor = UIColor.cyan
                print("number two")
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: relativeDuration, animations: {
                self.newView.backgroundColor = UIColor.black
                print("bnumber three")
            })}
            , completion: nil)
    }
    func animateSunAndMoon() {
        
        let duration = 20.0
        UIView.animateKeyframes(withDuration: duration, delay: 4.0, options: [ .repeat, .calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.sun.center = CGPoint(x: self.view.center.x, y: (self.view.center.y * 0.4))
                print("this")
            })
            UIView.addKeyframe(withRelativeStartTime: 1/4 , relativeDuration: 0.25, animations: {
                
                self.sun.frame = CGRect(x: -(self.sun.center.x + self.sun.bounds.size.width), y: self.sun.center.y + self.height, width: self.width * 0.4, height: self.width * 0.4)
                print("is")
            })
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 0.25, animations: {
                self.moon.center = CGPoint(x: (self.view.center.x), y: (self.view.center.y * 0.4))
                print("the")
            })
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 0.25, animations: {
                self.moon.frame = CGRect(x: -(self.moon.frame.width + self.moon.bounds.size.width) , y: self.moon.center.y + self.height, width: self.width * 0.40, height: self.width * 0.40)
                print("last")
            })
        }
            , completion: nil)
    }
    
    
    
    
    
    
}
