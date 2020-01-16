//
//  ReadTagScreenPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

final class ReadTagScreenPresenter: ReadTagScreenModuleInput {

    // MARK: - Properties

    weak var view: ReadTagScreenViewInput?
    var router: ReadTagScreenRouterInput?
    var output: ReadTagScreenModuleOutput?

}

// MARK: - ReadTagScreenViewOutput

extension ReadTagScreenPresenter: ReadTagScreenViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func uriChosen(uriPayload: URIPayload) {
        view?.openURL(url: uriPayload.url)
    }

}
