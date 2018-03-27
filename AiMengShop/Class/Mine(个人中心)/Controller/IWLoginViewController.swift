//
//  IWLoginViewController.swift
//  AiMengShop
//
//  Created by apple on 2017/9/5.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class IWLoginViewController: BaseViewController {

//    var phoneFiled = PLUNLineField();
//    var pwdFiled = PLUNLineField();
//    let loginbtn = UIButton();
//    var logoimg = UIImageView();
//    var loginV:IWLoginView;



    override func viewDidLoad() {
        super.viewDidLoad()
        self.initloginUI()


    }

    func initloginUI()  {

        let loginV = IWLoginView.init(frame: CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height))
        self.view.addSubview(loginV)

      loginV.loginbtn.addTarget(self, action: "loginEvent:", for: UIControlEvents.touchUpInside)



    }




    func loginEvent() {

    }

    

  
    



}
