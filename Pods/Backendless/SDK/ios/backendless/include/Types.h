//
//  Types.h
//  backendlessAPI
/*
 * *********************************************************************************************************************
 *
 *  BACKENDLESS.COM CONFIDENTIAL
 *
 *  ********************************************************************************************************************
 *
 *  Copyright 2018 BACKENDLESS.COM. All Rights Reserved.
 *
 *  NOTICE: All information contained herein is, and remains the property of Backendless.com and its suppliers,
 *  if any. The intellectual and technical concepts contained herein are proprietary to Backendless.com and its
 *  suppliers and may be covered by U.S. and Foreign Patents, patents in process, and are protected by trade secret
 *  or copyright law. Dissemination of this information or reproduction of this material is strictly forbidden
 *  unless prior written permission is obtained from Backendless.com.
 *
 *  ********************************************************************************************************************
 */
#import <Foundation/Foundation.h>

/*******************************************************************************************************
 * Types singleton accessor: this is how you should ALWAYS get a reference to the Types class instance *
 *******************************************************************************************************/
#define __types [Types sharedInstance]

@interface Types : NSObject {
    NSMutableDictionary	*abstractMappings;
    NSMutableDictionary	*clientMappings;
    NSMutableDictionary	*serverMappings;
    NSMapTable<Class, NSMutableDictionary *> *propertyMappings;
}

@property (nonatomic, retain) NSString *swiftClassPrefix;

// Singleton accessor:  this is how you should ALWAYS get a reference to the class instance.  Never init your own.
+(Types *)sharedInstance;

// type mapping
-(void)addAbstractClassMapping:(Class)abstractType mapped:(Class)mappedType;
-(Class)getAbstractClassMapping:(Class)type;
-(void)addClientClassMapping:(NSString *)clientClass mapped:(Class)mappedServerType;
-(Class)getServerTypeForClientClass:(NSString *)clientClass;
-(NSString *)getClientClassForServerType:(NSString *)serverClassName;
-(NSString *)objectMappedClassName:(id)obj;
-(NSString *)typeMappedClassName:(Class)type;
-(void)addClientPropertyMappingForClass:(Class)clientClass columnName:(NSString *)columnName propertyName:(NSString *)propertyName;
-(NSDictionary *)getPropertiesMappingForClientClass:(Class)clientClass;
// type reflection
+(NSString *)objectClassName:(id)obj;
+(NSString *)typeClassName:(Class)type;
+(NSString *)insideTypeClassName:(Class)type;
-(id)classInstance:(Class)type;
-(Class)classByName:(NSString *)className;
+(id)classInstanceByClassName:(NSString *)className;
+(BOOL)isAssignableFrom:(Class)type toObject:(id)obj;
+(NSArray *)propertyKeys:(id)obj;
+(NSArray *)propertyAttributes:(id)obj;
+(NSDictionary *)propertyKeysWithAttributes:(id)obj;
+(NSDictionary *)propertyDictionary:(id)obj;
// get swift class prefix from the caller class (usually AppDelegate), item = [NSThread callStackSymbols][1];
-(void)makeSwiftClassPrefix:(NSString *)item;
// target/plist options
+(NSString *)targetName;
+(NSDictionary *)getInfoPlist;
+(id)getInfoPlist:(NSString *)key;
// try/catch functionality for swift by wrapping around Objective-C
+(void)tryblock:(void(^)(void))tryblock catchblock:(void(^)(id exception))catchblock finally:(void(^)(void))finally;
+(void)tryblock:(void(^)(void))tryblock catchblock:(void(^)(id exception))catchblock;
+(void)throwObjectAsException:(id)obj;
@end

@interface NSDictionary (Class)
-(id)objectForClassKey:(Class)classKey;
-(id)objectForObjectKey:(id)objectKey;
@end

@interface NSMutableDictionary (Class)
-(void)setObject:(id)anObject forClassKey:(Class)classKey;
-(void)setObject:(id)anObject forObjectKey:(id)objectKey;
@end

@interface NSObject (AMF)
-(id)onAMFSerialize;
-(id)onAMFDeserialize;
+(id)pastAMFDeserialize:(id)obj;
@end

@interface NSString (Chars)
-(NSString *)firstCharToUpper;
-(NSString *)stringByTrimmingWhitespace;
+(NSString *)randomString:(int)numCharacters;
@end

@interface NSObject (Properties)
-(Class)ofClass;
-(BOOL)isPropertyResolved:(NSString *)name;
-(BOOL)getPropertyIfResolved:(NSString *)name value:(id *)value;
-(BOOL)resolveProperty:(NSString *)name;
-(BOOL)resolveProperty:(NSString *)name value:(id)value;
-(BOOL)resolveProperties:(NSDictionary *)properties;
-(BOOL)replaceProperty:(NSString *)name;
-(BOOL)replaceProperties:(NSArray *)names;
-(BOOL)replaceAllProperties;
@end
