//
//  ToadImageController.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/20/24.
//

import UIKit

class ToadImageController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment this line if you want to retain selection between view presentations.
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment this line if you want to add an Edit button in the navigation bar for editing rows in the table view.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    // Lazy initialization of the toad images. This ensures the instance of `BaseToadImages` is created only when first accessed.
    lazy var toadImages: BaseToadImages = {
        return BaseToadImages.sharedInstance()
    }()

    // Returns the number of sections in the table view. Here, we only have 1 section.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Returns the number of rows in the section, which corresponds to the number of images in the `toadImages`.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toadImages.numberOfImages()
    }

    // Configures each cell in the table view with the name of the toad image at the corresponding index.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeues a reusable cell with the identifier "toad images yuh".
        let cell = tableView.dequeueReusableCell(withIdentifier: "toad images yuh", for: indexPath)

        // Retrieves the image name at the current row index and sets the cell's text label to this name.
        let name = self.toadImages.getImageName(for: indexPath.row)
        cell.textLabel!.text = name

        // You can further configure the cell here (e.g., adding an image or accessory).
        
        return cell
    }

    /*
    // Override this method if you want to allow editing of table view rows (e.g., deletion).
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return true if the item should be editable.
        return true
    }
    */

    /*
    // Override this method to support editing (e.g., swipe to delete).
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new row and insert it into the table
        }
    }
    */

    /*
    // Override this method to support rearranging the table view rows.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // Handle row reordering logic here.
    }
    */

    /*
    // Override this method to conditionally allow rearranging of rows.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you don't want the row to be re-orderable.
        return true
    }
    */
    
    // MARK: - Navigation

    // Prepares for the segue to the new view controller. It passes the selected toad image name to the next view.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object (image name) to the new view controller.
        if let vc = segue.destination as? ToadImages,
           let cell = sender as? UITableViewCell,
           let name = cell.textLabel?.text {
            vc.displayImageName = name
        }
    }
}
