//
//  ImageModel.h
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/18/24.
//

//Code from Professor Eric Larson's flipped assignment one

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseToadImages : NSObject

+(BaseToadImages*)sharedInstance;
-(UIImage*)getImageWithName:(NSString*)name;
-(UIImage*)getImageWithIndex:(NSInteger)index;
-(NSInteger)numberOfImages;
-(NSString*)getImageNameForIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
