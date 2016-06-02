//
//  ViewController.h
//  ParadoxTest
//
//  Created by Oshel on 6/2/16.
//  Copyright © 2016 Dragos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestManager.h"

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,PhotoDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *colletionView;

@end

