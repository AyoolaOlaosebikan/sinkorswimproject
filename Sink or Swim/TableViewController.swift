//
//  TableViewController.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/18/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
//    @IBAction func darkModeSwitchToggled(_ sender: UISwitch) {
//        let isDarkModeOn = sender.isOn
//        UserDefaults.standard.set(isDarkModeOn, forKey: "isDarkModeOn")
//        updateAppearance(isDarkModeOn)
//    }
//    
//    func updateAppearance(_ isDarkModeOn: Bool) {
//        if isDarkModeOn {
//            overrideUserInterfaceStyle = .dark
//        } else {
//            overrideUserInterfaceStyle = .light
//        }
//    }
    
    lazy var toadImages:BaseToadImages = {
        return BaseToadImages.sharedInstance()
    }()
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
            return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if section == 0 {
//            return self.toadImages.numberOfImages();
//        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "toads cell", for: indexPath)
            
            // Configure the cell...
            
            
            
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "toad lore cell", for: indexPath)
            
            // Configure the cell...
            
            
            
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "every toad", for: indexPath)
            
            //             Configure the cell...
            
            
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "toad ratings", for: indexPath)
            
            // Configure the cell...
            
            
            
            return cell
        }else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dark mode switch", for: indexPath) as! DarkModeSwitch
            
            let isDarkModeOn = UserDefaults.standard.bool(forKey: "isDarkModeOn")
                   cell.darkModeSwitch.isOn = isDarkModeOn

                   // Handle the switch toggling
                   cell.switchToggled = { isOn in
                       self.updateGlobalAppearance(isOn)
                   }

            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "you shouldnt reach this", for: indexPath)
            
            return cell
        }
    }
    func updateGlobalAppearance(_ isDarkModeOn: Bool) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                for window in windowScene.windows {
                    window.overrideUserInterfaceStyle = isDarkModeOn ? .dark : .light
                }
            }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
//     //MARK: - Navigation
//
//     //In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         //Get the new view controller using segue.destination.
//         //Pass the selected object to the new view controller.
//        if let vc = segue.destination as? ViewController,
//           let cell = sender as? UITableViewCell,
//           let name = cell.textLabel?.text {
//                vc.displayImageName = name
//    }
//    
//
}
