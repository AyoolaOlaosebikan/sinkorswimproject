//
//  TableViewController.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/18/24.
//

import UIKit

// A view controller that manages a table view with multiple sections
class TableViewController: UITableViewController {
    
    // Called when the view is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment this line to keep selection between view presentations.
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment this line if you want to add an Edit button to the navigation bar.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // Lazy initialization of the toad images
    lazy var toadImages: BaseToadImages = {
        return BaseToadImages.sharedInstance()
    }()
    
    // MARK: - Table view data source

    // Specifies the number of sections in the table view. In this case, there are 5 sections.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    // Specifies the number of rows in each section. For simplicity, each section currently has 1 row.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Uncomment the following code if you want the number of rows in the first section to correspond to the number of images.
        // if section == 0 {
        //     return self.toadImages.numberOfImages()
        // }
        return 1
    }

    // Configures the cells for each section of the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // Section 0: Cell related to displaying toad images
            let cell = tableView.dequeueReusableCell(withIdentifier: "toads cell", for: indexPath)
            // Configure the cell as needed (e.g., setting the text or image)
            return cell
        } else if indexPath.section == 1 {
            // Section 1 = Cell for "toad lore"
            let cell = tableView.dequeueReusableCell(withIdentifier: "toad lore cell", for: indexPath)
            // Configure the cell for toad lore
            return cell
        } else if indexPath.section == 2 {
            // Section 2 = Cell for "every toad"
            let cell = tableView.dequeueReusableCell(withIdentifier: "every toad", for: indexPath)
            // Configure the cell for displaying every toad
            return cell
        } else if indexPath.section == 3 {
            // Section 3 = Cell for "toad ratings"
            let cell = tableView.dequeueReusableCell(withIdentifier: "toad ratings", for: indexPath)
            // Configure the cell for toad ratings
            return cell
        } else if indexPath.section == 4 {
            // Section 4 = Cell for dark mode switch. This cell is a custom UITableViewCell subclass (DarkModeSwitch)
            let cell = tableView.dequeueReusableCell(withIdentifier: "dark mode switch", for: indexPath) as! DarkModeSwitch
            
            // Get the current dark mode state from UserDefaults
            let isDarkModeOn = UserDefaults.standard.bool(forKey: "isDarkModeOn")
            cell.darkModeSwitch.isOn = isDarkModeOn

            // Handle the toggling of the dark mode switch
            cell.switchToggled = { isOn in
                self.updateGlobalAppearance(isOn)
            }

            return cell
        } else {
            // Default fallback cell if an unexpected section is encountered
            let cell = tableView.dequeueReusableCell(withIdentifier: "you shouldnt reach this", for: indexPath)
            return cell
        }
    }
    
    // Function to update the global appearance (dark or light mode) of the app based on the switch value
    func updateGlobalAppearance(_ isDarkModeOn: Bool) {
        // Iterate through all windows and update the UI style (dark or light mode) based on the switch value
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            for window in windowScene.windows {
                window.overrideUserInterfaceStyle = isDarkModeOn ? .dark : .light
            }
        }
    }

    // Uncomment these methods if you want to add support for editing, deleting, or rearranging table view rows

    /*
    // Enable conditional editing of table view rows
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Support editing actions like deletion or insertion of rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Insert a new row in the table
        }
    }
    */

    /*
    // Support rearranging the table view rows
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // Handle reordering of rows
    }
    */

    /*
    // Enable conditional rearranging of rows in the table view
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    // MARK: - Navigation

    // Uncomment this method if you need to pass data to another view controller before a segue
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController,
