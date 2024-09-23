//
//  Toad Lore.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/21/24.
//

import UIKit

// A view controller class that manages displaying lore information about toads, with options to switch between different lore segments.
class Toad_Lore: UIViewController {

    // IBOutlet for a custom label that will display the selected toad lore
    @IBOutlet weak var loreLabel: TopLabel!
    
    // IBOutlet for a segmented control that allows users to select different lore sections
    @IBOutlet weak var loreSegment: UISegmentedControl!
    
    // Called when the view is first loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the label text to match the initial selected segment in the UISegmentedControl
        updateLabel(for: loreSegment.selectedSegmentIndex)
                
        // Add a target-action mechanism for the UISegmentedControl that triggers when the user switches segments
        loreSegment.addTarget(self, action: #selector(loreSegmentValueChanged(_:)), for: .valueChanged)
    }
    
    // Method that gets called whenever the selected segment changes in the UISegmentedControl
    @objc func loreSegmentValueChanged(_ sender: UISegmentedControl) {
        // Update the label text based on the selected segment index
        updateLabel(for: sender.selectedSegmentIndex)
    }
    
    // Updates the text in the lore label based on the selected index in the segmented control
    func updateLabel(for index: Int) {
        // Switch statement that changes the content of the label based on the selected segment index
        switch index {
        case 0:
            loreLabel.text = """
"Toad" refers to a race of small, mushroom-like creatures found in the Mario franchise. First introduced in *Super Mario Bros.* (1985), Toads are characterized by their round shapes, vibrant mushroom caps, and cheerful demeanor. They are depicted as loyal attendants to Princess Peach and are often seen helping Mario throughout his adventures.

Key Characteristics of Toads:
- Appearance: Toads usually have white skin with colorful spots on their mushroom caps, which vary in color and pattern. Their friendly faces and small stature make them instantly recognizable. Toads typically wear simple clothing, often consisting of a vest or tunic.

- Role in the Games: Toads frequently serve as guides and helpers for Mario and Princess Peach, providing valuable assistance, items, and information. They often inhabit various locations in the Mushroom Kingdom and play critical roles in various game narratives. In some games, Toads offer mini-games or challenges, enhancing gameplay experience.

- Common Features: Toads are known for their distinctive speech patterns, often punctuated by phrases like "Toad!" and cheerful exclamations. Their upbeat attitude and willingness to help make them beloved characters among fans.
"""
        case 1:
            loreLabel.text = """
Toads are small, mushroom-like creatures introduced in Super Mario Bros. (1985) as loyal attendants to Princess Peach in the Mushroom Kingdom. They are characterized by their round shapes, colorful spots, and cheerful personalities.

Initially, Toads served as background characters, providing messages and guidance to Mario. Over time, they evolved into more prominent figures, appearing as playable characters in various games, including Mario Kart, Super Mario 3D World, and more.

The franchise has introduced various types of Toads, such as Toadette, who has become a popular female counterpart, and Toadsworth, the elder caretaker of Princess Peach. These characters often have distinct abilities and roles in gameplay.

Toads are not just limited to main series games; they also appear in spin-offs like Mario Party and Paper Mario, where they fulfill various functions, from guides to playable characters. Their friendly demeanor and recognizable design have made them fan favorites.

Throughout the years, Toads have become iconic in gaming culture, representing themes of friendship, support, and loyalty. Their enduring presence in the Mario franchise highlights their importance to the series' narrative and world-building.
"""
        default:
            // Fallback for any unexpected index values; the label is set to empty
            loreLabel.text = ""
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass any necessary information to the next view controller here.
    }
    */
}
