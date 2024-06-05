//
//  MobileNativeTaskTests.swift
//  MobileNativeTaskTests
//
//  Created by kalyan chakravarthy on 06/06/24.
//

import XCTest
@testable import MobileNativeTask

final class MobileNativeTaskTests: XCTestCase {
    var interactor: HomeInteractor!
    var presenter: MockHomePresenter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        interactor = HomeInteractor()
        presenter = MockHomePresenter()
        interactor.presenter = presenter
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        interactor = nil
        presenter = nil
    }
    
    func testFetchData() {
        presenter.fetchData()
        XCTAssertTrue(presenter.didCalledFetchData)
    }
    
    func testViewDidLoad() {
        presenter.viewDidLoad()
        XCTAssertTrue(presenter.didCalledDidLoad)
    }
}

class MockHomePresenter: HomePresenterProtocol {
    var didCalledFetchData = false
    func fetchData() {
        didCalledFetchData = true
    }
    
   var didCalledDidLoad = false
    func viewDidLoad() {
        didCalledDidLoad = true
    }
    
    func update(data: [MobileNativeTask.UniversityViewModel]) {
        
    }
    
    func routeToDetailView(with model: MobileNativeTask.UniversityViewModel) {
        
    }
    
    func showErrorMessage(errorMsg: String) {
        
    }
    
    var models: [MobileNativeTask.UniversityViewModel] = []
    
   
}
