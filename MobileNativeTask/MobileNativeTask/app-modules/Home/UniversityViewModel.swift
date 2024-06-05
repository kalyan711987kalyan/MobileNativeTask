//
//  UniversityViewModel.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation

struct UniversityViewModel: Codable, Hashable {
    let alphaTwoCode: String
    let domains: [String]
    let name: String
    let webPages: [String]
    let country, stateProvince: String?
    let id = UUID().uuidString
    
    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case domains, name
        case webPages = "web_pages"
        case country
        case stateProvince = "state-province"
    }
}
