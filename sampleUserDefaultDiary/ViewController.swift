//
//  ViewController.swift
//  sampleUserDefaultDiary
//
//  Created by RIho OKubo on 2016/05/13.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    
    @IBOutlet weak var txtDiary: UITextView!
    
    
    var diaryList = [["title":"title1","date":"2016-05-13","category":"cebu","diary":"cebuは良いところでなあ。。。cebuは良いところでなあ。。。cebuは良いところでなあ。。。cebuは良いところでなあ。。。"],["title":"title3","date":"2016-05-14","category":"english","diary":"英語は難しいけど楽しいなあ。。。英語は難しいけど楽しいなあ。。。英語は難しいけど楽しいなあ。。。"],["title":"title1","date":"2016-05-15","category":"rogramming","diary":"作れるようになりたいな！作れるようになりたいな！作れるようになりたいな！"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                //UserDefaultから保存した配列を取り出す。(本当はviewWillAppearに書くのが良い。)
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        
        
//        Userdefaultを全削除する ぐぐると出て来る　テストし直すと消せる。一回使ってコメントアウトする　テストの時に役に立つ
        
                var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
                myDefault.removePersistentDomainForName(appDomain)
        
        
        
        if(myDefault.objectForKey("diaryList") != nil){
            //データを呼び出して
            diaryList = myDefault.objectForKey("diaryList") as! [Dictionary]
        }
        print(diaryList)
    }
    

    @IBAction func tapSave(sender: UIButton) {
        
        print("押されたよ")
        
//        var title = txtTitle.text
//        diaryList.append(title! as String)
        
//        diaryList.append(txtTitle.text!)
        
        
        //タイトルと日付、カテゴリー、日記を追加
        diaryList.append(["title":txtTitle.text!,"date":txtDate.text!,"category":txtCategory.text!,"diary":txtDiary.text!])
        
        print(diaryList)
        
        
        
        
        
   //ユーザーデフォルトに保存
        //ユーザーデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(diaryList, forKey: "diaryList")
        
        //即反映させる
        myDefault.synchronize()
        
    }
    
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

