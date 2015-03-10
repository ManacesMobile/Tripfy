//
//  tripfy_SearchViewController.m
//  tripfy
//
//  Created by eser on 07/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_SearchViewController.h"
#import "AppDelegate.h"
#import "tripfy_DestinationTableViewCell.h"
#import "tripfy_DateTableViewCell.h"
#import "tripfy_DetailsTableViewCell.h"
#import "tripfy_Trip.h"

@interface tripfy_SearchViewController (){
    NSMutableArray *mArr_sections;
    NSMutableArray *mArr_way;
    NSMutableArray *mArr_wayText;
    NSMutableArray *mArr_dateTitle;
    NSMutableArray *mArr_seatImg;
    NSMutableArray *mArr_seatTitle;
    NSMutableArray *mArr_detailImg;
    NSMutableArray *mArr_detailTitle;
    AppDelegate *tripfy;
    BOOL isQuickTrip;
    tripfy_Trip *trip;
}


@end

@implementation tripfy_SearchViewController
@synthesize view_plannedTrip,view_search,table_plannedTrip;
- (void)viewDidLoad {
    [super viewDidLoad];
    isQuickTrip = NO;
    trip = [[tripfy_Trip alloc] init];
    tripfy = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self setTripArrays];
    [self setTableReload];
    // Do any additional setup after loading the view.
}

-(void) setTableReload{
    table_plannedTrip.delegate = self;
    table_plannedTrip.dataSource = self;
    
    [table_plannedTrip reloadData];
}

-(void) setTripArrays{
    mArr_sections = [[NSMutableArray alloc] initWithObjects:@"Quick Trip",@"Route",@"Date",@"Seat Plan",@"Details", nil];
    
    mArr_way = [[NSMutableArray alloc] initWithObjects:@"from.png",@"destination.png", nil];
    mArr_wayText = [[NSMutableArray alloc] initWithObjects:@"From",@"Destination", nil];
    
    mArr_dateTitle = [[NSMutableArray alloc] initWithObjects:@"Departure Date",@"Return Date", nil];
    
    mArr_seatImg = [[NSMutableArray alloc] initWithObjects:@"NumberofSeats.png",@"SeatPrice.png", nil];
    mArr_seatTitle = [[NSMutableArray alloc] initWithObjects:@"Number of Seats",@"Seat Price", nil];
    
    mArr_detailImg = [[NSMutableArray alloc] initWithObjects:@"DepartureTime.png",@"DepartureTime.png", @"Luggage.png",@"latency.png",@"Note.png", nil];
    mArr_detailTitle = [[NSMutableArray alloc] initWithObjects:@"Cigaret",@"Pet",@"Max Luggage",@"Befortime-Delay",@"Trip Information", nil];
}

-(void) setQuickTripArrays{
    mArr_sections = [[NSMutableArray alloc] initWithObjects:@"Quick Trip",@"Route",@"Seat Plan",@"Details", nil];
    
    mArr_way = [[NSMutableArray alloc] initWithObjects:@"from.png",@"destination.png", nil];
    mArr_wayText = [[NSMutableArray alloc] initWithObjects:@"From",@"Destination", nil];
    
    mArr_seatImg = [[NSMutableArray alloc] initWithObjects:@"NumberofSeats.png",@"SeatPrice.png", nil];
    mArr_seatTitle = [[NSMutableArray alloc] initWithObjects:@"Number of Seats",@"Seat Price", nil];
    
    mArr_detailImg = [[NSMutableArray alloc] initWithObjects:@"DepartureTime.png",@"DepartureTime.png", @"Luggage.png",@"latency.png",@"Note.png", nil];
    mArr_detailTitle = [[NSMutableArray alloc] initWithObjects:@"Cigaret",@"Pet",@"Max Luggage",@"Befortime-Delay",@"Trip Information", nil];
}

-(void) setPassenger{
    view_search.hidden = NO;
    view_plannedTrip.hidden = YES;
}

