//
//  ViewController.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 12/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModelObj: PhotosViewModel!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var searchText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "CandySpaceBackground.png")!)
        
        viewModelObj = PhotosViewModel(delegate: self)
    }
    
    @IBAction private func searchButton(_ sender: Any) {
        let searchInput = searchText.text
        print(searchInput ?? "")
        
        print("Search button")
        viewModelObj.fetchData(text: searchText.text ?? "")
        
        
        let photosVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PhotosCollectionViewController") as? PhotosCollectionViewController
        photosVC?.viewModelObj = viewModelObj
        photosVC?.searchText = searchInput ?? ""
        self.navigationController?.pushViewController(photosVC!, animated: true)

       // self.performSegue(withIdentifier: "showCollectionImages", sender: nil)
    }
    
}

extension HomeViewController: PhotosViewProtocol {
    func displayError(_ message: String) {
        DispatchQueue.main.async {

        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(doneButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func refreshUI() {
        
    }
    
}
