//
//  MapTestViewController.h
//  aWay
//
//  Created by eser on 9.01.2015.
//  Copyright (c) 2015 eser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapTestViewController : UIViewController<UITextFieldDelegate ,UITableViewDelegate,UITableViewDataSource>
{
    UITextField *startField;
    UITextField *endField;
    NSMutableArray *wayPointFields;
    UISegmentedControl *travelModeSegment;
    UIBarButtonItem *addButton;
    UIBarButtonItem *removeButton;
    NSString *strSource,*strDest;
    IBOutlet UITableView *theTableView;
}


@end
