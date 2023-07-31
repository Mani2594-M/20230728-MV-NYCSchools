//
//  SchoolViewModelTests.swift
//  20230728-MV-NYCSchoolsTests
//
//  Created by Mani V on 7/31/23.
//

import XCTest
@testable import _0230728_MV_NYCSchools

class SchoolViewModelTests: XCTestCase {
    
    var viewModel: SchoolViewModel!
    
    var school = School(dbn: "", school_name: "Test name", sat_critical_reading_avg_score: "", sat_math_avg_score: "", sat_writing_avg_score: "")
    
    override func setUp() {
        super.setUp()
        
        viewModel = SchoolViewModel()
    }
    
    override func tearDown() {
        
        viewModel = nil
        super.tearDown()
    }
    
    func test_getNumberOfSchools() {
        
        viewModel.schools = [school]
        XCTAssertEqual(viewModel.getNumberOfSchools(), 1)
    }
    
    func test_getSchoolName() {
        
        viewModel.schools = [school]
        XCTAssertEqual(viewModel.getSchoolName(index: 0), "Test name")
    }
}

