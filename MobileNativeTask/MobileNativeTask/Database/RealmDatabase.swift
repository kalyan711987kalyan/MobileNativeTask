//
//  RealmDatabase.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol {
    associatedtype EntityType
    func saveObject(obj: EntityType) throws
    func fetchAll() -> [EntityType]
}

class RealmDatabase<T>: RealmServiceProtocol where T: Object {
    private let realm = try! Realm()

    func saveObject(obj: T) throws {
        try realm.write {
            realm.add(obj, update: .all)
        }
    }

    func fetchAll() -> [T] {
        return realm.objects(T.self).compactMap {
            $0
        }
    }
}
