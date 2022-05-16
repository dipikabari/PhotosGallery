//
//  PhotosCollectionViewController.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 12/05/2022.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    var viewModelObj: PhotosViewModel!
    var searchText: String = ""
    private let spacing:CGFloat = 16.0

    private let reuseIdentifier = "myPhoto"
    
    private let sectionInsets = UIEdgeInsets(
      top: 80.0,
      left: 20.0,
      bottom: 50.0,
      right: 20.0)
 
    @IBAction func unwindToMain(segue: UIStoryboardSegue){
            
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelObj = PhotosViewModel(delegate: self)
        viewModelObj.fetchData(text: searchText)
        
        
        collectionView!.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.title = "Gallery"
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        
        
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                if let indexPaths = collectionView.indexPathsForSelectedItems{
                    let destinationController = segue.destination as! PhotoDetailViewController
                    destinationController.imageURL = viewModelObj.getLargeImageUrl(atIndex: indexPaths[0].row)
                    collectionView.deselectItem(at: indexPaths[0], animated: false)
                }
            }
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

  
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelObj.photosCount
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCell
    
        cell?.backgroundColor = .green
        
        if let myPhotos = viewModelObj?.getPhoto(atIndex: indexPath.row) {
            cell?.configureCell(photos: myPhotos)
        }
        return cell ?? UICollectionViewCell()
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped item \(indexPath.row)")
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
