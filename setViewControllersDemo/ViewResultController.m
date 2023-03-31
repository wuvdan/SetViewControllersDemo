//
//  ViewResultController.m
//  111111
//
//  Created by 吴丹 on 2023/3/31.
//

#import "ViewResultController.h"

@interface ViewResultController ()

@end

@implementation ViewResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"result";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:164/255.0 blue:96/255.0 alpha:1];
    
    CGFloat width = UIScreen.mainScreen.bounds.size.width - 100 * 2;
    CGFloat height = UIScreen.mainScreen.bounds.size.height;
    
    UIButton *button = [[UIButton alloc] init];
    button = [[UIButton alloc] initWithFrame:CGRectMake(100, (height - 50) / 2, width, 50)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(gotoPrePage:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.borderWidth = 1;
    button.layer.cornerRadius = 8;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)gotoPrePage:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}
@end
