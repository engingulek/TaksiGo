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
    private lazy var mapUIView = MapUIView(self)
    private lazy var taxiInfoView = TaxiInfoView(self)
    lazy var presenter : ViewToPrensenterHomeProtocol = HomePresenter(view:self, intetactor: HomeInteractor())
    override func viewDidLoad() {
        super.viewDidLoad()
        mapUIView.presenter = presenter
        taxiInfoView.presenter = presenter
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

//MARK: HomeViewController : PresenterToViewHomeProtocol
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
    
    func reloadCollectionView() {
        taxiInfoView.reloadCollectionView()
    }
    
    func setTaxiInfoToMap(list: [TaxiInfoElement]) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            mapUIView.removeAnnotations()
            mapUIView.addCustomAnnotations(list: list)
           
        }
    }
    
   func setMessageLabelOnTaxiInfoView(isHidden: Bool, text: String) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            taxiInfoView.messageSetLabel(isHidden: isHidden, message: text)
        }
    }
}

//MARK: HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TaxiTypeCVC.identifier,
            for: indexPath) as? TaxiTypeCVC else {return UICollectionViewCell()}
        
     
        let info = presenter.cellForItem(at: indexPath)
        let price = presenter.distanceKm(price: info.data.kmPrice)
        cell.configureData(cellType: info.data,estimatedPrice: price)
        cell.configureUI(color: info.borderColor, width: info.borderWidth, cornerRadius: info.borderCornerRadius)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}

//MARK: HomeViewController : UICollectionViewDelegateFlowLayout
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
            let inset = presenter.insetForSectionAt()
            return UIEdgeInsets(top: inset.top, left: inset.left, bottom: inset.bottom, right: inset.right)
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return presenter.sizeForItemAt(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
}


