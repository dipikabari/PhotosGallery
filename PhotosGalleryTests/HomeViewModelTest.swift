//
//  HomeViewModelTest.swift
//  PhotosGalleryTests
//
//  Created by Dipika Bari on 16/05/2022.
//

import XCTest
@testable import PhotosGallery

class HomeViewModelTest: XCTestCase {

    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        //let viewController = HomeViewController()
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidSearchTextInput() {
        let inputText = "flowers"
        let result = viewModel.validateSearchUrl(searchText: inputText)
        XCTAssertNil(result)
        
        let inputText1 = "yellow flowers"
        let result1 = viewModel.validateSearchUrl(searchText: inputText1)
        XCTAssertNil(result1)
        
        let inputText2 = "3"
        let result2 = viewModel.validateSearchUrl(searchText: inputText2)
        XCTAssertNil(result2)
        
        let inputText3 = "m"
        let result3 = viewModel.validateSearchUrl(searchText: inputText3)
        XCTAssertNil(result3)

    }
    
    func testInvalidSearchTextInput() {
        let inputText = "+"
        let result = viewModel.validateSearchUrl(searchText: inputText)
        XCTAssertEqual("Oops! Invalid characters, Please try again!", result)
        
        let result1 = viewModel.validateSearchUrl(searchText: ">>>")
        XCTAssertEqual("Oops! Invalid characters, Please try again!", result1)
        
        XCTAssertEqual("Oops! Invalid characters, Please try again!", viewModel.validateSearchUrl(searchText: "$ %"))

    }
    
    
}
