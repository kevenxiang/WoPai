//
//  ViewController.m
//  WoPai
//
//  Created by xiang on 2017/4/10.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "UpLoadImageManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(10, 60, 300, 500);
    [self.view addSubview:imgView];
    
    NSURL *url = [NSURL URLWithString:@"http://oprsuej73.bkt.clouddn.com/FoOxcTyfkQGXlW7lsbnB2EA8dtyL"];
    [imgView sd_setImageWithURL:url];
    
    
//    NSURL *url = [NSURL URLWithString:@"http://oprsuej73.bkt.clouddn.com/FsA6Ij4Zv7yoku-SEPf-6FoX6djx"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        UIImage *img = [UIImage imageWithData:data];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            imgView.image = img;
//        });
//        
//        
//    }];
//    
//    [dataTask resume];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"0410_sex" ofType:@"jpg"];
    UIImage *sexImg = [UIImage imageWithContentsOfFile:path];
    NSData *imgData = UIImageJPEGRepresentation(sexImg, 1);
//    [[UpLoadImageManager instance] uploadImageToQNWithImageData:imgData completion:^(NSString *imgName) {
//        NSLog(@"imgName=========:%@", imgName);
//    }];
    
//    [[UpLoadImageManager instance] uploadImageToQNWithFilePath:path completion:^(NSString *imgName) {
//        NSLog(@"imgName=========:%@", imgName);
//    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
