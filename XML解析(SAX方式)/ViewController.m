//
//  ViewController.m
//  XML解析(SAX方式)
//
//  Created by locklight on 17/3/9.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"

@interface ViewController ()<NSXMLParserDelegate>

@end

@implementation ViewController{
    NSMutableArray<Video *> *_videoList;
    NSMutableString *_content;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _videoList = [NSMutableArray array];
    _content = [NSMutableString string];
    [self loadData];
    
//    //清空字符串
//    [_content setString:@""];
}


#pragma mark NSXMLParserDelegate代理方法
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"1.开始解析XML:%@",parser);
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
    NSLog(@"2.开始解析节点:%@,%@",elementName,attributeDict);
    if([elementName isEqualToString:@"video"]){
        Video *model = [Video new];
        for (NSString *key in attributeDict) {
            [model setValue:attributeDict[key] forKey:key];
        }
        [_videoList addObject:model];
    }
    //清空字符串
    [_content setString:@""];
}

//节点字符内容,调用多次
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"3.-----> %@",string);
    //拼接完整字符
    [_content appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"4.结束解析节点:%@",elementName);
    
    if( ![elementName isEqualToString:@"videos"]  && ![elementName isEqualToString:@"video"]){
        //获取模型
        Video *model =  _videoList.lastObject;
        
        [model setValue:_content forKey:elementName];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"5.结束解析XML:%@",parser);
}


- (void)loadData{
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos02.xml"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", error);
            return;
        }
        //sax解析XML
        NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
        parser.delegate = self;

        [parser parse];
    }] resume];
}

@end
