//
//  FISViewSpec.m
//  HellaCells
//
//  Created by Chris Gonzales on 5/13/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "Swizzlean.h"
#import "FISHellaDetailViewController.h"
#import "FISHellaMasterTableViewController.h"


SpecBegin(FISView)

describe(@"User Interface", ^{
    
    beforeAll(^{

    });
    
    beforeEach(^{

    });
    
    it(@"should present a table view controller with 100 cells labeled from 1 to 100", ^{
        
        // tests five random cells for compliance
        for (NSUInteger x = 0; x < 5; x++)
        {
            NSInteger randomRow = 1 + arc4random_uniform(100);
            NSIndexPath *ip = [NSIndexPath indexPathForRow:randomRow inSection:0];
            UITableViewCell *cell = [tester waitForCellAtIndexPath:ip inTableViewWithAccessibilityIdentifier:@"Table"];
            NSString *correctString = [NSString stringWithFormat:@"%lu", randomRow+1];
            
            expect(cell.textLabel.text).to.equal(correctString);
        }
    });
    
    it(@"should present a detail view controller when a cell is tapped that displays the correct digits in a large font",^{
        NSInteger randomRow = 1 + arc4random_uniform(100);
        NSIndexPath *ip = [NSIndexPath indexPathForRow:randomRow inSection:0];
        
        [tester tapRowAtIndexPath:ip inTableViewWithAccessibilityIdentifier:@"Table"];
        UILabel *label = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"bigNumber"];
        
        expect(label.text).to.equal([NSString stringWithFormat:@"%lu", randomRow+1]);
        expect(label.font.pointSize).to.beGreaterThanOrEqualTo(50.0f);
        
    });
    
    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
