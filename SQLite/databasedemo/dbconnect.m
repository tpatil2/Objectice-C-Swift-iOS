//
//  dbconnect.m
//  databasedemo
//
//  Created by Tejas Patil on 1/2/18.
//  Copyright © 2018 Tejas Patil. All rights reserved.
//

#import "dbconnect.h"

@implementation dbconnect

@synthesize arrdata, strmain;

-(id)init{
    appdel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    strmain = appdel.dbpath;
    return self;
}
        
-(NSMutableArray *)getalluser:(NSString *)query{
    
    arrdata=[[NSMutableArray alloc]init];
    //open->prepare->operation->finalise->close
    
    if(sqlite3_open([strmain UTF8String], &database)==SQLITE_OK){
        
        sqlite3_stmt *connection;
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &connection, nil)==SQLITE_OK){
            
            while (sqlite3_step(connection)==SQLITE_ROW) {
                NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                NSString *str12 = [[NSString alloc]initWithUTF8String:(char *) sqlite3_column_text(connection, 0)];
                NSString *str13 = [[NSString alloc]initWithUTF8String:(char *) sqlite3_column_text(connection, 1)];
                
                [dic setObject:str12 forKey:@"name"];
                [dic setObject:str13 forKey:@"city"];
                
                [arrdata addObject:dic];
            }
        }
        sqlite3_finalize(connection);
    }
    sqlite3_close(database);
    return arrdata;
}
@end
