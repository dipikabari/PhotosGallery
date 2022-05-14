//
//  PhotosViewProtocol.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 13/05/2022.
//

import Foundation

protocol PhotosViewProtocol: AnyObject {
    func displayError(_ message: String)
    func refreshUI()
}
