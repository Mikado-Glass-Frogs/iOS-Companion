//
//  DataGrabber.h
//  
//
//  Created by Colin King on 1/17/15.
//
//

#import <Foundation/Foundation.h>

@interface DataGrabber : NSObject

@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *password;

- (NSDictionary *) loginData;

@end
