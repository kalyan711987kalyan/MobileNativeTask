//
//  HomePresenter.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation
import UIKit
import SVProgressHUD

// Presenter Protocol
protocol HomePresenterProtocol: AnyObject {
    func viewDidLoad()
    func fetchData()
    func update(data: [UniversityViewModel])
    func routeToDetailView(with model: UniversityViewModel)
    func showErrorMessage(errorMsg: String)
    var models: [UniversityViewModel] { get set }
}

final class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    var models: [UniversityViewModel] = []
    
    init(view: HomeViewProtocol? = nil, interactor: HomeInteractorProtocol? = nil, router: HomeRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        SVProgressHUD.show()
        interactor?.fetchData()
        interactor?.fetchData()
    }
    
    func update(data: [UniversityViewModel]) {
        models = data
        view?.updateSnapshot()
        SVProgressHUD.dismiss()
    }
    
    func showErrorMessage(errorMsg: String) {
        SVProgressHUD.dismiss()
        SVProgressHUD.showInfo(withStatus: errorMsg)
    }
    
    func routeToDetailView(with model: UniversityViewModel) {
        router?.routeToDetailView(with: model)
    }
}
