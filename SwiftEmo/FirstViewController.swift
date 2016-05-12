//
//  FirstViewController.swift
//  SwiftEmo
//
//  Created by cs on 16/5/9.
//  Copyright © 2016年 mzb. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var tfUserName : UITextField!
    var tfPassword : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login";
        self.view.backgroundColor = UIColor.lightGrayColor();

        let leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(FirstViewController.back))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        
        let left:CGFloat = 30;
        let width:CGFloat! = self.view.bounds.size.width - left*2;
        
        
        self.tfUserName = UITextField(frame: CGRect(x: left, y: 80, width: width, height: 40));
        self.tfUserName.placeholder = "请输入用户名";
        self.tfUserName.font = UIFont(name: "", size: 20);
        self.tfUserName.clearButtonMode = UITextFieldViewMode.WhileEditing;
        self.tfUserName.borderStyle = UITextBorderStyle.RoundedRect;
//        self.tfUserName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.view.addSubview(self.tfUserName);
        
        let originY:CGFloat! = self.tfUserName.frame.origin.y + self.tfUserName.frame.size.height + 20;
        self.tfPassword = UITextField(frame: CGRect(x: left, y: originY, width: width, height: 40));
        self.tfPassword.placeholder = "请输入密码";
        self.tfPassword.font = UIFont(name: "", size: 20);
        self.tfPassword.clearButtonMode = UITextFieldViewMode.WhileEditing;
        self.tfPassword.borderStyle = UITextBorderStyle.RoundedRect;
        
        let leftView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40));
        leftView.backgroundColor = UIColor.cyanColor();
        self.tfPassword.leftView = leftView;
        self.tfPassword.leftViewMode = UITextFieldViewMode.Always;
        
        //        self.tfUserName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.view.addSubview(self.tfPassword);
        
        
        let buttonY:CGFloat = self.tfPassword.frame.origin.y + self.tfPassword.frame.size.height + 20;
        let commitBtn:UIButton = UIButton(type: .Custom);
        commitBtn.frame = CGRect(x: left, y: buttonY, width: width, height: 45);
        commitBtn.backgroundColor = UIColor.greenColor();
        commitBtn.setTitleColor(UIColor.blueColor(), forState: .Normal);
        commitBtn.setTitle("提交", forState: .Normal);
        commitBtn.addTarget(self, action: #selector(FirstViewController.commitAction), forControlEvents: .TouchUpInside);
        self.view.addSubview(commitBtn);
    }

  
    func commitAction(){
        
        //password.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "! "))//"hi  !23" 去掉两边的空格和‘!’ ，把 字符串中的每个字符进行了分解并去除
        /*
        let userName = self.tfUserName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
        if 0 == userName.characters.count {
            self.alert("Alert", msg: "请输入用户名");
            return;
        }
        
        let password = self.tfPassword.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
        if 0 == password.characters.count {
            self.alert("Alert", msg: "请输入密码");
            return;
        }
        */
        
        let tableView = TableViewController();
        self.navigationController?.pushViewController(tableView, animated: true);
    }
    
    
    func back(){
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    func alert(title:String, msg:String) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert);
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler:nil);
        let okAction = UIAlertAction(title: "好的", style: .Default) { action in
            print("点击了确定");
        }
        alertController.addAction(cancelAction);
        alertController.addAction(okAction);
        self.presentViewController(alertController, animated: true, completion: nil);
        
    }
    
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
