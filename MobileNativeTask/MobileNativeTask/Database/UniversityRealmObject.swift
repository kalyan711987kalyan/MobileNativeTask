//
//  UniversityRealmObject.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation
import RealmSwift

class UniversityRealmObject: Object {
    @objc dynamic var alphaTwoCode: String = ""
    var domains: [String] = []
    @objc dynamic var name: String = ""
    var webPages: [String] = []
    @objc dynamic var country: String = ""
    @objc dynamic var stateProvince: String = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }
}

extension UniversityViewModel {
    
    init(from realmObj: UniversityRealmObject) {
        self.alphaTwoCode = realmObj.alphaTwoCode
        self.domains = realmObj.domains
        self.name = realmObj.name
        self.webPages =  realmObj.webPages
        self.country = realmObj.country
        self.stateProvince = realmObj.stateProvince
    }
}

extension UniversityRealmObject {
    convenience init(model: UniversityViewModel) {
        self.init()
        alphaTwoCode = model.alphaTwoCode
        domains = model.domains
        name = model.name
        webPages = model.webPages
        country = model.country.emptyIfNil
        stateProvince = model.stateProvince.emptyIfNil
    }
}
