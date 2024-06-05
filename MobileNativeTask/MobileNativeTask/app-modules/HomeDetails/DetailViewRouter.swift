//
//  DetailViewRouter.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation
import UIKit

protocol DetailViewRouterProtocol {
    func refresh()
}

class DetailViewRouter: DetailViewRouterProtocol {
    var viewController: UIViewController?

    func refresh() {
        viewController?.navigationController?.popViewController(animated: true)
        if let vc = viewController?.navigationController?.viewControllers.first as? HomeViewController {
            vc.refresh()
        }
    }
}
