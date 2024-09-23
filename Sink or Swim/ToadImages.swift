//
//  ToadImages.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/20/24.
//
//  Code from Eric Larson Flipped Module 1

import UIKit

// ViewController class responsible for displaying an image with zoom functionality, adjusting contrast, and setting a rating
class ToadImages: UIViewController, UIScrollViewDelegate {

    // Lazy-loaded instance to retrieve the toad images
    lazy var toadImages: BaseToadImages = {
        return BaseToadImages.sharedInstance()
    }()
    
    // Lazy initialization of the UIImageView that will display the toad image
    lazy private var imageView: UIImageView? = {
        return UIImageView(image: self.toadImages.getImageWithName(displayImageName))
    }()
    
    // Outlets for scroll view, rating label, stepper, and contrast slider
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingStepper: UIStepper!
    @IBOutlet weak var contrastSlider: UISlider!
    
    // Variables for rating, contrast image manipulation, and timer for reverting contrast changes
    var ratingValue: Int = 0
    var savedRating: Int = 0
    
    var displayImageName = "i jus lost my dawg" // Placeholder name for the image being displayed
    var ogImage: UIImage? // The original image
    var newImage: UIImage? // The modified image after contrast adjustment
    var contrastTimer: Timer?

    // Action method for when the stepper value changes (rating adjustment)
    @IBAction func raterValueChanged(_ sender: UIStepper) {
        ratingValue = Int(sender.value)
        ratingLabel.text = "\(ratingValue)/10" // Update rating label
        
        // Save the rating for the current image using UserDefaults
        UserDefaults.standard.set(ratingValue, forKey: displayImageName)
        print("Stepper value changed to: \(ratingValue) for \(displayImageName)") // Debug print
    }
    
    // Action method for when the contrast slider value changes
    @IBAction func contrastValueChanged(_ sender: UISlider) {
        let contrastValue = sender.value
        // Apply contrast adjustment to the image
        newImage = applyContrast(to: ogImage, contrast: contrastValue)
        imageView?.image = newImage
        
        // Invalidate the existing timer and start a new one to revert the image after 5 seconds
        contrastTimer?.invalidate()
        contrastTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(revertImage), userInfo: nil, repeats: false)
    }
    
    // Action method for confirming the contrast adjustment
    @IBAction func confirmPressed(_ sender: UIButton) {
        contrastTimer?.invalidate() // Cancel the revert timer
        ogImage = newImage ?? ogImage // Set the new image as the original
        contrastSlider.value = 1.0 // Reset the contrast slider
    }
    
    // Method to revert the image to its original state after the timer expires
    @objc func revertImage() {
        if let ogImage = ogImage {
            imageView?.image = ogImage
            contrastSlider.value = 1.0 // Reset the slider back to default value
        }
    }
    
    // Method to handle the accuracy of the contrast slider, triggering a timer
    @objc func contrastSliderAccuracy(_ sender: UISlider) {
        contrastTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(revertImage), userInfo: nil, repeats: false)
    }
    
    // Method to apply contrast adjustment to the image using Core Image filters
    func applyContrast(to image: UIImage?, contrast: Float) -> UIImage? {
        guard let image = image, let cgImage = image.cgImage else { return nil }
        
        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter(name: "CIColorControls")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(contrast, forKey: kCIInputContrastKey)
        
        guard let outputCIImage = filter?.outputImage else { return nil }
        
        let context = CIContext()
        if let outputCGImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) {
            return UIImage(cgImage: outputCGImage)
        }
        return nil
    }
    
    // Lifecycle method called after the view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the original image and add the image view to the scroll view
        ogImage = self.imageView?.image
        
        if let size = self.imageView?.image?.size {
            self.scrollView.delegate = self
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1 // Set the minimum zoom scale
            self.scrollView.maximumZoomScale = 1 // Set the maximum zoom scale
            self.scrollView.setZoomScale(0.2, animated: false) // Initial zoom scale
            
            // Retrieve saved rating from UserDefaults and set it to the stepper and label
            savedRating = UserDefaults.standard.integer(forKey: displayImageName)
            ratingStepper.minimumValue = 0
            ratingStepper.maximumValue = 10
            ratingStepper.stepValue = 1
            ratingStepper.value = Double(savedRating)
            ratingLabel.text = "\(savedRating)/10"
            
            // Initialize contrast slider values and add action for touch events
            contrastSlider.minimumValue = 0.5
            contrastSlider.maximumValue = 1.5
            contrastSlider.value = 1.0
            contrastSlider.addTarget(self, action: #selector(contrastSliderAccuracy(_:)), for: [.touchUpInside, .touchUpOutside])
        }
    }
    
    // Lifecycle method called before the view is shown
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Restore the saved rating when the view appears
        ratingStepper.value = Double(savedRating)
        ratingLabel.text = "\(savedRating)/10"
    }
    
    // UIScrollViewDelegate method to allow zooming
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
