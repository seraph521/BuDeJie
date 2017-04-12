//
//  XFXSubTagViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXSubTagViewController.h"
#import "XFXSubTagParam.h"
#import "XFXNewTool.h"
#import "XFXSubTagItem.h"
#import <MJExtension/MJExtension.h>
#import "XFXSubTagCell.h"

static NSString * cellID  = @"CELLID";

@interface XFXSubTagViewController ()

@property (nonatomic, strong) NSArray *subTags;

@end

@implementation XFXSubTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XFXSubTagCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    self.title = @"推荐标签";
}

- (void)loadData{
    
    XFXSubTagParam * param = [[XFXSubTagParam alloc] init];
    param.a = @"tag_recommend";
    param.action = @"sub";
    param.c = @"topic";
    
    [XFXNewTool sendSubTagWithParam:param success:^(id jsonData) {
        
        _subTags = [XFXSubTagItem mj_objectArrayWithKeyValuesArray:jsonData];
        [self.tableView reloadData];
        XFXLog(@"=======success");

    } failure:^(NSError *error) {
        XFXLog(@"=======failure");
    }];
    
}


#pragma mark TableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _subTags.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    XFXSubTagCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    
    XFXSubTagItem * model = _subTags[indexPath.row];
    
    cell.item = model;
    
    return  cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}


@end
