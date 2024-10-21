//
//  MockSchoolAPI.swift
//  NYCSchoolsTests
//
//  Created by Malith Kavinda on 2024-10-22.
//

import Foundation
@testable import NYCSchools

class MockSchoolAPI: SchoolAPILogic {
    var loadState: SchoolListLoadState = .empty
    
    func getSchools(completion: @escaping (SchoolListAPIResponse)) {
        switch loadState {
        case .error:
            completion( .failure(.networkingError("Could not fetch schools")))
        case .loaded:
            let mock = School(dbn: <#T##String#>,
                              schoolName: <#T##String?#>,
                              overviewParagraph: <#T##String?#>,
                              schoolEmail: <#T##String?#>,
                              academicOpportunities1: <#T##String?#>,
                              academicOpportunities2: <#T##String?#>,
                              neighborhood: <#T##String?#>,
                              phoneNumber: <#T##String?#>,
                              website: <#T##String?#>,
                              finalgrades: <#T##String?#>,
                              totalStudents: <#T##String?#>,
                              schoolSports: <#T##String?#>,
                              primaryAddressLine: <#T##String?#>,
                              city: <#T##String?#>,
                              zip: <#T##String?#>,
                              latitude: <#T##String?#>,
                              longitude: <#T##String?#>)
            completion(.success([mock]))
        case .empty:
            completion(.success([]))
        }
    }
}
