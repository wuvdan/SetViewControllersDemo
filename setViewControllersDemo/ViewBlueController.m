//
//  ViewBlueController.m
//  111111
//
//  Created by 吴丹 on 2023/3/31.
//

#import "ViewBlueController.h"
#import "ViewResultController.h"

@interface ViewBlueController ()
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *button4;
@property (nonatomic, strong) UIButton *button5;
@property (nonatomic, strong) UIButton *button6;

@end

@implementation ViewBlueController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"blue";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1];
    
    CGFloat width = UIScreen.mainScreen.bounds.size.width - 100 * 2;
    
    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, width, 50)];
    [self.button1 setTitle:@"正常跳转" forState:UIControlStateNormal];
    [self.button1 addTarget:self action:@selector(normalJum:) forControlEvents:UIControlEventTouchUpInside];
    self.button1.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button1.layer.borderWidth = 1;
    self.button1.layer.cornerRadius = 8;
    [self.button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button1];
    
    self.button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, width, 50)];
    [self.button2 setTitle:@"删除蓝色" forState:UIControlStateNormal];
    [self.button2 addTarget:self action:@selector(deleteBlue:) forControlEvents:UIControlEventTouchUpInside];
    self.button2.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button2.layer.borderWidth = 1;
    self.button2.layer.cornerRadius = 8;
    [self.button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button2];
    
    self.button3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, width, 50)];
    [self.button3 setTitle:@"删除蓝色+绿色" forState:UIControlStateNormal];
    [self.button3 addTarget:self action:@selector(deleteBlueAndGreen:) forControlEvents:UIControlEventTouchUpInside];
    self.button3.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button3.layer.borderWidth = 1;
    self.button3.layer.cornerRadius = 8;
    [self.button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button3];
    
    self.button4 = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, width, 50)];
    [self.button4 setTitle:@"删除蓝色+红色" forState:UIControlStateNormal];
    [self.button4 addTarget:self action:@selector(deletBlueAndRed:) forControlEvents:UIControlEventTouchUpInside];
    self.button4.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button4.layer.borderWidth = 1;
    self.button4.layer.cornerRadius = 8;
    [self.button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button4];
    
    self.button5 = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, width, 50)];
    [self.button5 setTitle:@"删除绿色+红色" forState:UIControlStateNormal];
    [self.button5 addTarget:self action:@selector(deleteGreenAndRed:) forControlEvents:UIControlEventTouchUpInside];
    self.button5.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button5.layer.borderWidth = 1;
    self.button5.layer.cornerRadius = 8;
    [self.button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button5];
    
    self.button6 = [[UIButton alloc] initWithFrame:CGRectMake(100, 600, width, 50)];
    [self.button6 setTitle:@"只保留首页" forState:UIControlStateNormal];
    [self.button6 addTarget:self action:@selector(saveFirsh:) forControlEvents:UIControlEventTouchUpInside];
    self.button6.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button6.layer.borderWidth = 1;
    self.button6.layer.cornerRadius = 8;
    [self.button6 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button6];
}


- (IBAction)normalJum:(id)sender {
    ViewResultController *vc = [[ViewResultController alloc] init];
    [self showViewController:vc removeViewControllers:@[] animated:YES];
}
- (IBAction)deleteBlue:(id)sender {
    ViewResultController *vc = [[ViewResultController alloc] init];
    [self showViewController:vc removeViewControllers:@[@"ViewBlueController"] animated:YES];
}
- (IBAction)deleteBlueAndGreen:(id)sender {
    ViewResultController *vc = [[ViewResultController alloc] init];
    [self showViewController:vc removeViewControllers:@[@"ViewBlueController", @"ViewGreenController"] animated:YES];
}
- (IBAction)deletBlueAndRed:(id)sender {
    ViewResultController *vc = [[ViewResultController alloc] init];
    [self showViewController:vc removeViewControllers:@[@"ViewBlueController", @"ViewRedController"] animated:YES];
}

- (IBAction)deleteGreenAndRed:(id)sender {
    ViewResultController *vc = [[ViewResultController alloc] init];
    [self showViewController:vc removeViewControllers:@[@"ViewGreenController", @"ViewRedController"] animated:YES];
}
- (IBAction)saveFirsh:(id)sender {
    ViewResultController *vc = [[ViewResultController alloc] init];
    [self showViewControllerAndClearAll:vc animated:YES];
}

/// push到controler中并移除不需要显示的控制
/// - Parameters:
///   - controller: 显示的控制器
///   - controllers: 移除不需要显示的控制器
///   - animated: 是否需要动画
- (void)showViewController:(UIViewController *)controller removeViewControllers:(NSArray<NSString * > *)controllers animated:(BOOL)animated{
    NSMutableArray<UIViewController *> *newStackControllers = [NSMutableArray array];
    __block NSArray<UIViewController *> *currentStackControllers = self.navigationController.viewControllers;
    [currentStackControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![controllers containsObject:NSStringFromClass(obj.class)]) {
            [newStackControllers addObject:obj];
        }
    }];
    [newStackControllers addObject:controller];
    [self.navigationController setViewControllers:newStackControllers animated:animated];
}


/// push到controler中并返回直接可以首页
/// - Parameters:
///   - controller: 显示的控制器
///   - animated: 是否需要动画
- (void)showViewControllerAndClearAll:(UIViewController *)controller animated:(BOOL)animated{
    NSMutableArray<UIViewController *> *newStackControllers = [NSMutableArray array];
    NSArray<UIViewController *> *currentStackControllers = self.navigationController.viewControllers;
    if (currentStackControllers.count > 0) {
        [newStackControllers addObject:currentStackControllers.firstObject];
    }
    [newStackControllers addObject:controller];
    [self.navigationController setViewControllers:newStackControllers animated:animated];
}

@end