-(void) setDriver{
    view_search.hidden = YES;
    view_plannedTrip.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return mArr_sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isQuickTrip) {
        if (section==0) {
            return 1;
        }else if (section==1) {
            return mArr_wayText.count;
        }else if (section==2) {
            return mArr_seatTitle.count;
        }else
            return mArr_detailTitle.count;
    }else{
        if (section==0) {
            return 1;
        }else if (section==1) {
            return mArr_wayText.count;
        }else if (section==2) {
            return mArr_dateTitle.count;
        }else if (section==3) {
            return mArr_seatTitle.count;
        }else
            return mArr_detailTitle.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isQuickTrip) {
        if (indexPath.section==0) {
            static NSString *CellWithIdentifier = @"QuickCell";
            tripfy_DetailsTableViewCell *quickTripCell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
            if (isQuickTrip) {
                [quickTripCell.switcSelect setOn:YES];
            }else{
                [quickTripCell.switcSelect setOn:NO];
            }
            [quickTripCell.switcSelect addTarget: self action: @selector(quickSwitch:) forControlEvents: UIControlEventValueChanged];
            [quickTripCell.switcSelect setTag:indexPath.row];
            quickTripCell.switcSelect.hidden = NO;
            quickTripCell.stepper.hidden = YES;
            quickTripCell.lbl_amount.hidden = YES;
            
            quickTripCell.lbl_title.text = @"Is Quick Trip";
            quickTripCell.img_icon.image = [UIImage imageNamed:@"quickTrip.png"];
            return quickTripCell;
        }else if (indexPath.section==1) {
            static NSString *CellWithIdentifier = @"WayCell";
            tripfy_DestinationTableViewCell *wayCell = (tripfy_DestinationTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
            wayCell.img_icon.image = [UIImage imageNamed:[mArr_way objectAtIndex:indexPath.row]];
            wayCell.txt_way.placeholder = [mArr_wayText objectAtIndex:indexPath.row];
            return wayCell;
        }else if (indexPath.section==2) {//tripfy_DetailsTableViewCell
            static NSString *CellWithIdentifier = @"DetailsCell";
            tripfy_DetailsTableViewCell *seatCell = (tripfy_DetailsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
            seatCell.switcSelect.hidden = YES;
            seatCell.lbl_title.text = [mArr_seatTitle objectAtIndex:indexPath.row];
            seatCell.img_icon.image = [UIImage imageNamed:[mArr_seatImg objectAtIndex:indexPath.row]];
            return seatCell;
        }else{
            static NSString *CellWithIdentifier = @"DetailsCell";
            tripfy_DetailsTableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
            if (indexPath.row==0 || indexPath.row==1) {
                detailCell.stepper.hidden = YES;
                detailCell.lbl_amount.hidden = YES;
                detailCell.switcSelect.hidden = NO;
                detailCell.accessoryType = UITableViewCellAccessoryNone;
                
                [detailCell.switcSelect addTarget: self action: @selector(detailSwitch:) forControlEvents: UIControlEventValueChanged];
            }else if(indexPath.row==3 || indexPath.row==2){
                detailCell.switcSelect.hidden = YES;
                detailCell.stepper.hidden = NO;
                detailCell.lbl_amount.hidden = NO;
                detailCell.accessoryType = UITableViewCellAccessoryNone;
                
            }else if(indexPath.row==4){
                detailCell.stepper.hidden = YES;
                detailCell.lbl_amount.hidden = YES;
                detailCell.switcSelect.hidden = YES;
                detailCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
            }
            detailCell.lbl_title.text = [mArr_detailTitle objectAtIndex:indexPath.row];
            detailCell.img_icon.image = [UIImage imageNamed:[mArr_detailImg objectAtIndex:indexPath.row]];
            return detailCell;
        }
    }else{
        if (indexPath.section==0) {
            static NSString *CellWithIdentifier = @"QuickCell";
            tripfy_DetailsTableViewCell *quickTripCell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
            if (isQuickTrip) {
                [quickTripCell.switcSelect setOn:YES];
            }else{
                [quickTripCell.switcSelect setOn:NO];
            }
            [quickTripCell.switcSelect addTarget: self action: @selector(quickSwitch:) forControlEvents: UIControlEventValueChanged];
            [quickTripCell.switcSelect setTag:indexPath.row];
            quickTripCell.stepper.hidden = YES;
            quickTripCell.lbl_amount.hidden = YES;
            quickTripCell.switcSelect.hidden = NO;
            
            quickTripCell.lbl_title.text = @"Is Quick Trip";
            quickTripCell.img_icon.image = [UIImage imageNamed:@"quickTrip.png"];
            return quickTripCell;
        }else if (indexPath.section==1) {
            static NSString *CellWithIdentifier = @"WayCell";
            tripfy_DestinationTableViewCell *wayCell = (tripfy_DestinationTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
            wayCell.img_icon.image = [UIImage imageNamed:[mArr_way objectAtIndex:indexPath.row]];
            wayCell.txt_way.placeholder = [mArr_wayText objectAtIndex:indexPath.row];
            return wayCell;
        }else if (indexPath.section==2) {//tripfy_DateTableViewCell
            static NSString *CellWithIdentifier = @"DateCell";
            tripfy_DateTableViewCell *dateCell = (tripfy_DateTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
            dateCell.lbl_dateTitle.text = [mArr_dateTitle objectAtIndex:indexPath.row];
            return dateCell;
        }else if (indexPath.section==3) {//tripfy_DetailsTableViewCell
            static NSString *CellWithIdentifier = @"DetailsCell";
            tripfy_DetailsTableViewCell *seatCell = (tripfy_DetailsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
            seatCell.switcSelect.hidden = YES;
            seatCell.lbl_title.text = [mArr_seatTitle objectAtIndex:indexPath.row];
            seatCell.img_icon.image = [UIImage imageNamed:[mArr_seatImg objectAtIndex:indexPath.row]];
            return seatCell;
        }else{
            static NSString *CellWithIdentifier = @"DetailsCell";
            tripfy_DetailsTableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
            if (indexPath.row==0 || indexPath.row==1) {
                detailCell.stepper.hidden = YES;
                detailCell.lbl_amount.hidden = YES;
                detailCell.switcSelect.hidden = NO;
                detailCell.accessoryType = UITableViewCellAccessoryNone;
                [detailCell.switcSelect addTarget: self action: @selector(detailSwitch:) forControlEvents: UIControlEventValueChanged];
                
            }else if(indexPath.row==3 || indexPath.row==2){
                detailCell.switcSelect.hidden = YES;
                detailCell.stepper.hidden = NO;
                detailCell.lbl_amount.hidden = NO;
                detailCell.accessoryType = UITableViewCellAccessoryNone;
                NSLog(@"b %d",indexPath.row);
            }else if(indexPath.row==4){
                detailCell.stepper.hidden = YES;
                detailCell.lbl_amount.hidden = YES;
                detailCell.switcSelect.hidden = YES;
                detailCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                NSLog(@"c %d",indexPath.row);
            }
            detailCell.lbl_title.text = [mArr_detailTitle objectAtIndex:indexPath.row];
            detailCell.img_icon.image = [UIImage imageNamed:[mArr_detailImg objectAtIndex:indexPath.row]];
            return detailCell;
        }
    }
    
    
        
}//quickSwitch

-(void)quickSwitch:(id) sender{
    UISwitch *senderSwitch = (UISwitch *)sender;
    if ([sender tag]==0) {
        NSLog(@"quick");
        if (senderSwitch.on) {
            [self setQuickTripArrays];
            isQuickTrip = YES;
        }else{
            [self setTripArrays];
            isQuickTrip = NO;
        }
        [self setTableReload];
    }
}

-(void)detailSwitch:(id) sender{
    UISwitch *senderSwitch = (UISwitch *)sender;
    if ([sender tag]==0) {
        NSLog(@"rounded");
    }else if ([sender tag]==1) {
        NSLog(@"cigaret");
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [mArr_sections objectAtIndex:section];
    
}*/


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 44)];
    headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(10,7, tableView.frame.size.width-2, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
    label.text = [mArr_sections objectAtIndex:section];
    [label setFont:font];
    
    [headerView addSubview:label];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
