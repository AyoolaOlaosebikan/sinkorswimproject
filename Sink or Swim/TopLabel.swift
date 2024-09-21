//
//  TopLabel.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/21/24.
//

import UIKit

class TopLabel: UILabel {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let topRect = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: rect.size.height)
                super.drawText(in: topRect)
    }
    

}
