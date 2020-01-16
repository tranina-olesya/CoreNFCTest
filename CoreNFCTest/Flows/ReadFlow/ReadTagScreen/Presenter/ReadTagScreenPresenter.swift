//
//  ReadTagScreenPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

final class ReadTagScreenPresenter: ReadTagScreenViewOutput, ReadTagScreenModuleInput {

    // MARK: - Properties

    weak var view: ReadTagScreenViewInput?
    var router: ReadTagScreenRouterInput?
    var output: ReadTagScreenModuleOutput?

    // MARK: - ReadTagScreenViewOutput

    // MARK: - ReadTagScreenModuleInput

}
