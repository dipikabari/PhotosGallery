//
//  ServiceError.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 13/05/2022.
//

import Foundation

enum ServiceError: Error {
    case requestFailed
    case dataNotFound
    case jsonParsingFailed
    case jsonConversionFailed
    case responseUnsuccessful
}
