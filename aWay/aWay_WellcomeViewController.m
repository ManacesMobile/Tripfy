//
//  aWay_WellcomeViewController.m
//  aWay
//
//  Created by eser on 18.12.2014.
//  Copyright (c) 2014 eser. All rights reserved.
//

#import "aWay_WellcomeViewController.h"
#import "aWay_EditProfileViewController.h"
#import "aWay_ListProfileViewController.h"
#import "aWay_NotificationViewController.h"
#import "MapTestViewController.h"

@interface aWay_WellcomeViewController (){
    NSArray *arr_menu;
    aWay_ListProfileViewController *list;
    aWay_NotificationViewController *notif;
    BOOL isPassenger;
    MapTestViewController *mapTest;
}

@end

@implementation aWay_WellcomeViewController
@synthesize view_main,view_table,view_hide;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer* pgr = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(handlePan:)];
    [view_main addGestureRecognizer:pgr];
    
    UITapGestureRecognizer *viewSingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [view_hide addGestureRecognizer:viewSingleTap];
    UIPanGestureRecognizer* pgrHide = [[UIPanGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(handlePanHideView:)];
    [view_hide addGestureRecognizer:pgrHide];
    
    arr_menu = [[NSArray alloc] initWithObjects:@"eco.png",@"user.png",@"not.png",@"location.png",@"route.png", nil];
    // Do any additional setup after loading the view.
    if (!list) {
        list = [self.storyboard instantiateViewControllerWithIdentifier:@"aWay_ListProfileViewController"];
    }
    self.navigationController.navigationBar.hidden = NO;
    isPassenger = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handlePanHideView:(UIPanGestureRecognizer*)pgr;//sürükleme
{
    
    if (pgr.state == UIGestureRecognizerStateChanged) {
        
        CGPoint center = view_main.center;
        CGPoint translation = [pgr translationInView:view_main];
        if (view_main.frame.origin.x<=50 && view_main.frame.origin.x>-20) {
            center = CGPointMake(center.x + translation.x,center.y);
            view_main.center = center;
            [pgr setTranslation:CGPointZero inView:view_main];
        }
    }
    if(pgr.state == UIGestureRecognizerStateEnded)
    {
        if (view_main.frame.origin.x<50){
            [self.view layoutIfNeeded];
            [UIView animateWithDuration:0.2
                             animations:^{
                                 self.xConstraint.constant = 0;
                                 self.yConstraint.constant = 0;
                                 [self.view layoutIfNeeded]; // Called on parent view
                             }];
            view_hide.hidden = YES;
        }else if (view_main.frame.origin.x>=50){
            self.xConstraint.constant = 50;
            self.yConstraint.constant = -50;
            view_main.frame = CGRectMake(50, view_main.frame.origin.y, view_main.frame.size.width, view_main.frame.size.height);
        }
        
    }
}

-(void)handlePan:(UIPanGestureRecognizer*)pgr;//sürükleme
{
    CGPoint velocity = [pgr velocityInView:view_main];
    
    if(velocity.x > 0)
    {
        NSLog(@"gesture went right");
        if (pgr.state == UIGestureRecognizerStateChanged) {
            
            CGPoint center = pgr.view.center;
            CGPoint translation = [pgr translationInView:pgr.view];
            CGPoint frameOrigin = pgr.view.frame.origin;
            //NSLog(@"%d",pgr.view.frame.origin.x);
            if (frameOrigin.x>-1 && frameOrigin.x<=50) {
                center = CGPointMake(center.x + translation.x,center.y);
                pgr.view.center = center;
                [pgr setTranslation:CGPointZero inView:pgr.view];
            }
            
        }
        if(pgr.state == UIGestureRecognizerStateEnded)
        {
            //All fingers are lifted.
            //NSLog(@"3   ");
            CGPoint frameOrigin = pgr.view.frame.origin;
            CGRect frame = pgr.view.frame;
            if (frameOrigin.x<-1) {
                pgr.view.frame = CGRectMake(0, frame.origin.y, frame.size.width, frame.size.height);
            }
            if (frameOrigin.x>20) {
                [self.view layoutIfNeeded];
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     self.xConstraint.constant = 50;
                                     self.yConstraint.constant = -50;
                                     [self.view layoutIfNeeded]; // Called on parent view
                                 }];
                view_hide.hidden = NO;
            }else{
                [self.view layoutIfNeeded];
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     self.xConstraint.constant = 0;
                                     self.yConstraint.constant = 0;
                                     pgr.view.frame = CGRectMake(0, frame.origin.y, frame.size.width, frame.size.height);
                                     [self.view layoutIfNeeded]; // Called on parent view
                                 }];
                
            }
            
            
        }
    }
    else
    {
        NSLog(@"gesture went left");
    }
    
}

-(void) singleTap:(id) _gest{
    [self showMenu:0];
}

- (IBAction)showMenu:(id)sender{
    int x = 0;
    int y = 0;
    if (!view_hide.hidden) {
        view_hide.hidden = YES;
        /* self.xConstraint.constant = 0;
         self.yConstraint.constant = 0;*/
        
    }else{
        view_hide.hidden = NO;
        x = 50;
        y = -50;
    }
    
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.xConstraint.constant = x;
                         self.yConstraint.constant = y;
                         [self.view layoutIfNeeded]; // Called on parent view
                     }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [arr_menu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    UIImageView *img = (UIImageView *) [cell viewWithTag:100];
    img.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[arr_menu objectAtIndex:indexPath.row]]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==1) {
        [self showViewController:list sender:0];
    }else if (indexPath.row==2) {
        notif = [self.storyboard instantiateViewControllerWithIdentifier:@"aWay_NotificationViewController"];
        [self showViewController:notif sender:0];
    }else if(indexPath.row==3){//MapTestViewController
        mapTest = [self.storyboard instantiateViewControllerWithIdentifier:@"MapTestViewController"];
        [self showViewController:mapTest sender:0];
    }
}

- (IBAction)findTrip:(id)sender{
    if (isPassenger) {//find driver route list
        
    }else {//find passenger route list
        
    }
}

- (IBAction)createTrip:(id)sender{
    if (isPassenger) {//create own road/route to travel
        
    }else {//create a road/route to transport
        
    }
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
