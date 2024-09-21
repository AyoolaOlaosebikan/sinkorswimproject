//
//  ImageModel.m
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/18/24.
//

//Code from Professor Eric Larson's flipped assignment one

#import "BaseToadImages.h"

@interface BaseToadImages ()
-(UIImage*)getImageWithName:(NSString*)name;

@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSMutableDictionary* imagesDict;

@end

@implementation BaseToadImages
@synthesize imageNames = _imageNames;

+(BaseToadImages*)sharedInstance{
    static BaseToadImages* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[BaseToadImages alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"bluetoad",@"redtoad",@"yellowtoad",@"purpletoad",@"greentoad"];
    
    return _imageNames;
}

-(NSMutableDictionary*)imagesDict{
    if(!_imagesDict) {
        
        _imagesDict = [NSMutableDictionary dictionary];
        
        for(NSString* name in self.imageNames) {
            _imagesDict[name] = [UIImage imageNamed:name];
        }
    }
    
    return _imagesDict;
}

-(UIImage*)getImageWithName:(NSString*)name{
    UIImage* image = nil;
    
    image = [UIImage imageNamed:name];
    
    return image;
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    NSString* name = [self.imageNames objectAtIndex:index];
    
    return self.imagesDict[name];
}

-(NSInteger)numberOfImages {
    NSInteger count = [self.imageNames count];
    return count;
}

-(NSString*)getImageNameForIndex:(NSInteger)index {
    return self.imageNames[index];
}



@end
