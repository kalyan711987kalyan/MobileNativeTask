//
//  ViewController.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import UIKit

// View Protocol
protocol HomeViewProtocol: AnyObject {
    func updateSnapshot()
}

class HomeViewController: UIViewController, HomeViewProtocol {
    enum ViewControllerSection: Hashable {
        case main
    }
    var presenter: HomePresenterProtocol?
    
    @IBOutlet private weak var homeTableView: UITableView!
    private lazy var dataSource = makeDataSource()
    private let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        homeTableView.register(UITableViewCell.self,
            forCellReuseIdentifier: cellReuseIdentifier
        )
        presenter?.viewDidLoad()
        homeTableView.dataSource = dataSource
        homeTableView.delegate = self
    }
    
    func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<ViewControllerSection, UniversityViewModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(presenter?.models ?? [], toSection: .main)
        dataSource.apply(snapshot)
    }
    
    func refresh() {
        presenter?.fetchData()
    }
}

extension HomeViewController: UITableViewDelegate {
    private func makeDataSource() -> UITableViewDiffableDataSource<ViewControllerSection, UniversityViewModel> {

        return UITableViewDiffableDataSource(
            tableView: homeTableView,
            cellProvider: { [self]  tableView, indexPath, model in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier , for: indexPath)
                cell.textLabel?.numberOfLines = 0
                cell.textLabel?.text = model.stateProvince.emptyIfNil.isEmpty ? model.name : "\(model.name) \n\n \(model.stateProvince ?? "")"
                cell.selectionStyle = .none
                return cell
            }
        )
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model  = presenter?.models[indexPath.row] else { return }
        presenter?.routeToDetailView(with: model)
    }
}

extension HomeViewController {
    static func buildHomeView() -> HomeViewController {
        let view = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as! HomeViewController
        return view
    }
}

