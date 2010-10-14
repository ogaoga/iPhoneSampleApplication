//
//  GraphViewController.h
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/14.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GraphViewController : UIViewController {
	NSMutableString *url;
	IBOutlet UIWebView *webView;
}

- (IBAction)pressDoneButton:(id)sender;
- (void)setURLString:(NSString*)urlString;

@end
