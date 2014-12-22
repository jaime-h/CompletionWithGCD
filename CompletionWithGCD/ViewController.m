//
//  ViewController.m
//  CompletionWithGCD
//
//  Created by Jaime Hernandez on 12/22/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *countsFinished;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t countQueue = dispatch_queue_create("counter", NULL);
    dispatch_async(countQueue, ^{
        int x = 1;
        while (x < 10001)
        {
            NSLog(@"%i", x);
            x++;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.countsFinished.text = @"Ten Thousand Counts Finished";

        });

    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
