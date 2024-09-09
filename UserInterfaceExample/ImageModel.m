//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel()

-(UIImage*)getImageWithName:(NSString*)name;

@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSDictionary* imagesDict;

@end

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize imagesDict = _imagesDict;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff",@"Cayenne",@"911",@"Pink911"];
    
    return _imageNames; 
}


-(UIImage*)getImageWithName:(NSString*)name{
    
    return self.imagesDict[name];
    
//    UIImage* image = nil;
//    
//    image = [UIImage imageNamed:name];
//    
//    return image;
}

-(NSString*)getImageNameForIndex: (NSInteger)index{
    return self.imageNames[index];
}

-(UIImage*)getImageWithIndex: (NSInteger)index{
    NSString* name = [self getImageNameForIndex:index];
    return self.imagesDict[name];
}

-(NSInteger)numberOfImages{
    return self.imageNames.count;
}

-(NSDictionary*)imagesDict{
    if(!_imagesDict){
        _imagesDict = @{
            @"Bill":[UIImage imageNamed:@"Bill"],
            @"Eric":[UIImage imageNamed:@"Eric"],
            @"Jeff":[UIImage imageNamed:@"Jeff"],
            @"Cayenne":[UIImage imageNamed:@"Cayenne"],
            @"911":[UIImage imageNamed:@"911"],
            @"Pink911":[UIImage imageNamed:@"Pink911"]
        };
    }
    
    return _imagesDict;
}

@end
