//
//  RootViewController.m
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/08.
//  Copyright ogaoga.org 2010. All rights reserved.
//

#import "RootViewController.h"
#import "FormViewController.h"
#import "DetailViewController.h"
#import "GraphViewController.h"

@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
 */

/**
 * 表示の直前に呼び出されるメソッド
 * ここで、テーブルの再描画処理を行う。
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];	// 親クラスの呼び出し。消してはいけない。
	
	// データ User Defaults から読み込む。
	// このクラス内では、読み込み専用として扱う。 
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	activities = [defaults objectForKey:@"activities"];

	// テーブルの再描画。
	// UITableViewController を継承しているので、tableView で参照できる。
	[self.tableView reloadData];
	
	// 合計の計算と表示
	int sum = 0;
	for ( NSDictionary *activity in activities ) {
		sum += [[activity objectForKey:@"amount"] intValue];
	}
	self.navigationItem.title = [NSString stringWithFormat:@"合計 %d円", sum];
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
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		// セルのスタイルを変更。
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
									   reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.

	// 表示するデータは、配列から呼び出す。
	NSDictionary *activity = [activities objectAtIndex:indexPath.row];
	
	// 日付を文字列に変換
	NSDate *dateValue = [activity objectForKey:@"date"];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy/MM/dd"];
	NSString *dateString = [formatter stringFromDate:dateValue];
	[formatter release];	// formatter のリリースを忘れずに。
	
	// cell に値をセット
	cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
						   dateString,
						   [activity objectForKey:@"note"]];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%d円",
								 [[activity objectForKey:@"amount"] intValue]];
	
	// cell のスタイルをセット
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

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
	
	// フォームの view controller をインスタンス。
	DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController"
																						bundle:nil];
	// 表示対象のインデックスを指定
	[detailViewController setIndex:indexPath.row];
	
	// navigation controller にプッシュ
	[self.navigationController pushViewController:detailViewController animated:YES];

	// 選択されたセルのハイライトを解除
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	// インスタンスした view controller をリリース。
	[detailViewController release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

/*
- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}
 */


- (void)dealloc {
    [super dealloc];
}

- (IBAction)pressAddButton:(id)sender {
	// ボタンが押されたときの処理を記述。
	//NSLog(@"Add button pressed.");

	// フォームの view controller をインスタンス。
	FormViewController *formViewController = [[FormViewController alloc] initWithNibName:@"FormViewController"
																				  bundle:nil];
	// modal view として表示。
	[self presentModalViewController:formViewController animated:YES];

	// インスタンスしたフォームをリリース
	[formViewController release];
}

/**
 * Graph ボタンを押されたら、Graph View に切り替える。
 */
- (IBAction)pressGraphButton:(id)sender {

	// view controller の読み込み
	GraphViewController *controller = [[GraphViewController alloc] initWithNibName:@"GraphViewController"
																			bundle:nil];
	// トランジッションスタイルのセット。今回はフリップ。
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	// モーダルビューとして呼び出し。
	[self presentModalViewController:controller animated:YES];
	// view controller のリリース
	[controller release];
}

@end
