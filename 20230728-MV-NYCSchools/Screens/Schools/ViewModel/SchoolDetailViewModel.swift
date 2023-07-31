//
//  SchoolDetailViewModel.swift
//  20230728-MV-NYCSchools
//
//  Created by Mani V on 7/31/23.
//

import Foundation

class SchoolDetailViewModel {
    
    var school: School!
    
    init(school: School) {
        
        self.school = school
    }

    func getDbnValue() -> String? {
        
        return SchoolDetailsConstants.dbn + ":" + " " + (school.dbn ?? "")
    }
    
    func getReadingScore() -> String {
        
        return SchoolDetailsConstants.readingScore + ":" + " " + (school.sat_critical_reading_avg_score ?? "")
    }
    
    func getMathScore() -> String? {
        
        return SchoolDetailsConstants.mathScore + ":" + " " + (school.sat_math_avg_score ?? "")
    }
    
    func getWritingScore() -> String? {
        
        return SchoolDetailsConstants.writingScore + ":" + " " + (school.sat_writing_avg_score ?? "")
    }
}
