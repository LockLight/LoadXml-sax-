//
//  Video.m
//
//  Created by 刘凡 on 16/6/6.
//  Copyright (c) 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

/// 视频代号
@property (nonatomic, assign) NSInteger videoId;
/// 视频名称
@property (nonatomic, copy) NSString *name;
/// 视频长度
@property (nonatomic, assign) NSInteger length;
/// 视频URL
@property (nonatomic, copy) NSString *videoURL;
/// 图像URL
@property (nonatomic, copy) NSString *imageURL;
/// 介绍
@property (nonatomic, copy) NSString *desc;
/// 讲师
@property (nonatomic, copy) NSString *teacher;
/// 时间字符串
@property (nonatomic, strong, readonly) NSString *timeString;

+ (instancetype)videoWithDict:(NSDictionary *)dict;

@end
