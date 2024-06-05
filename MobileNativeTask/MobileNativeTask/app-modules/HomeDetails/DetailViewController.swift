//
//  DetailViewController.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation
import UIKit

protocol DetailViewProtocol {
    
}

class DetailViewController: UIViewController, DetailViewProtocol {
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var countryCodeLbl: UILabel!
    @IBOutlet private weak var detailLbl: UILabel!

    var presenter: DetailViewPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Details"
        setUpUI()
    }
    
    private func setUpUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))

        guard let model = presenter?.model else { return }
        
        nameLbl.text = model.name
        countryCodeLbl.text = model.alphaTwoCode
        //detailLbl.text = "wsdfksadf lk "
        detailLbl.text = "\(model.stateProvince.emptyIfNil) \n\(model.country.emptyIfNil) \n\(model.webPages.first.emptyIfNil)"
    }
    
    @objc func refresh() {
        presenter?.refresh()
    }
}

extension DetailViewController {
    static func buildDetailView(model: UniversityViewModel) -> DetailViewController {
        let router = DetailViewRouter()
        let interactor = DetailViewInteractor()
        let view = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as! DetailViewController
        let presenter = DetailViewPresenter(interactor: interactor, router: router,view: view, model: model)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
