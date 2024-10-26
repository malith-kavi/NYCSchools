//
//  SchoolsViewModel.swift
//  NYCSchools
//
//  Created by Malith Kavinda on 2024-10-21.
//

import Foundation
import Combine


class SchoolsViewModel {
    @Published private(set) var schools: [School] = []
    @Published private(set) var error: DataError? = nil
    private(set) var schoolSectionsList: [SchoolSection]?
    
    private let apiService: SchoolAPILogic
    
    init(apiService: SchoolAPILogic = SchoolAPI()){
        self.apiService = apiService
    }
    
    func getSchools() {
        apiService.getSchools { [weak self] result in
            switch result {
            case .success(let schools):
                self?.schools = schools ?? []
                
            case .failure(let error):
                self?.error = error
                
            }
        }
    }
    
    private func prepareSchoolSections() {
        var listOfSections = [SchoolSection]()
        var schoolDictionary = [String: SchoolSection]()
        
        for school in schools {
            if let city = school.city{
                if schoolDictionary[city] != nil {
                    schoolDictionary[city]?.schools.append(school)
                } else {
                    var newSection = SchoolSection(city: city,
                                                   schools: [])
                    newSection.schools.append(school)
                    schoolDictionary[city] = newSection
                }
            }
        }
        listOfSections = Array(schoolDictionary.values)
        listOfSections.sort {
            return $0.city < $1.city
        }
        schoolSectionsList = listOfSections
    }
}
