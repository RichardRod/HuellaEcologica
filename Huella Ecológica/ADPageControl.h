//
//  ADPageControl.h
//  Huella Ecológica
//
//  Created by Ricardo Rodriguez Haro on 7/30/16.
//  Copyright © 2016 Ricardo Rodriguez Haro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADPageModel : NSObject

@property(nonatomic) int                iPageNumber;
@property(nonatomic) NSString           *strPageTitle;
@property(nonatomic) UIViewController   *viewController;
@property(nonatomic) BOOL               bShouldLazyLoad;
@end

@protocol ADPageControlDelegate <NSObject>

@optional

-(UIViewController *)adPageControlGetViewControllerForPageModel:(ADPageModel *) pageModel;

-(void)adPageControlCurrentVisiblePageIndex:(int) iCurrentVisiblePage;

@end

@interface ADPageControl : UIViewController

@property(weak) id<ADPageControlDelegate> delegateADPageControl;

@property(nonatomic) NSMutableArray *arrPageModel;

@property(nonatomic) int            iFirstVisiblePageNumber;

@property(nonatomic) UIColor        *colorTitleBarBackground;
@property(nonatomic) UIColor        *colorTabText;
@property(nonatomic) UIColor        *colorPageIndicator;
@property(nonatomic) UIColor        *colorPageOverscrollBackground;

@property(nonatomic) int            iTitleViewHeight;
@property(nonatomic) int            iPageIndicatorHeight;
@property(nonatomic) UIFont         *fontTitleTabText;

@property(nonatomic) BOOL           bEnablePagesEndBounceEffect;
@property(nonatomic) BOOL           bEnableTitlesEndBounceEffect;

@property(nonatomic) BOOL           bShowMoreTabAvailableIndicator;

@property(nonatomic) BOOL           bHideShadow;

@property(nonatomic) int            iCustomFixedTabWidth;



-(void)goToPageWithPageNumber:(int) iPageNumber;                    

@end
