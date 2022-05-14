//
//  PhotosGalleryTests.swift
//  PhotosGalleryTests
//
//  Created by Dipika Bari on 12/05/2022.
//

import XCTest
@testable import PhotosGallery

class PhotosGalleryTests: XCTestCase {

    var viewModel : PhotosViewModel!
    
    override func setUpWithError() throws {
        let viewController = HomeViewController()
        let mockNetworkManager = MockNetworkManager()
        
        viewModel = PhotosViewModel(delegate: viewController, networkManager: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchDataFromAPI_success(){
        viewModel.fetchData(text: "photo_search")
        XCTAssertEqual(viewModel.photosCount, 20)
    }
    
    func testFetchDataFromAPI_failure(){
        viewModel.fetchData(text: "photo_search_failure")
        XCTAssertEqual(viewModel.photosCount, 0)
    }

}
