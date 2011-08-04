//
//  Slideshow.m
//  Spotvite
//
//  Created by Peter Ma on 8/3/11.
//  Copyright 2011 demo.com. All rights reserved.
//

#import "Slideshow.h"

#define kImageWidth 100.0f
#define kImageHeight 100.0f

@implementation SlideshowView

@synthesize mImages;
@synthesize mSearchResults;

@synthesize mCurrentImage;

@synthesize mSwiping;
@synthesize mSwipeStart;

- (UIImageView *)createImageView:(NSUInteger)inImageIndex
{	
    if (inImageIndex >= [mSearchResults count])
	{
		return nil;
	}
    
	UIImageView * result = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"test.png"]];
	result.opaque = YES;
	result.userInteractionEnabled = NO;
	result.backgroundColor = [UIColor whiteColor];
	result.contentMode = UIViewContentModeScaleAspectFit;
	result.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	return result;
}

- (id)initWithSearchResults:(NSArray *)searchResults {
	if (self = [super initWithFrame:CGRectZero]) {
		mSearchResults = searchResults;
		mImages = [[NSMutableArray alloc] initWithObjects:nil];
		NSUInteger imageCount = [mSearchResults count];
        for(int i = 0; i < imageCount; i++)
        {
            UIImageView *imageView = [self createImageView:i];
            [mImages addObject:imageView];
            [self addSubview:imageView];
        }
		
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 100);
        defaultCenterX = kImageWidth/2;
        defaultCenterY = kImageHeight/2;
        
		self.opaque = YES;
		self.backgroundColor = [UIColor whiteColor];
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	}
	
	return self;
}

- (void)layoutSubviews
{
	if (mSwiping)
		return;
	
    for(int i = 0; i < mImages.count; i++)
    {
        
        UIImageView *aView = [mImages objectAtIndex:i];
        aView.frame = CGRectMake(0.0f, 0.0f, kImageWidth, kImageHeight);
        if(i == 0)
        {
            aView.center = CGPointMake(defaultCenterX, defaultCenterY);
        }
        else
        {
            aView.center = CGPointMake(defaultCenterX + kImageWidth*i, defaultCenterY);
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if ([touches count] != 1)
		return;
	
	mSwipeStart = [[touches anyObject] locationInView:self].x;
	mSwiping = YES;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (! mSwiping || [touches count] != 1)
		return;
	
	CGFloat swipeDistance = [[touches anyObject] locationInView:self].x - mSwipeStart;
		
    for (UIImageView* aView in mImages) {
        aView.center = CGPointMake(swipeDistance - aView.center.x, defaultCenterY);
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Cancel");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (! mSwiping)
		return;
	
    return;
    NSLog(@"WTF");
    
    
	CGSize contentSize = self.frame.size;
	
	NSUInteger count = [mImages count];
	
	CGFloat swipeDistance = [[touches anyObject] locationInView:self].x - mSwipeStart;
	if (mCurrentImage > 0 && swipeDistance > 50.0f)
	{
		//[mRightImageView removeFromSuperview];
		
		//mRightImageView = mCurrentImageView;
		//mCurrentImageView = mLeftImageView;
		
		mCurrentImage--;
		if (mCurrentImage > 0)
		{
			//mLeftImageView = [self createImageView:mCurrentImage - 1];
			//mLeftImageView.hidden = YES;
			
			//[self addSubview:mLeftImageView];
		}
		else
		{
			//mLeftImageView = nil;
		}
	}
	else if (mCurrentImage < count - 1 && swipeDistance < -50.0f)
	{
		//[mLeftImageView removeFromSuperview];
		
		//mLeftImageView = mCurrentImageView;
		//mCurrentImageView = mRightImageView;
		
		mCurrentImage++;
		if (mCurrentImage < count - 1)
		{
			//mRightImageView = [self createImageView:mCurrentImage + 1];
			//mRightImageView.hidden = YES;
			
			//[self addSubview:mRightImageView];
		}
		else
		{
			//mRightImageView = nil;
		}
	}
	
	[UIView beginAnimations:@"swipe" context:NULL];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:0.3f];
	
	//mLeftImageView.frame = CGRectMake(-contentSize.width, 0.0f, contentSize.width, contentSize.height);
	//mCurrentImageView.frame = CGRectMake(0.0f, 0.0f, contentSize.width, contentSize.height);
	//mRightImageView.frame = CGRectMake(contentSize.width, 0.0f, contentSize.width, contentSize.height);
	
	[UIView commitAnimations];
	
	mSwiping = NO;
}


@end