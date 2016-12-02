//
//  TwitterLoginVC.swift
//  flywerke
//
//  Created by Paul Defilippi on 11/30/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import TwitterKit

class TwitterLoginVC: UIViewController {
    
    var twitterLoginBtn: TWTRLogInButton?
    var userInfo: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLoginBtn()
    }
    
    func addLoginBtn() {
        
        twitterLoginBtn = TWTRLogInButton(logInCompletion: { (session, error) in
            
            if (session != nil) {
                print("session available")
                self.connectWithTwitter(session: session!)
            } else {
                print(error?.localizedDescription as Any)
            }
        })
        
        twitterLoginBtn!.center = self.view.center
        self.view.addSubview(twitterLoginBtn!)
    }
    
    func connectWithTwitter(session:TWTRSession) {
        let credential = FIRTwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            
            if error == nil {
                print("\(user!.displayName!) successfully logged in")
                self.getCurrentUserInfo(user: user!)
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func getCurrentUserInfo(user:FIRUser) {
        
        let name = user.displayName
        let photoUrl = user.photoURL
        
        self.userInfo = ["name": name!, "avatar": "\(photoUrl)"]
        
        self.performSegue(withIdentifier: "goToTweets", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "goToTweets") {
            let tweetsVC = segue.destination as! TweetsVC
            tweetsVC.userInfo = self.userInfo
        }
        
    }



}
