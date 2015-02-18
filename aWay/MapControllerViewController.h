//
//  MapControllerViewController.h
//  aWay
//
//  Created by eser on 9.01.2015.
//  Copyright (c) 2015 eser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
typedef enum UICGTravelModes {
    UICGTravelModeDriving, // G_TRAVEL_MODE_DRIVING
    UICGTravelModeWalking  // G_TRAVEL_MODE_WALKING
} UICGTravelModes;
@interface MapControllerViewController : UIViewController<MKMapViewDelegate ,MKAnnotation ,MKOverlay,UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate>
{
    UITableView *tblView;
    NSDictionary *dictRouteInfo;
    BOOL isVisible;
    CLLocation *currentLocation;
    
}
@property(nonatomic,retain) CLLocationManager *locationManager;
-(MKPolyline *)polylineWithEncodedString:(NSString *)encodedString ;
-(void)addAnnotationSrcAndDestination :(CLLocationCoordinate2D )srcCord :(CLLocationCoordinate2D)destCord;
@property (strong, nonatomic) IBOutlet MKMapView *theMapView;
@property (nonatomic, retain) NSString *startPoint;
@property (nonatomic, retain) NSString *endPoint;
@property (nonatomic, retain) NSArray *wayPoints;
@property (nonatomic) UICGTravelModes travelMode;
@end
