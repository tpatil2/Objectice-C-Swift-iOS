//
//  ViewController.h
//  databasedemo
//
//  Created by Tejas Patil on 1/2/18.
//  Copyright © 2018 Tejas Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbconnect.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *txtname;
@property (weak, nonatomic) IBOutlet UITextField *txtcity;
- (IBAction)buttonsave:(id)sender;
- (IBAction)buttonupdate:(id)sender;
- (IBAction)buttonDelete:(id)sender;
- (IBAction)buttonShow:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic)NSMutableArray *arrmaindata;
@end

