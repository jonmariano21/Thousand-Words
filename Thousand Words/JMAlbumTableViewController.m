//
//  JMAlbumTableViewController.m
//  Thousand Words
//
//  Created by JONATHAN MARIANO on 6/25/14.
//
//

#import "JMAlbumTableViewController.h"
#import "Album.h"
#import "JMCoreDataHelper.h"

@interface JMAlbumTableViewController () <UIAlertViewDelegate>//Conform to delegate in .m file makes private

@end

@implementation JMAlbumTableViewController

//LAZY INSTANTIATION
//Ensures there will always be memory allocated for this array
-(NSMutableArray *)albums{
    if( !_albums ) _albums = [[NSMutableArray alloc] init];
    
    return _albums;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear: animated];//Does all functionality from super class UITableViewController
    
    //Create NSFetchReques obj
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Album"]; //Give me all the album objs back
    
    //Sort by ascending date
    fetchRequest.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES] ];
    
    NSError *error = nil;
    
    NSArray *fetchedAlbums = [[JMCoreDataHelper managedObjectContext] executeFetchRequest: fetchRequest error: &error];
    
    self.albums = [fetchedAlbums mutableCopy];
    
    [self.tableView reloadData];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender {
    
    UIAlertView *newAlbumAlertView = [[UIAlertView alloc] initWithTitle:@"Enter new album name" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    
    [newAlbumAlertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [newAlbumAlertView show];
    
}

#pragma mark - HELPER

//Allows Query and Persistence to CORE DATA !!!!!!!
-(Album *)albumWithName: (NSString *)name{
    

    NSManagedObjectContext *context = [JMCoreDataHelper managedObjectContext];
    
    //Create new Persistent album obj
    Album *album = [NSEntityDescription insertNewObjectForEntityForName: @"Album" inManagedObjectContext: context];
    
    album.name = name;
    album.date = [NSDate date];//Returns current date
    
    NSError *error = nil;
    
    if( ![context save: &error] ){ //&error is a pointer to a pointer of an error obj
        //We have an error
        NSLog(@"%@", error);
        
    }
    return album;
    
}


#pragma mark - UIAlertView Delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if( buttonIndex == 1 ){
        NSString *alertText = [alertView textFieldAtIndex: 0].text;
        [self.albums addObject: [self albumWithName: alertText]];
        
        [self.tableView insertRowsAtIndexPaths: @[[NSIndexPath indexPathForRow: [self.albums count] - 1 inSection: 0]] withRowAnimation: UITableViewRowAnimationFade];
        
        
    }
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.albums count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Album *selectedAlbum = self.albums[indexPath.row];
    cell.textLabel.text = selectedAlbum.name;
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
