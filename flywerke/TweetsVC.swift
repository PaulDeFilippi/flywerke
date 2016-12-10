//
//  TweetsVC.swift
//  flywerke
//
//  Created by Paul Defilippi on 12/2/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TweetsVC: UITableViewController {

    var userInfo: NSDictionary?
    
    // FIrebase
    let ref = FIRDatabase.database().reference()
    var tweetsRef: FIRDatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Hello \(userInfo!["name"]!)"
        
        tweetsRef = ref.child("tweets")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)

        // Configure the cell...
        cell.backgroundColor = UIColor(red: 85 / 255.0, green: 172 / 255.0, blue: 238 / 255.0, alpha: CGFloat(indexPath.row) / 10)

        return cell
    }
    
    // MARK - Firebase
    
    func queryFirebase(_ completion:(_ tweetsArray: NSArray) -> ()) {
        
        tweetsRef?.observe(.value, with: { (snapshot) in
            
            let item = snapshot as FIRDataSnapshot
            
            if let dict = item.value as? NSDictionary {
                
                if let tweetsDict = dict as? NSDictionary {
                    
                    for tweet in tweetsDict {
                        let tweetItem = tweet as! NSDictionary
                        
                        let tweetTxt = tweetItem["tweet"] as! String
                        let tweetDate = tweetItem["date"] as! String
                    }
                }
            }
        })
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
