//
//  PhotosJsonResponseModel.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 13/05/2022.
//

import Foundation

struct PhotosJsonResponseModel: Decodable {
    let hits : [Photos]
}

struct Photos: Decodable {
        let id: Int
        let pageURL: String
        let tags: String
        let previewURL: String
        let webformatURL: String
        let largeImageURL: String
}
