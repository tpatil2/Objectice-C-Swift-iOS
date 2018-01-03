//
//  ViewController.m
//  databasedemo
//
//  Created by Tejas Patil on 1/2/18.
//  Copyright © 2018 Tejas Patil. All rights reserved.
//

#import "ViewController.h"
#import "dbconnect.h"

@interface ViewController () <UITextFieldDelegate>
@end

@implementation ViewController

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@synthesize arrmaindata,txtcity,txtname, tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonsave:(id)sender {
    
    NSString *strsave = [[NSString alloc]initWithFormat:@"insert into studdb values('%@','%@')",txtname.text,txtcity.text];
    dbconnect *ds = [[dbconnect alloc]init];
    BOOL st = [ds getalluser:strsave];
    if (st)
    {
        NSLog(@"data is save");
    }
    else
    {
        NSLog(@"data is not save");
    }
}

- (IBAction)buttonupdate:(id)sender {
    
    NSString *strsave = [[NSString alloc]initWithFormat:@"update studdb set city='%@' where name='%@'",txtcity.text,txtname.text];
    dbconnect *ds = [[dbconnect alloc]init];
    BOOL st = [ds getalluser:strsave];
    if (st)
    {
        NSLog(@"data is Update");
    }
    else
    {
        NSLog(@"data is not update");
    }
}

- (IBAction)buttonDelete:(id)sender {
    
    NSString *strsave = [[NSString alloc]initWithFormat:@"delete from studdb where name='%@'",txtname.text];
    
    dbconnect *ds = [[dbconnect alloc]init];
    BOOL st = [ds getalluser:strsave];
    if (st)
    {
        NSLog(@"data is deleted");
    }
    else
    {
        NSLog(@"data is not deleted");
    }
}

- (IBAction)buttonShow:(id)sender {
    
    NSString *strshow = [[NSString alloc]initWithFormat:@"select * from studdb"];
    
    dbconnect *ds = [[dbconnect alloc]init];
    arrmaindata = [[NSMutableArray alloc]init];
    arrmaindata = [ds getalluser:strshow];
    [tableView reloadData];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrmaindata.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=[[arrmaindata objectAtIndex:indexPath.row]objectForKey:@"name"];//name field textlabel store
    cell.detailTextLabel.text=[[arrmaindata objectAtIndex:indexPath.row]objectForKey:@"city"];//detail text city data store
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    txtname.text=[[arrmaindata objectAtIndex:indexPath.row]objectForKey:@"name"];//textfieldname
    txtcity.text=[[arrmaindata objectAtIndex:indexPath.row]objectForKey:@"city"];//textfieldcity
}

@end
