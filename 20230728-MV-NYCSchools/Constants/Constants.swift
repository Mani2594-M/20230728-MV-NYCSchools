//
//  Constants.swift
//  20230728-MV-NYCSchools
//
//  Created by Mani V on 7/28/23.
//

import Foundation

enum Constant {
    
    enum API {
        static let schoolUrl = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    }
}

struct SchoolDetailsConstants {
    
    static let dbn = "DBN"
    static let readingScore = "Reading Score"
    static let mathScore = "Math Score"
    static let writingScore = "Writing Score"
}

struct SegueConstants {
    
    static let schoolDetails = "SchoolDetails"
}
