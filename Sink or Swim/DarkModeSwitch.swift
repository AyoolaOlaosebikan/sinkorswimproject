//
//  DarkModeSwitch.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/19/24.
//

import UIKit

class DarkModeSwitch: UITableViewCell {

    @IBOutlet weak var darkModeSwitch: UISwitch!

    var switchToggled: ((Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        darkModeSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        

    }
    @objc func switchValueChanged(_ sender: UISwitch) {
            UserDefaults.standard.set(sender.isOn, forKey: "isDarkModeOn")
            switchToggled?(sender.isOn)
        
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
