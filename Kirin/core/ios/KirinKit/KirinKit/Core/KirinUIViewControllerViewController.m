//
//  KirinUIViewControllerViewController.m
//  KirinKit
//
//  Created by James Hugman on 26/04/2012.
//  Copyright (c) 2012 Future Platforms. All rights reserved.
//

#import "KirinUIViewControllerViewController.h"

@interface KirinUIViewControllerViewController ()

@end

@implementation KirinUIViewControllerViewController
@synthesize kirinHelper;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) bindScreenWithoutLoading: (NSString*) moduleName {
    self.kirinHelper = [KIRIN bindScreen:self toModule:moduleName];
}

- (void) bindScreen:(NSString *)moduleName {
    [self bindScreenWithoutLoading:moduleName];
    [self.kirinHelper onLoad];
}

- (id) bindScreen:(NSString *)moduleName withProtocol: (Protocol*) protocol {
    [self bindScreen:moduleName];
    return [self.kirinHelper proxyForJavascriptObject:protocol];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.kirinHelper onResume];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.kirinHelper onPause];
    
}

- (void)viewDidUnload
{
    [self.kirinHelper onUnload];

    [super viewDidUnload];
    self.kirinHelper = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



@end
