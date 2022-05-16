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
        setImageView(imageURL: photos.previewURL)
    }
    
    private func setImageView(imageURL:String) {
        
        ImageDownloader.shared.getImage(url: imageURL) { [weak self] data in
            DispatchQueue.main.async {
                self?.picImageView.image = UIImage(data: data)
                //self?.picImageView.contentMode = UIView.ContentMode.scaleAspectFit
                self?.addSubview(self?.picImageView ?? UIImageView())
            }
        }
    }
}

