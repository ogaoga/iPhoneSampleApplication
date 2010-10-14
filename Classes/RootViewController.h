//
//  RootViewController.h
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/08.
//  Copyright ogaoga.org 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	
	NSMutableArray *activities;
}

- (IBAction)pressAddButton:(id)sender;
- (IBAction)pressGraphButton:(id)sender;

@end
