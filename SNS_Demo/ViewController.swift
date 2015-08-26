//
//  ViewController.swift
//  SNS_Demo
//
//  Created by 史凯迪 on 15/8/26.
//  Copyright © 2015年 msy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var code: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GetCode(sender: AnyObject) {
        if SMS_SDK_Enable {
            SMS_SDK.getVerificationCodeBySMSWithPhone(phone.text!, zone: "86")
                { (SMS_SDKError) -> Void in
                    if SMS_SDKError != nil {
                        print(SMS_SDKError.errorCode)
                    }
            }
        } else {
            print("没有初始化")
        }
    }
    
    @IBAction func CheckCode(sender: AnyObject) {
        if SMS_SDK_Enable {
            SMS_SDK.commitVerifyCode(code.text!) { (SMS_ResponseState) -> Void in
                print(SMS_ResponseState)
            }
        } else {
            print("没有初始化")
        }
    }
    
}

