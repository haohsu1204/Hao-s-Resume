//
//  DataHelper.m
//  Resume
//
//  Created by House on 2017/3/27.
//  Copyright © 2017年 House. All rights reserved.
//

#import "DataHelper.h"
#import <UIKit/UIKit.h>
#import "Colors.h"

@implementation DataHelper

+ (NSMutableArray*)buildProfileData{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    
    NSDictionary* item = nil ;
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"img_avatar",@"Image",
            @"徐 浩 / Hao Hsu",@"Title",
            @"iOS / Android Developer",@"SubTitle1",
            @"Taipei, Taiwan",@"SubTitle2",
            [self buildProfileDetialData],@"Detial",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"img_ios",@"Image",
            @"iOS Experience",@"Title",
            @"3+ years experience",@"SubTitle1",
            @"20+ projects",@"SubTitle2",
            [self buildIOSDetialData],@"Detial",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"img_android",@"Image",
            @"Android Experience",@"Title",
            @"3+ years experience",@"SubTitle1",
            @"20+ projects",@"SubTitle2",
            [self buildAndroidDetialData],@"Detial",nil];
    [array addObject:item];
    
    
    return array;
}

+ (NSMutableArray*)buildProfileDetialData{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    
    NSDictionary* item = nil ;
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"行動裝置技術（IOS /Android）",@"Title",
            @"基礎UI以及程式設計（IOS 6->10/Android 2.x->6.x)\n客製化UI開發\nUI/UX Wireframe 設計\nThird Party套件使用及客製化修改\n社群SDK串接經驗，Facebook、Twitter、Google Plus\n地圖SDK串接經驗，Google Map、百度地圖、ArcGIS\nFabric 開發測試輔助工具使用\nFlurry Analytics 追蹤工具使用",@"Summary",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"網站網頁技術",@"Title",
            @"API規劃及開發（PHP/ASP.Net MVC)\n後端管理系統開發（PHP/ASP.Net MVC)\nPHP CodeIgniter Framework 使用\nRWD 網頁開發\nJavascript/Jquery/CSS/HTML5 前端技術使用\n社群SDK串接經驗，Facebook、Line、Google Plus\n網頁分析SDK串接經驗，Google Analytics\n金流SDK串接經驗，PayPal、支付寶",@"Summary",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"資料庫相關技術",@"Title",
            @"MS SQL\nMy sql /phpmyadmin\nSqlite（IOS/Android）",@"Summary",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"版本控管相關技術",@"Title",
            @"Git /TortoiseGit\nBitbucket\nGithub",@"Summary",nil];
    [array addObject:item];
    
    return array;
}

+ (NSMutableArray*)buildIOSDetialData{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    
    NSDictionary* item = nil ;
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"Mobile",@"Title",
            @"登山論壇＆路況回報APP\n高爾夫隨身桿弟APP\n社群交友聊天APP\n房地產業務行程提醒APP\n電動床遙控APP（藍牙BLE）\n智慧插座遙控APP（藍牙BLE）\n智慧電鍋遙控APP（藍牙BLE）\n寵物美容預約APP\n區域Wifi使用控制APP\n智慧手錶設定APP（藍牙BLE）\n休閒博弈拍賣APP（UI）",@"Summary",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"Tablet",@"Title",
            @"建築企業內部使用實價查詢APP",@"Summary",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"Apple Watch",@"Title",
            @"高爾夫隨身桿弟APP",@"Summary",nil];
    [array addObject:item];
    
    return array;
}

+ (NSMutableArray*)buildAndroidDetialData{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    
    NSDictionary* item = nil ;
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"Mobile",@"Title",
            @"登山論壇＆路況回報APP\n農產品經銷商訂貨APP\n高爾夫隨身桿弟APP\n廚具經銷商訂貨APP\n房地產業務行程提醒APP\n電動床遙控APP（藍牙BLE）\n智慧插座遙控APP（藍牙BLE）\n寵物美容預約APP\n區域Wifi使用控制APP\n智慧手錶設定APP（藍牙BLE）\n休閒博弈拍賣APP（UI）",@"Summary",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"Tablet",@"Title",
            @"市場調查問卷APP\n高爾夫球場球車APP（客製化Android平板）",@"Summary",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"Wear",@"Title",
            @"高爾夫隨身桿弟APP",@"Summary",nil];
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"Other",@"Title",
            @"醫療手錶APP（客製化Android裝置）",@"Summary",nil];
    [array addObject:item];

    
    return array;
}

+ (NSMutableArray*)buildPortfolioData{

    NSMutableArray* array = [[NSMutableArray alloc]init];
    
    NSDictionary* item = nil ;
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"bg_icaddie",@"Background",
            @"appicon_icaddie",@"AppIcon",
            [UIColor whiteColor],@"Color",
            @"iCaddie(雲桿弟) 雲端高爾夫系統",@"Title",
            @"SwingMedia 斯威移動",@"SubTitle",
            @"Swing Media Co., Ltd.\n© 2017 Swingmedia All Rights Reserved.",@"Copyright",
            @"全新專業級高爾夫服務APP iCaddie上架!\n全新操作畫面、專業級高球服務功能、全方位高球娛樂媒體平台!",@"Summary1",
            @"功能需求訪談規劃\n畫面流程規劃\n資料流向規劃\nUI視覺設計規劃\n客製化UI開發\n成績卡核心程式開發",@"Summary2",
            [[NSMutableArray alloc]initWithObjects:@"screenshot_icaddie01",@"screenshot_icaddie02",@"screenshot_icaddie03",@"screenshot_icaddie04", nil],@"ScreenShots",nil];
            
    [array addObject:item];
    
    item = [[NSDictionary alloc]initWithObjectsAndKeys:
            @"bg_bob",@"Background",
            @"appicon_bob",@"AppIcon",
            Rgb2UIColor(31,31,31,1),@"Color",
            @"BOB貝貝購-免費抽獎奪寶商城",@"Title",
            @"GoldenBlaze",@"SubTitle",
            @"GOLDENBLAZE INTERNATIONAL CO., LTD.\n© 2017 BOB貝貝購 All Rights Reserved.",@"Copyright",
            @"『貝貝購 BOB』為一款結合『娛樂&公益』的行銷活動平台,支持公益、實踐夢想、 創造娛樂新思維、打造行銷新模式是我們的營運宗旨。\n新型態的娛樂、行銷新思維已經被開創，從船長端導入娛樂模式，結合實體商業、公益、小眾理念，行銷創意就從改變開始。",@"Summary1",
            @"畫面流程規劃\nUI視覺設計規劃\n客製化UI開發",@"Summary2",
            [[NSMutableArray alloc]initWithObjects:@"screenshot_bob01",@"screenshot_bob02",@"screenshot_bob03",@"screenshot_bob04", nil],@"ScreenShots",nil];
            
    [array addObject:item];
    
    return array;
}

@end
