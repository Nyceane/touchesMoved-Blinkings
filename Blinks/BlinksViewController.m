//
//  BlinksViewController.m
//  Blinks
//
//  Created by Peter Ma on 8/3/11.
//  Copyright 2011 demo.com. All rights reserved.
//

#import "BlinksViewController.h"
#import "Slideshow.h"

@implementation BlinksViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *results = [[NSMutableArray alloc] initWithObjects:nil];
    [results addObject:[NSString stringWithFormat:@"Foo"]];
    [results addObject:[NSString stringWithFormat:@"Bar"]];
    [results addObject:[NSString stringWithFormat:@"Fuck"]];
    [results addObject:[NSString stringWithFormat:@"Yah"]];
    
    SlideshowView *slideshow = [[SlideshowView alloc] initWithSearchResults:results];
    NSLog(@"height: %f",slideshow.frame.size.height);
    NSLog(@"width: %f",slideshow.frame.size.width);
    [self.view addSubview:slideshow];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
