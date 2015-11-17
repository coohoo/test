//
//  DVLoginViewController.m
//  DVBands
//
//  Created by Ted on 15/11/15.
//  Copyright (c) 2015年 Devond. All rights reserved.
//

#import "DVLoginViewController.h"
#import "DVTabBarController.h"

@interface DVLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UITextField     *userNameField;
@property (nonatomic, strong)UITextField     *passWordField;
@property (nonatomic, strong)UIButton        *loginInBtn;

@end

@implementation DVLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:FirstLaunchKey]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:FirstLaunchKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSLog(@"this is first Launch");
    }
    
    _userNameField = [[UITextField alloc]init];
    _userNameField.tintColor = [UIColor lightGrayColor];
    _userNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _userNameField.layer.borderWidth = 1;
    _userNameField.layer.cornerRadius = 5;
    _userNameField.placeholder = @"请输入用户名:admin";
    [self.view addSubview:_userNameField];
    
    UIView *leftView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    leftView1.backgroundColor = [UIColor clearColor];
    _userNameField.leftView = leftView1;
    _userNameField.leftViewMode = UITextFieldViewModeAlways;
    
    
    _passWordField = [[UITextField alloc]init];
    _passWordField.tintColor = [UIColor lightGrayColor];
    _passWordField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passWordField.layer.borderWidth = 1;
    _passWordField.layer.cornerRadius = 5;
    _passWordField.placeholder = @"请输入密码:admin";
    _passWordField.delegate = self;
    [self.view addSubview:_passWordField];
    

    UIView *leftView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    leftView2.backgroundColor = [UIColor clearColor];
    _passWordField.leftView = leftView2;
    _passWordField.leftViewMode = UITextFieldViewModeAlways;
    
    _loginInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginInBtn addTarget:self action:@selector(loginInBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_loginInBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginInBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _loginInBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _loginInBtn.layer.borderWidth = 1;
    _loginInBtn.layer.cornerRadius = 5;
    [self.view addSubview:_loginInBtn];
    
    [_userNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(50);
        make.right.mas_equalTo(self.view).offset(-50);
        make.top.mas_equalTo(self.view).offset(150);
        make.height.mas_equalTo(50);
    }];
    
    [_passWordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(50);
        make.right.mas_equalTo(self.view).offset(-50);
        make.top.mas_equalTo(_userNameField.mas_bottom).offset(20);
        make.height.mas_equalTo(50);
    }];
    
    [_loginInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(80);
        make.right.mas_equalTo(self.view).offset(-80);
        make.top.mas_equalTo(_passWordField.mas_bottom).offset(50);
        make.height.mas_equalTo(50);
    }];
    
}

- (void)loginInBtnClicked{
    if ([_userNameField.text isEqualToString:@"admin"] && [_passWordField.text isEqualToString:@"admin"]) {
        [self loginSuccess];
        [[NSUserDefaults standardUserDefaults] setObject:@"token" forKey:LoginTokenKey];
    }else{
        [DVManager showAlertWithString:@"请输入正确的用户名和密码" duration:1];
    }
}

- (void)loginSuccess{
    [UIApplication sharedApplication].keyWindow.rootViewController = [[DVTabBarController alloc]init];
}


#pragma mark - TextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
