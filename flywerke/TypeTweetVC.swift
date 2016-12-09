//
//  TypeTweetVC.swift
//  flywerke
//
//  Created by Paul Defilippi on 12/2/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TypeTweetVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetTextView: UITextView!
    var numberCharactersLeft: UIBarButtonItem = UIBarButtonItem()
    var tweetBarBtnItem: UIBarButtonItem?
    var tweetBtn: UIButton?
    
    // FIrebase
    let ref = FIRDatabase.database().reference()
    var tweetsRef: FIRDatabaseReference?
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.delegate = self
        tweetTextView.becomeFirstResponder()
        
        addToolBar(textView: tweetTextView)
        
        // Firebase
        tweetsRef = ref.child("tweets")

    }
    
    func addToolBar(textView: UITextView) {
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor(red: 29 / 255.0, green: 160 / 255.0, blue: 242 / 255.0, alpha: 1.0)
        
        let doneBtn = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(TypeTweetVC.doneAction))
        
        let cancelBtn = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(TypeTweetVC.cancelAction))
        
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        // other control buttons
        numberCharactersLeft = UIBarButtonItem(title: "140", style: .plain, target: nil, action: nil)
        numberCharactersLeft.tintColor = UIColor(red: 85 / 255.0, green: 172 / 255.0, blue: 238 / 255.0, alpha: 1.0)
        
        tweetBarBtnItem = UIBarButtonItem(customView: addTweetBtn())
        
        toolbar.setItems([cancelBtn, spaceBtn, numberCharactersLeft, tweetBarBtnItem!, doneBtn], animated: false)
        
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
        
        textView.inputAccessoryView = toolbar
        
        
    }
    
    
    
    func doneAction() {
        print("done")
    }
    
    func cancelAction() {
        print("cancel")
    }

    func sendTweetAction() {
        
        print("tweet sent")
        
        let tweet = tweetTextView!.text!
        let date = displayDate()
        let tweetRef: FIRDatabaseReference = tweetsRef!.child("\(date)")
        
        let tweetDict: NSDictionary = ["tweet": tweet, "date": date]
        tweetRef.setValue(tweetDict)
        
        dismiss(animated: true, completion: nil)
    }
    
    func addTweetBtn() -> UIView {
        
        tweetBtn = UIButton(type: UIButtonType.custom)
        tweetBtn!.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        tweetBtn!.setTitle("tweet", for: .normal)
        tweetBtn?.setTitleColor(UIColor.gray, for: .highlighted)
        tweetBtn!.titleLabel?.font = UIFont(name: "Arial", size: 14)
        
        tweetBtn!.addTarget(self, action: #selector(TypeTweetVC.sendTweetAction), for: .touchUpInside)
        
        tweetBtn!.layer.cornerRadius = 3
        tweetBtn!.clipsToBounds = true
        
        enableTweetBtn(btn: tweetBtn!, enabled: false)
        
        return tweetBtn!
    }
    
    func enableTweetBtn(btn: UIButton, enabled: Bool) {
        
        if enabled {
            btn.backgroundColor = UIColor(red: 85 / 255.0, green: 172 / 255.0, blue: 238 / 255.0, alpha: 1.0)
            btn.tintColor = UIColor.white
            btn.isEnabled = true
        } else {
            btn.backgroundColor = UIColor.clear
            btn.tintColor = UIColor.darkGray
            btn.isEnabled = false
        }
    }
    
    // MARK: - UITextViewDelegate methods
    
    func textViewDidChange(_ textView: UITextView) {
        //print(textView.text)
        //print("number of characters left = \(140 - tweetText.length)")
        
        let tweetText = textView.text! as NSString
        
        numberCharactersLeft.title = "\(140 - tweetText.length)"
        
        if tweetText.length > 140 {
            numberCharactersLeft.tintColor = UIColor.red
            enableTweetBtn(btn: tweetBtn!, enabled: false)
        } else {
            numberCharactersLeft.tintColor = UIColor(red: 85 / 255.0, green: 172 / 255.0, blue: 238 / 255.0, alpha: 1.0)
        }
        
        if textView.text == ""  || tweetText.length > 140 {
            enableTweetBtn(btn: tweetBtn!, enabled: false)
        } else {
            enableTweetBtn(btn: tweetBtn!, enabled: true)
        }
        
    }
    
    func displayDate() -> String {
        
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        
        return formatter.string(from: currentDate)
    }
    
    
    
    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
