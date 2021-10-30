//
//  BaseView.swift
//  TempoTask
//
//  Created by Hesham Donia on 29/10/2021.
//

import UIKit
import Toast_Swift
import NVActivityIndicatorView

class BaseView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenClick()
    }
    
    @objc open func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showLoader() {
        let activityData = ActivityData(size: nil, message: nil, messageFont: nil, messageSpacing: nil, type: nil, color: UIColor.gray, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: nil, textColor: nil)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    func hideLoader() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
    func showErrorMessage(message: String) {
        self.view.makeToast(message)
    }
    
    func hideKeyboardWhenClick() {
        self.view.addTapGesture { [weak self] _ in
            self?.dismissKeyboard()
        }
    }
    
}
