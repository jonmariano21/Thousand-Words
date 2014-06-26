//
//  JMAlbumTableViewController.h
//  Thousand Words
//
//  Created by JONATHAN MARIANO on 6/25/14.
//
//

#import <UIKit/UIKit.h>

@interface JMAlbumTableViewController : UITableViewController 

@property (strong, nonatomic) NSMutableArray *albums;

- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender;
@end
