//
//  ToadImages.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/20/24.
//

//Code from Eric Larson Flipped Module 1

import UIKit

class ToadImages: UIViewController, UIScrollViewDelegate {

    lazy var toadImages:BaseToadImages = {
        return BaseToadImages.sharedInstance()
    }()
    
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: self.toadImages.getImageWithName(displayImageName))
    }()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingStepper: UIStepper!
    
    @IBAction func raterValueChanged(_ sender: UIStepper) {
        let ratingValue = Int(sender.value)
        print("Stepper value changed to: \(ratingValue)")  // Debugging print

        ratingLabel.text = "\(ratingValue)/10"
    }
    //yuh
    var displayImageName = "i jus lost my dawg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1
            self.scrollView.delegate = self
            
            ratingStepper.minimumValue = 0
            ratingStepper.maximumValue = 10
            ratingStepper.stepValue = 1
            ratingStepper.value = 0
            ratingLabel.text = "0/10"
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destinationVC = segue.destination as? AnotherViewController {
//            destinationVC.rating = ratingValue
//        }
//    }
    


}
