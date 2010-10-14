//
//  DetailViewController.m
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/13.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import "DetailViewController.h"
#import "FormViewController.h"

@implementation DetailViewController

/**
 * 扱うテーブルのインデックスを設定。
 */
- (void)setIndex:(int)index {
	indexValue = index;
}

/**
 * Edit ボタンを押されたときの処理
 */
- (IBAction)pressEditButton:(id)sender {
	//NSLog(@"Edit button pressed.");
	
	// form view の呼び出し。
	FormViewController *formViewController = [[FormViewController alloc] initWithNibName:@"FormViewController"
																				  bundle:nil];
	// データのインデックスを指定。
	[formViewController setIndex:indexValue];
	// modal view として表示。
	[self presentModalViewController:formViewController animated:YES];
	
	// インスタンスしたフォームをリリース
	[formViewController release];
}

#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];	// 親クラスの呼び出し。消してはいけない。
	
	// データの呼び出し
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSArray *activities = [defaults objectForKey:@"activities"];
	activity = [activities objectAtIndex:indexValue];
	
	// 表示のリフレッシュ
	[self.tableView reloadData];
	
	// タイトルの設定
	self.navigationItem.title = [[activity objectForKey:@"date"] description];
	
	// Edit ボタンの設置
	// ボタンの種類と、ボタンを押されたときにメッセージを送信するオブジェクト、メソッドを指定。
	UIBarButtonItem *editButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
																					target:self
																					action:@selector(pressEditButton:)];
	// 右側に設定。
	self.navigationItem.rightBarButtonItem = editButtonItem;
	// オブジェクトをリリース。忘れずに。
	[editButtonItem release];
}

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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		// スタイルを変更。
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...

    // 各セルに値を設定。
	if ( indexPath.row == 0 ) {
		cell.textLabel.text = @"Date";
		cell.detailTextLabel.text = [[activity objectForKey:@"date"] description];
	}
	else if ( indexPath.row == 1 ) {
		cell.textLabel.text = @"Amount";
		cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [[activity objectForKey:@"amount"] intValue]];
	}
	else if ( indexPath.row == 2 ) {
		cell.textLabel.text = @"Note";
		cell.detailTextLabel.text = [activity objectForKey:@"note"];
	}
	else {
	}
	
	// タッチしたときにハイライトさせないように設定。
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
    return cell;
}


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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
    // Navigation logic may go here. Create and push another view controller.
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
}


- (void)dealloc {
    [super dealloc];
}


@end

