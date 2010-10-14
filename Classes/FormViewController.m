//
//  FormViewController.m
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/12.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "FormViewController.h"

// 編集ではなく、新規の場合には -1 を指定する。
#define INDEX_OF_NEW (-1)

@implementation FormViewController

/**
 * 編集するデータのインデックスを指定する。
 */
- (void)setIndex:(int)index {
	indexValue = index;
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		
		// index の指定がない場合は新規なので、
		// INDEX_OF_NEW で初期化しておく。
		[self setIndex:INDEX_OF_NEW];
    }
    return self;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
 */

/**
 * 表示前の処理。編集の場合には、そのデータをセットする。
 */
- (void)viewWillAppear:(BOOL)animated {
	if ( indexValue != INDEX_OF_NEW ) {
		// データの読み出し
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		NSArray *activities = [defaults objectForKey:@"activities"];
		NSDictionary *activity = [activities objectAtIndex:indexValue];
		/**
		 *  値を各 text field にセット
		 */
		// date
		NSDate *dateValue = [activity objectForKey:@"date"];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy/MM/dd"];
		date.text = [formatter stringFromDate:dateValue];
		[formatter release];	// formatter のリリースを忘れずに。
		// amount
		amount.text = [NSString stringWithFormat:@"%d",
					   [[activity objectForKey:@"amount"] intValue]];
		// note
		note.text = [activity objectForKey:@"note"];
	}
}

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
	// 新規の場合は追加、編集の場合は上書き。
	if ( indexValue == INDEX_OF_NEW ) {
		// 追加
		[activities addObject:activity];
	}
	else {
		// 上書き
		[activities replaceObjectAtIndex:indexValue withObject:activity];
	}
	
	// user defaults に保存
	[defaults setObject:activities forKey:@"activities"];
	[defaults synchronize];
	
	// activities を解放
	[activities release];
}


@end
