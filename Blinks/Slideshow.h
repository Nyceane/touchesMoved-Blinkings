//
//  Slideshow.h
//  Spotvite
//
//  Created by Peter Ma on 8/3/11.
//  Copyright 2011 demo.com. All rights reserved.
//

@interface SlideshowView : UIView
{
	NSMutableArray *mImages;
    NSArray *mSearchResults;
        
	NSUInteger mCurrentImage;
	
	BOOL mSwiping;
	CGFloat mSwipeStart;
    
    float defaultCenterX;
    float defaultCenterY;
}

@property (strong, nonatomic) NSArray *mImages;
@property (strong, nonatomic) NSArray *mSearchResults;

@property (nonatomic) NSUInteger mCurrentImage;

@property (nonatomic) BOOL mSwiping;
@property (nonatomic) CGFloat mSwipeStart;


//- (id)initWithImages:(NSArray *)inImages;
- (id)initWithSearchResults:(NSArray *)searchResults;

@end