//
//  DiaryListViewController.swift
//  sampleUserDefaultDiary
//
//  Created by RIho OKubo on 2016/05/13.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class DiaryListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var diaryList: UITableView!
    
    var diaryListTmp = [["title":"title1","date":"2016-05-13","category":"cebu","diary":"cebuは良いところでなあ。。。cebuは良いところでなあ。。。cebuは良いところでなあ。。。cebuは良いところでなあ。。。"],["title":"title3","date":"2016-05-14","category":"english","diary":"英語は難しいけど楽しいなあ。。。英語は難しいけど楽しいなあ。。。英語は難しいけど楽しいなあ。。。"],["title":"title1","date":"2016-05-15","category":"rogramming","diary":"作れるようになりたいな！作れるようになりたいな！作れるようになりたいな！"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        
        
        //Userdefaultを全削除する ぐぐると出て来る　テストし直すと消せる。一回使ってコメントアウトする　テストの時に役に立つ
        
        //        var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
        //        myDefault.removePersistentDomainForName(appDomain)
        
        
        
        if(myDefault.objectForKey("diaryList") != nil){
            //データを呼び出して
            diaryListTmp = myDefault.objectForKey("diaryList") as! [Dictionary]
        }
        print(diaryListTmp)

        
    }
    
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) ->Int{
        return diaryListTmp.count
    }
    
    func tableView(tableView:UITableView,cellForRowAtIndexPath indexPath:NSIndexPath) ->UITableViewCell{
        
        var cell = UITableViewCell(style: .Default,reuseIdentifier:"myCell")
        
        var title:String = diaryListTmp[indexPath.row]["title"]! + " " + diaryListTmp[indexPath.row]["date"]!
        
        
        cell.textLabel!.text = "\(title)"
        
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
