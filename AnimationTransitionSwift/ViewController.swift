//
//  ViewController.swift
//  Animation_转场
//
//  Created by SPIREJ on 2018/11/29.
//  Copyright © 2018年 xiangshang360. All rights reserved.
//

import UIKit

let kScreenW = UIScreen.main.bounds.size.width
let kScreenH = UIScreen.main.bounds.size.height

class ViewController: UIViewController {
    
    var imageView:UIImageView?
    
    var str:String = "aaa.jpg"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
         转场动画主要用于不同视图场景之间的切换
         
         CATransition同CoreAnimation核心动画中CABasicAnimation等相关类的使用方法类似。主要分为以下三个步骤：
         (1) 实例化CATransition，并设置相应的转场动画key
         (2) 设置合适的转场动画属性，如动画周期、过度方向、动画保持状态等
         (3) 将动画效果添加到相应的视图的Layer图层中
         
         在第一步设置动画效果时需注意，iOSr提供了大量的酷炫x动画效果。不过总体上来说可以分为y公有API和私有API，私有APP制作的APP有被拒的风险，所以在使用时需要尤为注意。
         
         公有API:
         fade   淡入淡出效果，可用 CATransitionType.fade 表示
         push   推送效果，可用 CATransitionType.push 表示
         reveal 揭开效果，可用 CATransitionType.reveal 表示
         movein 移动效果，可用 CATransitionType.movein 表示
         
         私有API:
         pageCurl                   向上翻一页
         pageUnCurl                 向下翻一页
         rippleEffect               滴水效果
         suckEffect                 收缩效果，如一块布被抽走
         cube                       立方体效果
         oglFlip                    上下翻转效果
         cameraIrisHollowOpen       相机打开
         cameraIrisHollowClose      相机关闭
         */
        
        imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: kScreenW-40, height: 200))
        imageView?.center = self.view.center
        imageView?.image = UIImage(named: "aaa.jpg")
        self.view.addSubview(imageView!)
        
//        self.view.addSubview(self.view1)
    }

    // 淡入淡出效果，可用 CATransitionType.fade 表示
    @IBAction func animation_fade(_ sender: UIButton) {
        self.animationType("fade")
    }
    
    // 推送效果，可用 CATransitionType.push 表示
    @IBAction func animation_push(_ sender: UIButton) {
        self.animationType("push")
    }
    
    // 揭开效果，可用 CATransitionType.reveal 表示
    @IBAction func animation_reveal(_ sender: UIButton) {
        self.animationType("reveal")
    }
    
    // 移动效果，可用 CATransitionType.movein 表示
    @IBAction func animation_movein(_ sender: UIButton) {
        self.animationType("moveIn")
    }
    
    // 向上翻页效果
    @IBAction func animation_pageCurl(_ sender: UIButton) {
        self.animationType("pageCurl")
    }
    
    // 向下翻页效果
    @IBAction func animation_pageUnCurl(_ sender: UIButton) {
        self.animationType("pageUnCurl")
    }
    
    // 立方体翻转效果
    @IBAction func animation_cube(_ sender: UIButton) {
        self.animationType("cube")
    }
    
    // 翻转效果
    @IBAction func animation_oglFlip(_ sender: UIButton) {
        self.animationType("oglFlip")
    }
    
    // 收缩效果
    @IBAction func animation_suckEffect(_ sender: UIButton) {
        self.animationType("suckEffect")
    }
    
    // 水滴波纹效果
    @IBAction func animation_rippleEffect(_ sender: UIButton) {
        self.animationType("rippleEffect")
    }

    // 相机打开效果
    @IBAction func animation_cameraIrisHollowOpen(_ sender: UIButton) {
        self.animationType("cameraIrisHollowOpen")
    }

    // 相机关闭效果
    @IBAction func animation_cameraIrisHollowClose(_ sender: UIButton) {
        self.animationType("cameraIrisHollowClose")
    }
    
    func animationType(_ animationType:String) {
        
        if str == "aaa.jpg" {
            str = "bbb.jpg"
        }else {
            str = "aaa.jpg"
        }
        
        imageView?.image = UIImage(named: str)
        
        let animation:CATransition = CATransition.init()
        animation.duration = 1
        animation.type = CATransitionType(rawValue: animationType)
//        imageView?.layer.add(animation, forKey: nil)
        self.view.layer.add(animation, forKey: nil)
    }
    
    
    // 下一节视图过渡动画
    @IBAction func nextVC(_ sender: UIButton) {
        
        let vc:FromVC = FromVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 下一节视图过渡动画之侧滑栏示例
    @IBAction func nextSlider(_ sender: UIButton) {
        let vc:SliderMidVC = SliderMidVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    lazy var view1: UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 300, width: kScreenW, height: 100))
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var view2: UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 300, width: kScreenW, height: 100))
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if self.view.subviews.contains(self.view1) {
            
            
            UIView.transition(from: self.view1, to: self.view2, duration: 1, options: UIView.AnimationOptions.transitionCrossDissolve) { (completion) in
                
            }
            
        }else {
            
            UIView.transition(from: self.view2, to: self.view1, duration: 1, options: UIView.AnimationOptions.transitionCrossDissolve) { (completion) in
                
            }
        }
    }
}

