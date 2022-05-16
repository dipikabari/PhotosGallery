//
//  ViewController.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 12/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeViewModel: HomeViewModel!
    
    @IBOutlet private weak var searchText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "CandySpaceBackground.png")!)
        
        homeViewModel = HomeViewModel()
    }
    
    @IBAction private func searchButton(_ sender: Any) {
        print("Search button")
        
        //
        guard let message = homeViewModel.validateSearchUrl(searchText: searchText.text ?? "")
        else {
            navigateToPhotosScreen()
            return
            
        }
        print(message)
        Utility.shared.showAlert(self, "Alert!", message)
        
    }
        func navigateToPhotosScreen()  {
            let photosVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PhotosCollectionViewController") as? PhotosCollectionViewController
          
            photosVC?.searchText = searchText.text ?? ""
            self.navigationController?.pushViewController(photosVC!, animated: true)


        }
        
    
}
