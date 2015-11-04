//
//  ViewController.m
//  paint
//
//  Created by Dong Li on 10/26/15.
//  Copyright © 2015 Dong Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PTView *ptView;
@property (weak, nonatomic) IBOutlet UIButton *Undo;
@property (weak, nonatomic) IBOutlet UIButton *Clear;
@property (weak, nonatomic) IBOutlet UIButton *Save;
- (IBAction)clearPress:(id)sender;
//- (IBAction)savePress:(id)sender;
- (IBAction)undoPress:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clearPress:(id)sender {
    [self.ptView clear];
}
//- (IBAction)savePress:(id)sender {
//}

- (IBAction)undoPress:(id)sender {
    [self.ptView undo];
}

@end
