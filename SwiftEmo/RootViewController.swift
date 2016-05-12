//
//  RootViewController.swift
//  SwiftEmo
//
//  Created by cs on 16/5/9.
//  Copyright © 2016年 mzb. All rights reserved.
//

import UIKit

struct Common {
    static let screenWidth = UIScreen.mainScreen().applicationFrame.maxX
    static let screenHeight = UIScreen.mainScreen().applicationFrame.maxY
}

class RootViewController: UIViewController {

    var homeViewController:HomeViewController!;
    
    var distance: CGFloat = 0;
    
    let FullDistance: CGFloat = 0.78;
    let Proportion: CGFloat = 0.77;
    
    override func viewDidLoad() {
        
        self.title = "RootViewController";
        self.view.backgroundColor = UIColor.lightGrayColor();

        
        let rightBarButtonItem = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(RootViewController.next(_:)));
        self.navigationItem.rightBarButtonItem = rightBarButtonItem;
        
        // 通过 StoryBoard 取出 HomeViewController 的 view，放在背景视图上面
        //homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        homeViewController = HomeViewController();
        self.view.addSubview(homeViewController.view)
        
        // 绑定 UIPanGestureRecognizer
        homeViewController.panGesture.addTarget(self, action: #selector(RootViewController.panAction(_:)));
        
        
        let strTest = "haha";
        let msg = "hehe \(strTest)";   //  \() 包裹变量
        print(msg)
        
        //元组
        let pup = ("game", 1234);
        print("\(pup.0)")
        
        let pup2 = (one:"game", two:1234);
        print("\(pup2.one)")
    }
    
    /**/
    func panAction(recongnizer: UIPanGestureRecognizer) {
        let x = recongnizer.translationInView(self.view).x;
        let trueDistance = distance + x;      //实际移动X
        
        // 如果 UIPanGestureRecognizer 结束，则激活自动停靠
        if(UIGestureRecognizerState.Ended == recongnizer.state){
            if(trueDistance > Common.screenWidth * (Proportion / 3)){
                showLeft();
            }else if(trueDistance < Common.screenWidth * -(Proportion / 3)){
                showRight();
            }else{
                showHome();
            }
            return;
        }
        //计算缩放比例
        var proportion:CGFloat = recongnizer.view?.frame.origin.x >= 0 ? -1 : 1;
        proportion *= trueDistance / Common.screenWidth;
        proportion *= (1 - Proportion);
        proportion /= 0.6;
        proportion += 1;
        if proportion <= Proportion { // 若比例已经达到最小，则不再继续动画
            return;
        }
        // 执行平移和缩放动画
        recongnizer.view!.center = CGPointMake(self.view.center.x + trueDistance, self.view.center.y)
        recongnizer.view!.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion)
    }
    
    
    // 展示左视图
    func showLeft() {
        distance = self.view.center.x * (FullDistance + Proportion / 2)
        doTheAnimate(self.Proportion)
    }
    // 展示主视图
    func showHome() {
        distance = 0
        doTheAnimate(1)
    }
    // 展示右视图
    func showRight() {
        distance = self.view.center.x * -(FullDistance + Proportion / 2)
        doTheAnimate(self.Proportion)
    }
    // 执行三种试图展示
    func doTheAnimate(proportion: CGFloat) {
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseInOut, animations: { 
            self.homeViewController.view.center = CGPointMake(self.view.center.x + self.distance, self.view.center.y)
            self.homeViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion)
            }, completion: nil)
        
        /*
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.homeViewController.view.center = CGPointMake(self.view.center.x + self.distance, self.view.center.y)
            self.homeViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion)
            }, completion: nil)*/
    }
    
    
    func next(sender: AnyObject) {
        print("avdffvdfvdsf");
        
        let first = FirstViewController();
        self.navigationController?.pushViewController(first, animated: true);
    }
    
    
    override func viewWillAppear(animated: Bool) {
        //self.navigationController?.setNavigationBarHidden(true, animated: false);
    }
    override func viewWillDisappear(animated: Bool) {
        //self.navigationController?.setNavigationBarHidden(false, animated: false);
    }
}
