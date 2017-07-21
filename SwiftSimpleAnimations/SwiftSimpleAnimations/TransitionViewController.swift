//
//  TransitionViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate {
    @IBOutlet weak var showImageView: UIImageView!

    @IBOutlet weak var dataPickView: UIPickerView!
    
    fileprivate var dataSource: [String] = []
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set Navigation
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "跳转", style: .done, target: self, action: #selector(rightBarBtnItemClick(sender:)))
        
        // Do any additional setup after loading the view.
        self.dataPickView.delegate = self
        self.dataPickView.dataSource = self
        dataSource = ["pageCurl", "pageUnCurl", "cube", "oglFlip", "suckEffect", "rippleEffect", "cameraIrisHollowOpen", "cameraIrisHollowClose"]
        
        self.navigationController?.delegate = self
    }
    
    // MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transitionAnim = TransitionAnim()
        return transitionAnim
    }
    
    // rightBarBtnItemClick
    func rightBarBtnItemClick(sender: UIBarButtonItem) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "TransitionNewView")
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    
    // MARK: - PickerViewDelegate 
    // MARK:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func animationBtnClick(_ sender: UIButton) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = dataSource[selectedIndex]
        self.view.layer.add(transition, forKey: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
