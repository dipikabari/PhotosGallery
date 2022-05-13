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
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PhotosCollectionViewController") as? PhotosCollectionViewController
        self.navigationController?.pushViewController(vc!, animated: true)

       // self.performSegue(withIdentifier: "showCollectionImages", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "CandySpaceBackground.png")!)
    }

    

}

