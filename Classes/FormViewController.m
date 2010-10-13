//
//  FormViewController.m
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/12.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "FormViewController.h"


@implementation FormViewController

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

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)pressCancelButton:(id)sender {
	// close
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)pressSaveButton:(id)sender {
	// TODO: save
	//NSLog(@"date:%@ amount:%@ note:%@", date.text, amount.text, note.text);
	[self save];
	
	// close
	[self dismissModalViewControllerAnimated:YES];
}

- (void)save {
	
	// user defaults を呼び出す。
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSMutableArray *activities = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"activities"]];
	
	// 配列に追加するデータを作成。
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	//[dateFormatter setTimeStyle:NSDateFormatterFullStyle];
	[dateFormatter setDateFormat:@"yyyy/MM/dd"];
	NSDate *dateValue = [dateFormatter dateFromString:date.text];
	NSString *noteValue = note.text;
	NSNumber *amountValue = [NSNumber numberWithInt:[amount.text intValue]];
	// activities に追加
	NSDictionary *activity = [NSDictionary dictionaryWithObjectsAndKeys:dateValue, @"date",
							  amountValue, @"amount", noteValue, @"note", nil];
	[activities addObject:activity];
	
	// user defaults に保存
	[defaults setObject:activities forKey:@"activities"];
	[defaults synchronize];
}


@end
