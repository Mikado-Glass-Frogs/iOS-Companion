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
    NSLog(@"Getting new data...");
    // Get a link to the collection of personal data
    NSError *error = nil;
    MongoConnection *dbConn = [MongoConnection connectionForServer:@"107.170.91.187" error:&error];
    MongoDBCollection *collection = [dbConn collectionWithName:@"pennapps.mongo_test"];
    
    //Fetch all the data
    MongoKeyedPredicate *predicate = [MongoKeyedPredicate predicate];
    [predicate keyPath:@"id" matches:@"user_info"];
    
    BSONDocument *resultDoc = [collection findOneWithPredicate:predicate
                                                         error:&error];
    NSDictionary *result = [BSONDecoder decodeDictionaryWithDocument:resultDoc];
    
    // Save the data to prevent future re-reads
    _data = result;
    
    return result;
}
// Main Method to get data from
- (NSString *) getDataAt: (NSString *) keyPath {
    NSLog(@"LOG: FETCHING DATA AT KEYPATH: %@", keyPath);
    NSDictionary *data = self.data;
    NSString *contents = [data valueForKeyPath:keyPath];
    return contents;
}
// Main Method to get data from
- (NSArray *) getDataArrayAt: (NSString *) keyPath {
    NSLog(@"LOG: FETCHING DATA ARRAY AT KEYPATH: %@", keyPath);
    NSDictionary *data = self.data;
    NSArray *contents = [data valueForKeyPath:keyPath];
    return contents;
}
//update data
- (void) putDataAt: (NSString *) keyPath
         withMatch: (NSString *) match
       withContent: (NSString *) content{
    
    NSError *error = nil;
    MongoConnection *dbConn = [MongoConnection connectionForServer:@"107.170.91.187" error:&error];
    MongoDBCollection *collection = [dbConn collectionWithName:@"pennapps.mongo_test2"];
    MongoKeyedPredicate *predicate = [MongoKeyedPredicate predicate];
    [predicate keyPath:keyPath matches:match];
    MongoUpdateRequest *updateRequest = [MongoUpdateRequest updateRequestWithPredicate:predicate firstMatchOnly:NO];
    [updateRequest keyPath:keyPath setValue:content];
    [collection updateWithRequest:updateRequest error:&error];
    
    BSONDocument *resultDoc = [collection findOneWithPredicate:predicate error:&error];
    NSDictionary *result = [BSONDecoder decodeDictionaryWithDocument:resultDoc];
    NSLog(@"fetch result after update: %@", result);
    
}
- (NSString *) loginData {
    NSString *keyPath = [[NSString alloc] initWithFormat:@"container.%@.%@", self.login, self.password];
    return [self getDataAt: keyPath];
}
- (NSString *) getLoggedInDataAt: (NSString *) location{
    NSString *keyPath = [[NSString alloc] initWithFormat:@"container.%@.%@.%@", self.login, self.password, location];
    return [self getDataAt: keyPath];
    
}
@end