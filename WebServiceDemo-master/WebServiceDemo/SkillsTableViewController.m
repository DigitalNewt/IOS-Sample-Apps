//
//  SkillsTableViewController.m
//  WebServiceDemo
//
//  Created by Andrew Barba on 10/14/12.
//  Copyright (c) 2012 Andrew Barba. All rights reserved.
//

#import "SkillsTableViewController.h"

@interface SkillsTableViewController ()
@property (nonatomic, strong) NSArray *skills;
@end

@implementation SkillsTableViewController

-(void)setSkills:(NSArray *)skills
{
    if (_skills != skills) {
        _skills = skills;
        [self.tableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.skills.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Skill Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *skill = self.skills[indexPath.row];
    cell.textLabel.text = skill;
    
    return cell;
}

@end
