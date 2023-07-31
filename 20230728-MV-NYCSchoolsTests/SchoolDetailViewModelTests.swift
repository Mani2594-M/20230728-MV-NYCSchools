//
//  SchoolDetailViewModelTests.swift
//  20230728-MV-NYCSchoolsTests
//
//  Created by Mani V on 7/31/23.
//

import XCTest
@testable import _0230728_MV_NYCSchools

class SchoolDetailViewModelTests: XCTestCase {
    
    var detailViewModel: SchoolDetailViewModel!
    
    var school = School(dbn: "1", school_name: "School name", sat_critical_reading_avg_score: "110", sat_math_avg_score: "111", sat_writing_avg_score: "112")
    
    override func setUp() {
        
        super.setUp()
        detailViewModel = SchoolDetailViewModel(school: school)
    }
    
    override func tearDown() {
       
        super.tearDown()
        detailViewModel = nil
    }
    
    func test_getDbnValue() {
        
        XCTAssertEqual(detailViewModel.getDbnValue(), "DBN: 1")
    }
    
    func test_getReadingScore() {
        
        XCTAssertEqual(detailViewModel.getReadingScore(), "Reading Score: 110")
    }
    
    func test_getMathScore() {
        
        XCTAssertEqual(detailViewModel.getMathScore(), "Math Score: 111")
    }
    
    func test_getWritingScore() {
        
        XCTAssertEqual(detailViewModel.getWritingScore(), "Writing Score: 112")
    }
}
