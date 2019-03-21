//
//  SliderMidVC.swift
//  Animation_转场
//
//  Created by SPIREJ on 2019/3/21.
//  Copyright © 2019年 xiangshang360. All rights reserved.
//

import UIKit

class SliderMidVC: UIViewController {
    
    var pushSliderVC:Bool = true
    var sliderVC:SliderVC = SliderVC()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let tip = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: DEVICE_SCREEN_WIDTH, height: 30))
        tip.center = CGPoint.init(x:DEVICE_SCREEN_WIDTH/2.0 , y: DEVICE_SCREEN_HEIGHT/2.0)
        tip.textAlignment = .center
        tip.text = "点击屏幕查看侧滑效果"
        self.view.addSubview(tip)
        
        
        sliderVC.view.frame = CGRect(x: 0, y: 0, width: DEVICE_SCREEN_WIDTH, height: DEVICE_SCREEN_HEIGHT)
        sliderVC.view.isHidden=true
        self.view.addSubview(sliderVC.view)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pushSliderVC {
            sliderVC.view.isHidden = false
            sliderVC.sliderLeftViewAnimStart()
        }else{
            sliderVC.sliderVCDismiss()
        }
        pushSliderVC = !pushSliderVC
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
