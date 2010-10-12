//
//  RootViewController.m
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/08.
//  Copyright ogaoga.org 2010. All rights reserved.
//

#import "RootViewController.h"
#import "FormViewController.h"

@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle

//
// View が読み込まれる前に、データを作成。
//
- (void)viewDidLoad {
    [super viewDidLoad];

	// 配列のインスタンス
	activities = [[NSMutableArray alloc] init];  // new と等しい。
	
	// 配列に追加するデータを作成。
	NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
	NSString *note = @"買い物";
	NSNumber *amount = [NSNumber numberWithInt:10000];
	NSDictionary *activity = [NSDictionary dictionaryWithObjectsAndKeys:date, @"date", amount, @"amount", note, @"note", nil];

	// 配列にデータを追加する。（試しに同じものを３つ追加）
	[activities addObject:activity];	
	[activities addObject:activity];
	[activities addObject:activity];	
	
	// 確認（デバッグ）
	NSLog(@"%@", [activities description]);
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	//
	// セクションは１つ
	//
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	//
	// データは、配列の大きさを返す。
	//
	return [activities count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.

	// 表示するデータは、配列から呼び出す。
	NSDictionary *activity = [activities objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@ %d円", [activity objectForKey:@"note"], [[activity objectForKey:@"amount"] intValue]];
	
    return cell;
}

/*
//
// 各セクションのタイトルを返す。
//
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @""
}
 */

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	
	// メモリを解放するのを忘れずに。
	[activities release];
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)pressAddButton:(id)sender {
	// ボタンが押されたときの処理を記述。
	//NSLog(@"Add button pressed.");

	// view controller
	FormViewController *formViewController = [[FormViewController alloc] initWithNibName:@"FormViewController"
																				  bundle:nil];
	// show modal view.
	[self presentModalViewController:formViewController animated:YES];
}


@end

