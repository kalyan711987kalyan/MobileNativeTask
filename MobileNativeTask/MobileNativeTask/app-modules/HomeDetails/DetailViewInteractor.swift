//
//  DetailViewInteractor.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation

protocol DetailViewInteractorProtocol: AnyObject { }

class DetailViewInteractor: DetailViewInteractorProtocol {
    weak var presenter: DetailViewPresenterProtocol?
    
}
