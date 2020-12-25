//
//  CategoryPresenter.swift
//  testIMG
//
//  Created by Petro GOLISHEVSKIY on 14.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CategoryPresentationLogic {
  func presentData(response: Category.Model.Response.ResponseType)
}

class CategoryPresenter: CategoryPresentationLogic {
  weak var viewController: CategoryDisplayLogic?
  
  func presentData(response: Category.Model.Response.ResponseType) {
    switch response {

    case .passData(text: let text):
        print(text + "from Presenter")
        let finishString = text + " GOLISHEVSKIY"
        viewController?.displayData(viewModel: Category.Model.ViewModel.ViewModelData.printToConsole(stringForPrint: finishString))
        
        
    case .formattData:
        print("formattData")
    }
  }
}
