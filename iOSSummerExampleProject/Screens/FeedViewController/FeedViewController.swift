//
//  FeedViewController.swift
//  iOSSummerExampleProject
//
//  Created by xcode on 08.08.2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

enum FeedSegue: String {
    case photo = "showDetails"
}

class FeedViewController: UIViewController {

    // MARK: - Enums

    private enum CellIds: String {
        case headerCell = "FeedHeaderCell"
        case categoriesCell = "FeedCategoriesCarousel"
    }

    private enum Cells: Int {
        case headerCell
        case categoriesCell
    }

    private enum Sections: Int {
        case header
        case categories
    }

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let feedSegue = FeedSegue(rawValue: segue.identifier ?? "") else {
            return
        }
        switch feedSegue {
        case .photo:
            let vc = segue.destination as? PhotoViewController
            vc?.indexPath = tableView.indexPathForSelectedRow
        }
    }


    // MARK: - Private Configuration

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: -UIApplication.shared.statusBarFrame.height, left: 0, bottom: 0, right: 0)
        tableView.register(UINib(nibName: "FeedHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "FeedHeaderView")
    }

    private func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

// MARK: - UITableViewDataSource and UITableViewDelegate

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section) {
        case .header?:
            return 1
        case .categories?:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = Sections(rawValue: indexPath.section) else {
            return UITableViewCell()
        }

        switch sectionType {
        case .header:
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "FeedHeaderCell", for: indexPath) as? FeedHeaderCell else {
                return UITableViewCell()
            }
            return headerCell
        case .categories:
            guard let categoriesCell = tableView.dequeueReusableCell(withIdentifier: "FeedCategoriesCarousel", for: indexPath) as? FeedCategoriesCarousel else {
                return UITableViewCell()
            }
            return categoriesCell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let sectionType = Sections(rawValue: indexPath.row) else {
            return 0.0
        }
        switch sectionType {
        case .header:
            return 250.0
        case .categories:
            return 138.0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionType = Sections(rawValue: section) else {
            return nil
        }
        switch sectionType {
        case .header:
            return nil
        case .categories:
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FeedHeaderView") as? FeedHeaderView else {
                return UIView()
            }
            view.configure(title: "Explore")
            return view
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let sectionType = Sections(rawValue: section) else {
            return 0.0
        }
        switch sectionType {
        case .header:
            return 0.0
        case .categories:
            return 66.0
        }
    }
}

extension UINavigationController {

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

}
