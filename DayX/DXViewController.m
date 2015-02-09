//
//  DXViewController.m
//  DayX
//
//  Created by Ethan Hess on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXViewController.h"
#import "DXAppDelegate.h"

@interface DXViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation DXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 75, 120, 30)];
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.textField.placeholder = @"Type here!";
    self.textField.delegate = self;

    [self.view addSubview:self.textField];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(150, 75, 60, 30)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@" Clear All " forState: (UIControlStateNormal)];
    [button setTintColor: [UIColor lightGrayColor]];
    [button sizeToFit];
    [button addTarget:self action:@selector(buttonWasTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 150, self.view.frame.size.width - 30, 300)];
    self.textView.backgroundColor = [UIColor lightGrayColor];
    self.textView.delegate = self;
    
    [self.view addSubview:self.textView];

}

- (void)buttonWasTapped:(id)sender
{
    [self hideKeyBoard];
    self.textField.text = @"";
    self.textView.text = @"";
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self hideKeyBoard];
    return YES;
}

- (void)hideKeyBoard {
    [self.textField resignFirstResponder];
    [self.textView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
