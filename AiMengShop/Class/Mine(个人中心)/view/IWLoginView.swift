//
//  IWLoginView.swift
//  AiMengShop
//
//  Created by apple on 2017/9/5.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class IWLoginView: UIView {
    var phoneFiled = PLUNLineField();
    var pwdFiled = PLUNLineField();
    let loginbtn = UIButton();
    var logoimg = UIImageView();




    
    override init(frame: CGRect) {
        super.init(frame: frame)

                self.addSubview(logoimg);
                self.addSubview(phoneFiled);
                self.addSubview(pwdFiled);
                self.addSubview(loginbtn);

                self.logoimg.mas_makeConstraints { (make:MASConstraintMaker!) in
        
                    make.top.mas_equalTo()(100)
                    make.left.mas_equalTo()(10)
                    make.right.mas_equalTo()(-10)
        
                }

                self.phoneFiled.mas_makeConstraints { (make:MASConstraintMaker!) in
        
                    make.left.mas_equalTo()(10)
                    make.right.mas_equalTo()(-10)
                    make.top.mas_equalTo()(self.logoimg.mas_bottom)?.offset()(50);
                }
        
        
                self.pwdFiled.mas_makeConstraints { (make:MASConstraintMaker!) in
        
                    make.left.mas_equalTo()(10)
                    make.right.mas_equalTo()(-10)
                    make.top.mas_equalTo()(self.phoneFiled.mas_bottom)?.offset()(20);
                }
        
        
                self.loginbtn.mas_makeConstraints { (make:MASConstraintMaker!) in
        
                    make.left.mas_equalTo()(10)
                    make.right.mas_equalTo()(-10)
                    make.top.mas_equalTo()(self.pwdFiled.mas_bottom)?.offset()(30);
                    make.height.mas_equalTo()(50)

                }

        self.backgroundColor = UIColor.white
        self.logoimg.image = UIImage(named:"Paboutubiao")
        self.logoimg.contentMode = .scaleAspectFit
        self.phoneFiled.placeholder = "请输入手机号，微信已登录适用"
//        self.phoneFiled.font = UIFont.f
        self.phoneFiled.font=UIFont(name:"",size:13);

        self.pwdFiled.placeholder = "密码"
        self.loginbtn.setTitle("登录", for: .normal)
        self.loginbtn.setTitleColor(UIColor.white, for: .normal)
        self.loginbtn.backgroundColor=UIColor.red
        self.loginbtn.layer.cornerRadius=6
        self.loginbtn.layer.masksToBounds = true

    };
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    






}
