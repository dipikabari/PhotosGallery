//
//  PhotoDetailViewController.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 16/05/2022.
//

import Foundation
import UIKit

class PhotoDetailViewController: UIViewController {
    var imageURL: String = ""
    
    @IBOutlet weak var photoLargeImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageDownloader.shared.getImage(url: imageURL) { [weak self] data in
            DispatchQueue.main.async {
                self?.photoLargeImageView.image = UIImage(data: data)
            }
        }

    }
}
