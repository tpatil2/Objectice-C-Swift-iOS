//
//  dbconnect.h
//  databasedemo
//
//  Created by Tejas Patil on 1/2/18.
//  Copyright © 2018 Tejas Patil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <sqlite3.h>

@interface dbconnect : NSObject
{
    AppDelegate *appdel;
    sqlite3 *database;
}

@property(strong, nonatomic) NSMutableArray *arrdata;
@property(strong, nonatomic) NSString *strmain;

-(NSMutableArray *)getalluser:(NSString *) query;
@end
