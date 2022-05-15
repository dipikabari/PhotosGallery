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
    init() {}
    
    internal func validateSearchUrl(searchText: String?) -> String? {
       // print(searchText?.containsSpecialCharacter)
       // guard let isValid = searchText?.containsSpecialCharacter else { return "" }
        
        if searchText?.containsSpecialCharacter == true {
            return "Oops!Invalid characters, Please try again!"
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

