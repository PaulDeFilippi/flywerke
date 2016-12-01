//
//  SplashScreenVC.swift
//  flywerke
//
//  Created by Paul Defilippi on 11/27/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import UIKit

class SplashScreenVC: UIViewController {
    
    var twitterLogoImgView:UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        twitterLogoImgView = UIImageView()
        twitterLogoImgView = UIImageView(frame: CGRect(x: (self.view.bounds.width / 2) - 50, y: (self.view.bounds.height / 2) - 50, width: 100, height: 100))
        
        twitterLogoImgView?.contentMode = .scaleAspectFit
        
        twitterLogoImgView!.image = UIImage(named: "twitterLogo.png")
        self.view.addSubview(twitterLogoImgView!)
        
        self.view.backgroundColor = UIColor(red: 85 / 255.0, green: 172 / 255.0, blue: 238 / 255.0, alpha: 1.0)
        
        animate()
        
    }

    func animate() {
        
        let duration = 1.0
        let delay = 1.5
        
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: [], animations: {
            
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.33, animations: {
                
                    self.twitterLogoImgView!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 90, height: 90)
                })
            
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.33, animations: {
                    self.twitterLogoImgView!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 1500, height: 1500)
                })
            
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.33, animations: {
                    self.twitterLogoImgView!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 3000, height: 3000)
                })
            
            }, completion: { (finished) in
                self.goToLoginView()
            
        })
            

        
    }
    
    func goToLoginView() {
        self.performSegue(withIdentifier: "goToLogin", sender: self)
        
    }
    
    
    
}


    
