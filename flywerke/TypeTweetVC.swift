//
//  TypeTweetVC.swift
//  flywerke
//
//  Created by Paul Defilippi on 12/2/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import UIKit

class TypeTweetVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.delegate = self
        tweetTextView.becomeFirstResponder()
        
        addToolBar(textView: tweetTextView)

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
        
        toolbar.setItems([cancelBtn, spaceBtn, doneBtn], animated: false)
        
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
        print("tweet sent!")
    }
    
    // MARK: - UITextViewDelegate methods
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
        
        let tweetText = textView.text! as NSString
        
        print("number of characters left = \(140 - tweetText.length)")
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
