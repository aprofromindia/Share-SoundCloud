//
//  ViewController.m
//  Share SoundCloud
//
//  Created by Apro on 05/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "ViewController.h"

static NSString *const kSoundCloudLink = @"soundcloud://";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startSCBtnPressed {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kSoundCloudLink]];
}

@end
