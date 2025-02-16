//
//  HomePresenter.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation
import CoreKit
final class HomePresenter{
    weak var view:PresenterToViewHomeProtocol?
    private var intetactor : PresenterToInteractorHomeProtocol
    private var userLocation : (latitude: Double, longitude: Double)?
    private var selectedLocation: (latitude: Double, longitude: Double)?
    private var taxiTypeCellList : [TaxiCellInfo] = []
    private var locationManagerDelegate = LocationManager()
    private var selectedTaxiTypeIndex : IndexPath = [0,0]
    
    init(view: PresenterToViewHomeProtocol?,
         intetactor:PresenterToInteractorHomeProtocol) {
        self.view = view
        self.intetactor = intetactor
        locationManagerDelegate.delegate = self
    }
    
    // get location info 
    private func locationInfoAction(location: (latitude: Double, longitude: Double)){
        locationManagerDelegate.getLocationInfo(location: location) {[weak self] state, text in
            guard let self = self else {return}
            let street = "\(text) \(TextTheme.street.localized)"
            view?.locationInfo(state: state, text: state ? "" : street)
        }
    }
}


//MARK: HomePresenter: ViewToPrensenterHomeProtocol
extension HomePresenter: ViewToPrensenterHomeProtocol {
    
    func viewDidLoad() {
        locationManagerDelegate.delegate = self
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.stateBackAction(state: true)
        intetactor.fetchTaxiInfo()
        view?.setMessageLabelOnTaxiInfoView(isHidden: false, text: TextTheme.selectedLocationMessage.localized)
        let titleContract = TitleContract(buttonTitle: TextTheme.sendTaxi.localized)
        view?.titleContract(title: titleContract)
    }
    
    // show user location on map when tap location Icon
    func toUserLocation() {
        guard let userLocation = userLocation else {return}
        view?.updateLocation(location: userLocation, meters: 200)
    }
    
    // calculate taximeter
    func distanceKm(price: Double) -> Double {
        guard let userLocation = userLocation else {return 0}
        guard let selectedLocation = selectedLocation else {return 0}
        let km = locationManagerDelegate.calculatekm(userLocation: userLocation,
                                                     selectedLocation: selectedLocation)
        
        let totalPrice = km * price
        return totalPrice <= 150 ? 150 : totalPrice
        
    }
    
    func numberOfItemsIn() -> Int {
        return taxiTypeCellList.count
    }
    
    // design and type taxiInfocell according to selectedTaxiTypeIndex
    func cellForItem(at indexPath: IndexPath) -> CellType<TaxiCellInfo> {
        let taxiInfo = taxiTypeCellList[indexPath.item]
        let borderColor = indexPath == selectedTaxiTypeIndex ? ColorTheme.black.rawValue : ColorTheme.ligthGray.rawValue
        let borderWidth = WidthTheme.small.rawValue
        let borderCornerRadius = CornerRadiusTheme.medium.rawValue
        return CellType(data: taxiInfo, borderColor: borderColor, borderWidth: borderWidth, borderCornerRadius: borderCornerRadius)
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        let horizontalPadding: CGFloat = 10
        let totalSpacing = (2 * horizontalPadding)
        let itemWidth = (width - totalSpacing)
        return CGSize(width: itemWidth, height: 50)
    }
    
    func insetForSectionAt() -> (top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) {
        return (top: 10, left: 10, right: 10, bottom: 10)
    }
    
    //proccess of  select taxi type
    func didSelectItem(at indexPath: IndexPath) {
        selectedTaxiTypeIndex = indexPath
        view?.reloadCollectionView()
    }
    
    // process of selecting location on map
    func mapMove(location: (latitude: Double, longitude: Double)) {
        selectedLocation = location
        guard let selectedLocation = selectedLocation else {
            view?.setMessageLabelOnTaxiInfoView(isHidden: false, text: TextTheme.selectedLocationMessage.localized)
            return}
        
        guard let userLocation = userLocation  else {
           
            return}
        locationInfoAction(location: selectedLocation)
        let km = locationManagerDelegate.calculatekm(userLocation: userLocation,
                                                     selectedLocation: selectedLocation)
        
        let message = km < 0.01 ? TextTheme.selectedLocationMessage.localized : TextTheme.defaultEmpty.localized
        let state = !(km < 0.01)
        view?.setMessageLabelOnTaxiInfoView(isHidden: state, text: message)
        view?.reloadCollectionView()
    }
    
    func onTappedSendTaxi() {
        
    }
    
}

//MARK: HomePresenter : InteractorToPresenterHomeProtocol
extension HomePresenter : InteractorToPresenterHomeProtocol {
    
    // Working taxis will be shown on the map
    //taxiTypeCellList -> type of taxi will be created for collectionview
    
    func sendTaxiTypes(list: [TaxiInfoElement]) {
        taxiTypeCellList = []
        let blackList = list.filter { $0.taxiTypeName == "black" && $0.free_state == true }
        let yellowList = list.filter { $0.taxiTypeName == "yellow" && $0.free_state == true }
        
        // If free_stare of yellow taxi is false, taxi will not be added to list
        if yellowList.count != 0 {
            let yellowTaxi = TaxiCellInfo(taxiTypeName: .yellow,
                                          seatCount: SeatSize.yellow.rawValue,
                                          kmPrice:KmPrice.yellow.rawValue)
            taxiTypeCellList.append(yellowTaxi)
        }
        
        // If free_stare of black taxi is false, taxi will not be added to list
        if blackList.count != 0 {
            let blackTaxi = TaxiCellInfo(taxiTypeName: .black,
                                         seatCount: SeatSize.black.rawValue,
                                         kmPrice: KmPrice.black.rawValue)
            taxiTypeCellList.append(blackTaxi)
        }else{
            // If the free_state is false after selecting a black taxi
            selectedTaxiTypeIndex = [0,0]
        }
        
        
        let taxiInfoList = list.filter { $0.free_state == true }
        view?.setTaxiInfoToMap(list: taxiInfoList)
        view?.reloadCollectionView()
        
    }
}

extension HomePresenter: LocationManagerDelegate   {
    // update user location action
    func didUpdateLocation(location: (latitude: Double, longitude: Double)) {
        userLocation = location
        guard let userLocation = userLocation else {return}
        
        view?.updateLocation(location: userLocation,meters: 200)
        
        locationInfoAction(location: userLocation)
        
    }
    
    // if error
    func didFailWithError(_ error: Error) {
        view?.createAlertMesssage(
            title: TextTheme.errorTitle.localized,
            message: TextTheme.errorMessageOne.localized,
            actionTitle: TextTheme.ok.localized)
    }
}
