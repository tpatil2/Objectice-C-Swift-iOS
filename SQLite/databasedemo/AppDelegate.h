//
//  AppDelegate.h
//  databasedemo
//
//  Created by Tejas Patil on 1/2/18.
//  Copyright © 2018 Tejas Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) NSString *dbpath;

-(void)copyandpast;

@end

