//
//  HomeRouter.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation
import UIKit

// Router Protocol
protocol HomeRouterProtocol: AnyObject {
    func routeToDetailView(with model: UniversityViewModel)
}

class HomeRouter:HomeRouterProtocol  {
    var viewController: UIViewController?

    func routeToDetailView(with model: UniversityViewModel) {
        let vc = DetailViewController.buildDetailView(model: model)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
