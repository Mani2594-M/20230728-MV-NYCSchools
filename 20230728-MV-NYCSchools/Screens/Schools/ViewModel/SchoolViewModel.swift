//
//  SchoolViewModel.swift
//  20230728-MV-NYCSchools
//
//  Created by Mani V on 7/28/23.
//

import Foundation

final class SchoolViewModel {
    
    var schools: [School] = []
    var school: School!
    
    // Used this closure for binding the data
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchSchools() {
        
        self.eventHandler?(.loading)
        APIManager.shared.fetchSchools { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let schools):
                self.schools = schools
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func getNumberOfSchools() -> Int {
        return schools.count
    }
    
    func getSchool(index: Int) -> School? {
        return schools[index]
    }
    
    func getSchoolName(index: Int) -> String? {
        return schools[index].school_name
    }
}

extension SchoolViewModel {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
