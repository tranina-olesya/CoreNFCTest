//
//  AddRecordViewController.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import ReactiveDataDisplayManager

final class AddRecordScreenViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: AddRecordScreenViewOutput?

    // MARK: - Private Properties

    private lazy var adapter = BaseTableDataDisplayManager(collection: tableView)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

extension AddRecordScreenViewController: AddRecordScreenViewInput {

    func setupInitialState() {
        fillAdapter()
    }

}

// MARK: - Adapter

private extension AddRecordScreenViewController {

    func fillAdapter() {
        adapter.clearCellGenerators()

        let generators = NDEFWriteType.allCases.map { type -> BaseCellGenerator<NDEFTypeCell> in
            let generator = BaseCellGenerator<NDEFTypeCell>(with: type)
            generator.didSelectEvent += { [weak self] in
                self?.output?.typeSelected(type: type)
            }
            return generator
        }

        adapter.addCellGenerators(generators)
    }

}
