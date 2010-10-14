//
//  GraphViewController.m
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/14.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "GraphViewController.h"


@implementation GraphViewController

/**
 * 表示する URL をセットする
 */
- (void)setURLString:(NSString*)urlString {
	[url setString:urlString];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		
		// URL を保持する NSMutableString をインスタンス。
		url = [[NSMutableString alloc] initWithCapacity:0];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];	// 親クラスの呼び出し。消してはいけない。

	// Web View にリクエストを行う。
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	[webView loadRequest:request];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

/*
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
 */

- (void)dealloc {
	// url を解放
	[url release];
	
	// 親クラスの dealloc も忘れずに。
    [super dealloc];
}

/**
 * 閉じる処理
 */
- (IBAction)pressDoneButton:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}


@end
