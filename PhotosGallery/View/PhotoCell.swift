//
//  PhotoCell.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 12/05/2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var searchedPic: UIImageView!

    let picImageView = UIImageView(frame: CGRect(x:0, y:0, width:50, height:50))
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        picImageView.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(picImageView)
            NSLayoutConstraint.activate([
                picImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                picImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                picImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                picImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            ])
           
            self.contentView.backgroundColor = .lightGray
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(photos: Photos){
    //let imageUrlString = "https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_150.jpg"
        
        let imageUrlString = photos.previewURL
        
        print("Inside Photocell :-> \(imageUrlString)")

        let imageUrl:URL = URL(string: imageUrlString)!
        
        picImageView.loadImage(withUrl: imageUrl)
    
    }
    
}

/**Display the image using url**/
extension UIImageView {
    func loadImage(withUrl url: URL) {
           DispatchQueue.global().async { [weak self] in
               if let imageData = try? Data(contentsOf: url) {
                   if let image = UIImage(data: imageData) {
                       DispatchQueue.main.async {
                           self?.image = image
                       }
                   }
               }
           }
       }
}
