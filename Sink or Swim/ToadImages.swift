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
    @IBOutlet weak var contrastSlider: UISlider!
    
    var ratingValue: Int = 0
    var savedRating: Int = 0

    
    
    @IBAction func raterValueChanged(_ sender: UIStepper) {
        ratingValue = Int(sender.value)
        print("Stepper value changed to: \(ratingValue)")  // Debugging print

        ratingLabel.text = "\(ratingValue)/10"
        
        UserDefaults.standard.set(ratingValue, forKey: "savedRating")

    }
    
    @IBAction func contrastValueChanged(_ sender: UISlider) {
        let contrastValue = sender.value
        newImage = applyContrast(to: ogImage, contrast: contrastValue)
        imageView?.image = newImage
        
        contrastTimer?.invalidate()
        contrastTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(revertImage), userInfo: nil, repeats: false)
    }
    
    @IBAction func confirmPressed(_ sender: UIButton) {
        contrastTimer?.invalidate()
        ogImage = newImage
    }
    
    @objc func revertImage() {
        if let ogImage = ogImage {
            imageView?.image = ogImage
            contrastSlider.value = 1.0
        }
    }
    
    @objc func contrastSliderAccuracy(_ sender: UISlider) {
        contrastTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(revertImage), userInfo: nil, repeats: false)
    }
    
    func applyContrast(to image: UIImage?, contrast:Float) -> UIImage? {
        guard let image = image, let cgImage = image.cgImage else { return nil}
        
        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter(name: "CIColorControls")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(contrast, forKey: kCIInputContrastKey)
        
        guard let outputCIImage = filter?.outputImage else { return nil }
        
        let context = CIContext()
        if let outputCGImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) {
            return UIImage(cgImage:outputCGImage)
        }
        return nil
    }
    //yuh
    var displayImageName = "i jus lost my dawg"
    var ogImage: UIImage?
    var newImage: UIImage?
    var contrastTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ogImage = self.imageView?.image


        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1
            self.scrollView.delegate = self
            
            savedRating = UserDefaults.standard.integer(forKey: "savedRating")
            ratingStepper.minimumValue = 0
            ratingStepper.maximumValue = 10
            ratingStepper.stepValue = 1
            ratingStepper.value = Double(savedRating)
            ratingLabel.text = "0/10"
            
            contrastSlider.minimumValue = 0.5
            contrastSlider.maximumValue = 1.5
            contrastSlider.value = 1.0
            contrastSlider.addTarget(self, action: #selector(contrastSliderAccuracy(_:)), for: [.touchUpInside, .touchUpOutside])

        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // Restore the rating when the view appears
            ratingStepper.value = Double(savedRating)
            ratingLabel.text = "\(savedRating)/10"
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
