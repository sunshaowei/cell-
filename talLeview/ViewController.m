//
//  ViewController.m
//  talLeview
//
//  Created by kuanter on 16/6/12.
//  Copyright © 2016年 kuanter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView*tableView=[[UITableView alloc] initWithFrame:CGRectMake(100, 100, 300, 300) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent)];
    tap.delegate=self;
    [self.view addGestureRecognizer:tap];
 NSLog(@"====%s==========%@",__func__,@"我操，你好");

}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString*strid=@"cellid";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:strid];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strid];
    }
    cell.layer.cornerRadius=6;
    cell.textLabel.text=[NSString stringWithFormat:@"第%ld个cell",indexPath.row];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    cell.backgroundColor=[UIColor yellowColor];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  NSLog(@"==============didSelect");
}
-(void)tapEvent{
  NSLog(@"==============TapEvent");
}

//然后根据具体的业务场景去写逻辑就可以了,比如
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //Tip:我们可以通过打印touch.view来看看具体点击的view是具体是什么名称,像点击UITableViewCell时响应的View则是UITableViewCellContentView.
    if ([NSStringFromClass([touch.view class])    isEqualToString:@"UITableViewCellContentView"]) {
        //返回为NO则屏蔽手势事件
        return NO;
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
