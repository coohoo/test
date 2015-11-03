//
//  ViewController.m
//  Recorder
//
//  Created by Devond on 15/9/23.
//  Copyright (c) 2015年 slin. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (strong, nonatomic)   AVAudioRecorder  *recorder;
@property (strong, nonatomic)   AVAudioPlayer    *player;
@property (strong, nonatomic)   NSString         *recordFileName;
@property (strong, nonatomic)   NSString         *recordFilePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *startBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 150, 50)];
    [startBtn setTitle:@"开始录音" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startRecord) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    
    UIButton *playBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 300, 150, 50)];
    [playBtn setTitle:@"开始播放" forState:UIControlStateNormal];
    [playBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(startPLay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBtn];
    
    UIButton *stopBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 150, 50)];
    [stopBtn setTitle:@"停止录音" forState:UIControlStateNormal];
    [stopBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stopRecord) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
}


- (void)startRecord{
    //根据当前时间生成文件名
    self.recordFileName = [self GetCurrentTimeString];
    //获取路径
    self.recordFilePath = [self GetPathByFileName:self.recordFileName ofType:@"wav"];
    
    //录音格式
    NSDictionary *recordSetting = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   [NSNumber numberWithFloat: 8000.0],AVSampleRateKey, //采样率
                                   [NSNumber numberWithInt: kAudioFormatLinearPCM],AVFormatIDKey,
                                   [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,//采样位数 默认 16
                                   [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,//通道的数目
                                   nil];
    
    self.recorder = [[AVAudioRecorder alloc]initWithURL:[NSURL fileURLWithPath:self.recordFilePath]
                                               settings:recordSetting
                                                  error:nil];
    
    
    //准备录音
    if ([self.recorder prepareToRecord]){
        
        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error:nil];
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
        
        //开始录音
        if ([self.recorder record]){
            NSLog(@"开始录音");
        }
    }
}

- (void)stopRecord{
    [self.recorder stop];
    NSLog(@"停止录音");
}

- (void)startPLay{
    NSLog(@"startPlay");
    self.player = [[AVAudioPlayer alloc]init];
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    self.player = [self.player initWithContentsOfURL:[NSURL URLWithString:self.recordFilePath] error:nil];
    NSLog(@"%@",self.recordFilePath);
    [self.player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 生成当前时间字符串
- (NSString*)GetCurrentTimeString{
    NSDateFormatter *dateformat = [[NSDateFormatter  alloc]init];
    [dateformat setDateFormat:@"yyyyMMddHHmmss"];
    return [dateformat stringFromDate:[NSDate date]];
}

#pragma mark - 生成文件路径
- (NSString*)GetPathByFileName:(NSString *)_fileName ofType:(NSString *)_type{
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];;
    NSString* fileDirectory = [[[directory stringByAppendingPathComponent:_fileName]
                                stringByAppendingPathExtension:_type]
                               stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return fileDirectory;
}

@end
