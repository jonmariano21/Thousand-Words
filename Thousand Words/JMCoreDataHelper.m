//
//  JMCoreDataHelper.m
//  Thousand Words
//
//  Created by JONATHAN MARIANO on 6/25/14.
//
//

#import "JMCoreDataHelper.h"

@implementation JMCoreDataHelper

+(NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];//Give access to delegate
    if([delegate performSelector: @selector(managedObjectContext) ]){
        context = [delegate managedObjectContext];//Gives NSManagedObjects back
        
    }
    
    return context;
    
}


@end
