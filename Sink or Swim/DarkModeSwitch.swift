//
//  DarkModeSwitch.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/19/24.
//

import UIKit

// Custom UITableViewCell class that includes a switch to toggle dark mode
class DarkModeSwitch: UITableViewCell {

    // Outlet to connect the UISwitch in the storyboard or XIB file
    @IBOutlet weak var darkModeSwitch: UISwitch!

    // A closure that will be triggered when the switch is toggled
    var switchToggled: ((Bool) -> Void)?

    // Called when the cell is loaded from the nib or storyboard
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Adding an action to the switch for when its value changes (on or off)
        darkModeSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
    }

    // This method is triggered when the switch value changes
    @objc func switchValueChanged(_ sender: UISwitch) {
        // Save the switch state (whether dark mode is on or off) to UserDefaults
        UserDefaults.standard.set(sender.isOn, forKey: "isDarkModeOn")
        
        // If the closure is set, it gets executed with the new switch state
        switchToggled?(sender.isOn)
    }

    // Method that configures the cell when it is selected, but nothing specific happens here in this case
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state if needed
    }
}
