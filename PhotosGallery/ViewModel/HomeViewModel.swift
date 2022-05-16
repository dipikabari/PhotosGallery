//
//  HomeViewModel.swift
//  PhotosGallery
//
//  Created by Dipika Bari on 15/05/2022.
//

import Foundation
import UIKit

protocol HomeDelegate {
    func validateSearchUrl(searchText: String?) -> String?
}

class HomeViewModel {
    
    func validateSearchUrl(searchText: String?) -> String? {
        if searchText?.containsSpecialCharacter == true {
            return  Constants.inValidTextMessage
        }else {
            return nil
        }
    }
}

extension String {
   var containsSpecialCharacter: Bool {
      let regex = ".*[^ A-Za-z0-9].*"
      let testString = NSPredicate(format:"SELF MATCHES %@", regex)
      return testString.evaluate(with: self)
   }
}

