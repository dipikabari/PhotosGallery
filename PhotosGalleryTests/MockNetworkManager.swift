//
//  MockNetworkManager.swift
//  PhotosGalleryTests
//
//  Created by Dipika Bari on 14/05/2022.
//

import Foundation
@testable import PhotosGallery

class MockNetworkManager: Networkable {
    
    func fetchData(text: String, completion: @escaping (PhotosJsonResponseModel?, Error?) -> Void) {
        let bundle = Bundle(for:MockNetworkManager.self)
        
        guard let url = bundle.url(forResource:text, withExtension:"json"),
              let data = try? Data(contentsOf: url)

        else {
            return
        }
        
         do {
            let result: PhotosJsonResponseModel = try JSONDecoder().decode(PhotosJsonResponseModel.self, from: data)
            completion(result, nil)
        }catch let error {
            completion(nil, error)
        }
    }
}
