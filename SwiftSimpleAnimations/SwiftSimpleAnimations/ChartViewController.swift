//
//  ChartViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {

    
    var lineChartView: LineChartView!
    var barChartView: BarChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Chart View"
        
        // line Chart
        lineChartView = LineChartView.init(frame: CGRect(x: 0, y: 70, width: 375, height: 300))
        self.view.addSubview(lineChartView)
        
        // bar Chart
        barChartView = BarChartView.init(frame: CGRect(x: 0, y: 370, width: 375, height: 300))
        barChartView.backgroundColor = UIColor.purple
        self.view.addSubview(barChartView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        lineChartView.drawChartLine()
        barChartView.barChartAnimation()
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
