//
//  ViewController.swift
//  CustomTable
//
//  Created by Bob Lee on 12/18/16.
//  Copyright © 2016 BobtheDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var socialMediaNameArray = ["Facebook", "Medium", "LinkedIn", "Twitter", "YouTube"]
  var usernameArray = ["Bob the Develeoper", "Bob Lee", "Bob Lee", "@bobleesj", "Bob the Developer"]
  var socialMediaImageArray = [UIImage(named: "Facebook"), UIImage(named: "Medium"), UIImage(named: "LinkedIn"), UIImage(named: "Twitter"), UIImage(named: "YouTube")]

  @IBOutlet weak var tableView: UITableView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return socialMediaNameArray.count
  }
  

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
    
    cell.usernameLabel.text = usernameArray[indexPath.row]
    cell.nameLabel.text = socialMediaNameArray[indexPath.row]
    cell.socialImage.image = socialMediaImageArray[indexPath.row]
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  
  
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
    return UITableViewCellEditingStyle.delete
  }
  
  // Default Swipe Delete
  
//  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//    if editingStyle == .delete {
//      socialMediaNameArray.remove(at: indexPath.row)
//      usernameArray.remove(at: indexPath.row)
//      socialMediaImageArray.remove(at: indexPath.row)
//      
//      tableView.deleteRows(at: [indexPath], with: .fade)
//    }
//      
//    }
  
  // Custom Swipe Functions 
  
  
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    
    let moreRowAction = UITableViewRowAction(style: .default, title: "More", handler: {
      action, indexpath in
      print("More Action Clicked")

    })
    moreRowAction.backgroundColor = UIColor.blue
    
    
    let deleteRowAction = UITableViewRowAction(style: .destructive, title: "Delete", handler: {_,_ in 
      self.socialMediaNameArray.remove(at: indexPath.row)
      self.usernameArray.remove(at: indexPath.row)
      self.socialMediaImageArray.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
      
    })
    return [moreRowAction, deleteRowAction]
  }
  


}
