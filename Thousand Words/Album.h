//
//  Album.h
//  Thousand Words
//
//  Created by JONATHAN MARIANO on 6/25/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Album : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * date;

@end
