//
//  CategoryViewController.swift
//  testIMG
//
//  Created by Petro GOLISHEVSKIY on 14.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Firebase

protocol CategoryDisplayLogic: class {
    func displayData(viewModel: Category.Model.ViewModel.ViewModelData)
}

class CategoryViewController: UIViewController, CategoryDisplayLogic {
    
    @IBOutlet weak var collection: UICollectionView!
    
    let ref = Storage.storage().reference().child("Category")
    
    var interactor: CategoryBusinessLogic?
    var router: (NSObjectProtocol & CategoryRoutingLogic)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = CategoryInteractor()
        let presenter             = CategoryPresenter()
        let router                = CategoryRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        
        collection.delegate = self
        collection.dataSource = self
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        interactor?.makeRequest(request: Category.Model.Request.RequestType.printName(name: "Petro"))
    }
    
    func displayData(viewModel: Category.Model.ViewModel.ViewModelData) {
        
        switch viewModel {
        
        case .printToConsole(stringForPrint: let stringForPrint):
            print(stringForPrint + "from ViewController")
        }
    }
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width-20, height: 100 )
    }
}

