//
//  EveryToadCollectionViewController.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/21/24.
//
//  Code from Eric Larson flipped module 1

import UIKit

// A private constant for the reuse identifier of collection view cells
private let reuseIdentifier = "ToadCollectCell"

// The main view controller class for displaying toad images in a collection view
class EveryToadCollectionViewController: UICollectionViewController {
    
    // Called when the view is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes, though this line is commented out, you would normally use it to register a custom or default UICollectionViewCell.
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // Lazy initialization of the toad images, ensuring that BaseToadImages is only loaded when needed.
    lazy var toadImages: BaseToadImages = {
        return BaseToadImages.sharedInstance()
    }()
    
    // MARK: - UICollectionViewDataSource

    // Specifies the number of sections in the collection view. Here, it is set to 1.
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    // Specifies the number of items in the section. This is based on the number of images in the `toadImages` array.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.toadImages.numberOfImages()
    }

    // Configures and returns the cell for each item in the collection view.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Attempts to dequeue a reusable cell using the specified reuse identifier.
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? EveryToadCollectionViewCell {
            
            // Get the image for the current index and set it to the cell's image view
            let name = self.toadImages.getImageWith(indexPath.row)
            cell.toadImageView.image = name
            
            // Optional: Uncomment this line if you want to set a background color for the cell (currently commented out)
            //cell.backgroundColor = UIColor.red
            
            return cell
        } else {
            // If the cell could not be dequeued, throw a fatal error.
            fatalError("Could not dequeue cell")
        }
    }

    // MARK: - UICollectionViewDelegate (optional)

    /*
    // Uncomment this method if you want to allow items to be highlighted when tapped
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method if you want to allow selection of collection view items
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods if you want to display a menu for an item or allow for additional actions when an item is long-pressed or selected.
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
}
