//
//  JMPhotoCollectionViewCell.m
//  Thousand Words
//
//  Created by JONATHAN MARIANO on 6/25/14.
//
//

#import "JMPhotoCollectionViewCell.h"
#define IMAGEVIEW_BORDER_LENGTH 5


@implementation JMPhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setUp];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];

    if (self) {
        // Initialization code
        [self setUp];
    }
    return self;
    
}

-(void)setUp{
    
    //Inset creates a border around the image
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH)];
    
    [self.contentView addSubview: self.imageView];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
