//
//  ViewRedController.m
//  111111
//
//  Created by 吴丹 on 2023/3/31.
//

#import "ViewRedController.h"
#import "ViewGreenController.h"
@interface ViewRedController ()

@end

@implementation ViewRedController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"red";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:99/255.0 blue:71/255.0 alpha:1];
    
    CGFloat width = UIScreen.mainScreen.bounds.size.width - 100 * 2;
    CGFloat height = UIScreen.mainScreen.bounds.size.height;
    
    UIButton *button = [[UIButton alloc] init];
    button = [[UIButton alloc] initWithFrame:CGRectMake(100, (height - 50) / 2, width, 50)];
    [button setTitle:@"打开下一页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(gotoNextPage:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.borderWidth = 1;
    button.layer.cornerRadius = 8;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}


- (void)gotoNextPage:(id)sender {
    ViewGreenController *vc = [[ViewGreenController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
