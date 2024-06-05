//
//  RealmDatabase.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation
import RealmSwift

class RealmDatabase {
    static let shared = RealmDatabase()
    private init() {}
    
    
    func updateObjects(with obj: UniversityRealmObject) {
        do {
            let realm = try! Realm()

            try realm.write {
                realm.add(obj, update: .modified)
            }
        }
        catch {
            fatalError("DB insertion failed")
        }
    }
    
    func getObjects() -> [UniversityRealmObject] {
        do {
            let realm = try! Realm()
            let objs = realm.objects(UniversityRealmObject.self)
            return objs.map{$0}
        }
        catch {
            fatalError("DB fetch failed")
        }
    }
}
