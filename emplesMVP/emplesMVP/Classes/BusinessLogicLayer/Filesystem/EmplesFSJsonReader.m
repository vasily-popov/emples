//
//  EmplesFSJsonReader.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesFSJsonReader.h"
#import "EmplesFileNames.h"
#import "NSString+Localizable.h"
#import "LocalizedStrings.h"

@implementation EmplesFSJsonReader

-(id) readFileWithName:(NSString*)name error:(NSError **)error
{
    if(name.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
        if(path != nil)
        {
            NSString *content = [NSString stringWithContentsOfFile:path
                                             encoding:NSUTF8StringEncoding
                                                error:error];
            NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
            return  [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
        }
    }
    if(error != nil) {
        *error = [NSError errorWithDomain:@"EmplesFSJsonReader"
                                     code:0
                                 userInfo:@{NSLocalizedDescriptionKey:[kFileNotFoundString localizedString]}];
    }
    return nil;
}

-(void) doRequestToFetchAllAreaWithResponseBlock:(ContentResponseBlock)block
{
    NSError *error = nil;
    id content = [self readFileWithName:kRecAreaFileName error:&error];
    if(block)
    {
        block(content, error);
    }
}
@end
