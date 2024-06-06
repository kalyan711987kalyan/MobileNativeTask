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
    init(presenter: HomePresenterProtocol? = nil) {
        self.presenter = presenter
    }
    
    func updateToRealm(data: [UniversityViewModel]) {
        let repository = RealmDatabase<UniversityRealmObject>()
        do {
           try data.forEach { model in
               try repository.saveObject(obj: UniversityRealmObject(model: model))
            }
        }
        catch {}
    }
    
    func fetchObjsFromRealm() {
        let repository = RealmDatabase<UniversityRealmObject>()
        let objs = repository.fetchAll()
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
