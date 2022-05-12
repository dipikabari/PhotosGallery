//
//  ViewController.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 12/05/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    
    
    @IBOutlet private weak var searchText: UITextField!
    
    @IBAction private func searchButton(_ sender: Any) {
        let searchInput = searchText.text
        print(searchInput)
        
        self.performSegue(withIdentifier: "showCollectionImages", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

