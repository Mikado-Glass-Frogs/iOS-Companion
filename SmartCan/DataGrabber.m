//
//  DataGrabber.m
//  
//
//  Created by Colin King on 1/17/15.
//
//

#import "DataGrabber.h"
#import "ObjCMongoDB.h"

@implementation DataGrabber

- (NSDictionary *) data {
    if(_data != nil) return _data;
    // Get a link to the collection of personal data
    NSError *error = nil;
    MongoConnection *dbConn = [MongoConnection connectionForServer:@"107.170.91.187" error:&error];
    MongoDBCollection *collection = [dbConn collectionWithName:@"pennapps.personal_data"];
    
    //Fetch all the data
    MongoKeyedPredicate *predicate = [MongoKeyedPredicate predicate];
    [predicate keyPath:@"id" matches:@"user_info"];
    BSONDocument *resultDoc = [collection findOneWithPredicate:predicate
                                                         error:&error];
    NSDictionary *result = [BSONDecoder decodeDictionaryWithDocument:resultDoc];
    NSLog(@"fetch result: %@", result);
    
    // Save the data to prevent future re-reads
    _data = result;
    
    return result;
}

- (NSDictionary *) loginData {
    NSDictionary *data = self.data;
    NSString *keyPath = [[NSString alloc] initWithFormat:@"%@.%@", self.login, self.password];
    return [data valueForKeyPath:keyPath];
}

@end
