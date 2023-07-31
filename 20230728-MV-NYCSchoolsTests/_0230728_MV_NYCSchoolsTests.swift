//
//  _0230728_MV_NYCSchoolsTests.swift
//  20230728-MV-NYCSchoolsTests
//
//  Created by Mani V on 7/28/23.
//

import XCTest
@testable import _0230728_MV_NYCSchools

class _0230728_MV_NYCSchoolsTests: XCTestCase {
    
    var sut: DownloadAPIClient!
    var mockURLSession: MockURLSession!
    var viewModel: SchoolViewModel?
    var school: School?
    
    override func setUp() {
        
        super.setUp()
        sut = DownloadAPIClient()
        mockURLSession = MockURLSession()
        sut.session = mockURLSession
    }
    
    override func tearDown() {
        
        super.tearDown()
        sut = nil
    }
    
    func testDownload_UsesExpectedHost() {
        
        let url = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        sut.downloadData(withUrl: url)
        guard let url1 = URL(string: url) else {
            XCTFail(); return
        }
        let urlComponents = URLComponents(url: url1, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.host, "data.cityofnewyork.us")
    }
    
    func testDownload_UsesExpectedPath() {
        
        let url = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        sut.downloadData(withUrl: url)
        guard let url1 = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else {
            XCTFail(); return
        }
        let urlComponents = URLComponents(url: url1, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.path, "/resource/f9bf-2cp4.json")
    }
}

extension _0230728_MV_NYCSchoolsTests {
    
    class MockURLSession: SessionProtocol {
        var url: URL?

        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
    }
}
