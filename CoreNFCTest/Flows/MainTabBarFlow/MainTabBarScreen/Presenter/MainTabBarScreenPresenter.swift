//
//  MainTabBarScreenPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

final class MainTabBarScreenPresenter: MainTabBarScreenModuleInput {

    // MARK: - Properties

    weak var view: MainTabBarScreenViewInput?
    var router: MainTabBarScreenRouterInput?
    var output: MainTabBarScreenModuleOutput?

}

// MARK: - MainTabBarScreenViewOutput

extension MainTabBarScreenPresenter: MainTabBarScreenViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
    }

}
