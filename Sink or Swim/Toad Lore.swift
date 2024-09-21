//
//  Toad Lore.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/21/24.
//

import UIKit

class Toad_Lore: UIViewController {

    @IBOutlet weak var loreLabel: TopLabel!
    @IBOutlet weak var loreSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel(for: loreSegment.selectedSegmentIndex)
                
                // Add target for value changed
                loreSegment.addTarget(self, action: #selector(loreSegmentValueChanged(_:)), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func loreSegmentValueChanged(_ sender: UISegmentedControl) {
        // Update label text based on selected segment
        updateLabel(for: sender.selectedSegmentIndex)
    }
    
    func updateLabel(for index: Int) {
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
            loreLabel.text = ""
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
