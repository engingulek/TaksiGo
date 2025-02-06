//
//  HomeViewController.swift
//  HomeModule
//
//  Created by Engin Gülek on 4.02.2025.
//

import Foundation
import UIKit
import SnapKit
class HomeViewController : UIViewController {
    private lazy var mapUIView = MapUIView()
    private lazy var taxiInfoView = TaxiInfoView(self)
    lazy var presenter : ViewToPrensenterHomeProtocol = HomePresenter(view:self, intetactor: HomeInteractor())
    override func viewDidLoad() {
        super.viewDidLoad()
        mapUIView.presenter = presenter
        presenter.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.addSubview(taxiInfoView)
        taxiInfoView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 3)
        }
        view.addSubview(mapUIView)
        mapUIView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(taxiInfoView.snp.top)
        }
    }
}

//MARK: PresenterToViewHomeProtocol
extension HomeViewController : PresenterToViewHomeProtocol {
    func titleContract(title: TitleContract) {
        taxiInfoView.titleData(title: title.buttonTitle)
    }
    
    func locationInfo(state: Bool, text: String) {
        mapUIView.ableFuncs(able: .setLocationInfo(state, text))
    }
    

    func updateLocation(location: (latitude: Double, longitude: Double),meters:Double) {
        mapUIView.ableFuncs(able: .updateLocation(location, meters))
       
    }
    
    func errorState(state: Bool, errorMessage: String) {
        mapUIView.ableFuncs(able: .errorState(state, errorMessage))
    }
    
 
}


extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaxiTypeCVC.identifier, for: indexPath) as? TaxiTypeCVC else {return UICollectionViewCell()}
        let taxiType = presenter.cellForItem(at: indexPath)
        cell.configureData(taxiType: taxiType)
        if indexPath.item == 1 {
            cell.configureUI()
        }
        return cell
    }
}


extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = presenter.insetForSectionAt()
        return UIEdgeInsets(top: inset.top, left: inset.left, bottom: inset.bottom, right: inset.right)
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return presenter.sizeForItemAt(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
     }
}


