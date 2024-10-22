//
//  StringsHelper.swift
//  NYCSchools
//
//  Created by Malith Kavinda on 2024-10-23.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(params: CVarArg...) -> String {
        return String(format: localized(), arguments: params)
    }
}
