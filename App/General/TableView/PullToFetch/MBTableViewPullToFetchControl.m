
#import "MBTableViewPullToFetchControl.h"
#import "MBRefreshHeaderView.h"
#import "MBRefreshFooterView.h"

@implementation MBTableViewPullToFetchControl

- (void)onInit {
    [super onInit];

    self.headerContainer = [MBRefreshHeaderView loadWithNibName:nil];

    MBRefreshFooterView *fv = [MBRefreshFooterView loadWithNibName:nil];
    fv.emptyLabel.text = @"列表为空";
    self.footerContainer = fv;
}

- (void)afterInit {
    [super afterInit];

    [self setHeaderStatusChangeBlock:^(RFTableViewPullToFetchPlugin *control, id indicatorView, RFPullToFetchIndicatorStatus status, CGFloat visibleHeight, UITableView *tableView) {
        [indicatorView updateStatus:status distance:visibleHeight control:control];
    }];

    [self setFooterStatusChangeBlock:^(RFTableViewPullToFetchPlugin *control, id indicatorView, RFPullToFetchIndicatorStatus status, CGFloat visibleHeight, UITableView *tableView) {
        [indicatorView updateStatus:status distance:visibleHeight control:control];
    }];

    [self setNeedsDisplayHeader];
    [self setNeedsDisplayFooter];
}

@end
