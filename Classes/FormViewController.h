//
//  FormViewController.h
//  iPhoneSampleApplication
//
//  Created by ogaoga on 10/10/12.
//  Copyright 2010 ogaoga.org. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FormViewController : UIViewController {
	IBOutlet UITextField *date;
	IBOutlet UITextField *amount;
	IBOutlet UITextField *note;
}

- (IBAction)pressCancelButton:(id)sender;
- (IBAction)pressSaveButton:(id)sender;

@end
