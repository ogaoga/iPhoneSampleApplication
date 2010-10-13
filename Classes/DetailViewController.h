//
//  DetailViewController.h
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/13.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UITableViewController {
	// 扱うデータのインデックス
	int indexValue;
	// 扱うデータ
	NSDictionary *activity;
}

- (void)setIndex:(int)index;

@end
