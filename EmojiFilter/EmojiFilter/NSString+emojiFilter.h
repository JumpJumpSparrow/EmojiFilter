//
//  NSString+emojiFilter.h
//  UITabBarTest
//
//  Created by suning on 2018/12/23.
//  Copyright © 2018年 suning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (emojiFilter)

- (BOOL)containsEmoji;

- (NSString *)removeEmoji;
@end
