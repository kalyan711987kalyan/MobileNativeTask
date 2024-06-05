//
//  DetailViewPresenter.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation

protocol DetailViewPresenterProtocol: AnyObject {
    var model: UniversityViewModel {get set}
    func refresh()
}

class DetailViewPresenter: DetailViewPresenterProtocol {
    var model: UniversityViewModel
    var interactor: DetailViewInteractorProtocol?
    var router: DetailViewRouterProtocol?
    var view: DetailViewProtocol?
    
    init(interactor: DetailViewInteractorProtocol? = nil, router: DetailViewRouterProtocol? = nil, view: DetailViewProtocol? = nil, model: UniversityViewModel) {
        self.interactor = interactor
        self.router = router
        self.view = view
        self.model = model
    }
    
    func refresh() {
        router?.refresh()
    }
    
}
