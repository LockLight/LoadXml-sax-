//
//  Video.m
//
//  Created by 刘凡 on 16/6/6.
//  Copyright (c) 2016年 itcast. All rights reserved.
//

#import "Video.h"

@implementation Video

+ (instancetype)videoWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (void)setName:(NSString *)name {
    _name = name.copy;
}

- (void)setLength:(NSInteger)length {
    _length = length;

    _timeString = [NSString stringWithFormat:@"%02zd:%02zd:%02zd", _length / 3600, (_length % 3600) / 60, _length % 60];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{videoId : %zd, name : %@ %p, length : %zd, videoURL : %@, imageURL : %@, desc : %@, teacher : %@}", _videoId, _name, _name, _length, _videoURL, _imageURL, _desc, _teacher];
}

@end
