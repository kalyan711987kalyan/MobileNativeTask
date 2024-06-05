//
//  HomeInteractor.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation
import RealmSwift

// Interactor Protocol
protocol HomeInteractorProtocol: AnyObject {
    func fetchData()
}

final class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomePresenterProtocol?
    var realmDatabase: RealmDatabase
    init(presenter: HomePresenterProtocol? = nil, realmDatabase: RealmDatabase = RealmDatabase.shared) {
        self.presenter = presenter
        self.realmDatabase = realmDatabase
    }
    
    func updateToRealm(data: [UniversityViewModel]) {
        data.forEach { model in
            realmDatabase.updateObjects(with: UniversityRealmObject(model: model))
        }
    }
    
    func fetchObjsFromRealm() {
        let objs =  realmDatabase.getObjects()
        let models = objs.map { obj in
            return UniversityViewModel(from: obj)
        }
        presenter?.update(data: models)
    }
    
    func fetchData() {
        guard Reachability.isConnectedToNetwork() else {
            fetchObjsFromRealm()
            return
        }
        NetworkManager.shared.fetchSearchData { [self] result in
            switch result {
            case .success(let models):
                presenter?.update(data: models)
                updateToRealm(data: models)
            case .failure(let failure):
                presenter?.showErrorMessage(errorMsg: failure.localizedDescription)
            }
        }
    }
}
