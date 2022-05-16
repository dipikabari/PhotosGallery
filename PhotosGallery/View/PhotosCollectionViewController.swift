//
//  PhotosCollectionViewController.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 12/05/2022.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    var photosViewModel: PhotosViewModel!
    var searchText: String = ""
    private let reuseIdentifier = "myPhoto"
    
    private let sectionInsets = UIEdgeInsets(
      top: 80.0,
      left: 20.0,
      bottom: 50.0,
      right: 20.0)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        photosViewModel = PhotosViewModel(delegate: self)
        photosViewModel.fetchData(text: searchText)
        
        collectionView!.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.title = "Gallery"
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }

    }
    
    /* Below IBAction is added to bring back navigation from PhotoDetailViewController to  PhotosCollectionViewController on 'x' button click */
    @IBAction func unwindToMain(segue: UIStoryboardSegue){
            
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                if let indexPaths = collectionView.indexPathsForSelectedItems{
                    let destinationController = segue.destination as! PhotoDetailViewController
                    destinationController.imageURL = photosViewModel.getLargeImageUrl(atIndex: indexPaths[0].row)
                    collectionView.deselectItem(at: indexPaths[0], animated: false)
                }
            }
        }
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosViewModel.photosCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCell
    
        if let myPhotos = photosViewModel?.getPhoto(atIndex: indexPath.row) {
            cell?.configureCell(photos: myPhotos)
        }
        return cell ?? UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showDetail", sender: nil)
    }

}

extension PhotosCollectionViewController: PhotosViewProtocol {
    func displayError(_ message: String) {
        DispatchQueue.main.async {

        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(doneButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
        
    }
    
}
