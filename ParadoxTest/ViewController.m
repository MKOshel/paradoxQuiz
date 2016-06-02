//
//  ViewController.m
//  ParadoxTest
//
//  Created by Oshel on 6/2/16.
//  Copyright © 2016 Dragos. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "RequestManager.h"
#import "Parser.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()
{
    NSMutableArray* photos;
    dispatch_queue_t photoQueue;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
    photos = [NSMutableArray array];
    
    [RequestManager sharedInstance].photoDelegate = self;
    
    [[RequestManager sharedInstance] getPhotos];
    
     photoQueue = dispatch_queue_create("queue",NULL); // used for the 2nd solution (without the  help AFNetworking imageView category)
}


-(void)setupCollectionView
{
    _colletionView.delegate = self;
    _colletionView.dataSource = self;
    [_colletionView registerNib:[UINib nibWithNibName:@"PhotoCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark Receive Data

-(void)didReceivePhotoList:(NSArray *)photoList
{
    [photos removeAllObjects];
    for (NSDictionary* dict in photoList) {
        Photo* photo = [Parser parsePhoto:dict];
        [photos addObject:photo];
    }
    [_colletionView reloadData];
    // in an real app , as an optimization I would save these photos on the disk and load them from there
    
}


-(void)didReceiveError:(NSError *)error
{
    NSLog(@"Error on getting photos: %@",error.description);
}


#pragma mark CollectionView data & delegate

-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return photos.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                                forIndexPath:indexPath];
    Photo* p = photos[indexPath.row];
    
    cell.labelOwner.text = p.owner;
    [cell.iv setImageWithURL:[NSURL URLWithString:p.imageURL]]; // one solution
    
    //solution without AFNetworking
 
    /*   dispatch_async(photoQueue, ^{
        
        NSURL *url = [NSURL URLWithString:p.imageURL];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI , always on the main thread
            [cell.iv setImage:image];
        });
        
    }); */
    
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
     //////////
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 150);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
