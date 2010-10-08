//
//  iPhoneSampleApplicationAppDelegate.h
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/08.
//  Copyright ogaoga.org 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPhoneSampleApplicationAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

