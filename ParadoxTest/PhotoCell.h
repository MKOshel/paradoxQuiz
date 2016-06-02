//
//  PhotoCell.h
//  ParadoxTest
//
//  Created by Oshel on 6/2/16.
//  Copyright © 2016 Dragos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iv;
@property (strong, nonatomic) IBOutlet UILabel *labelOwner;

@end
