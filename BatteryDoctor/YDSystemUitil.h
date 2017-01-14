//
//  YDSystemUitil.h
//  YDKit
//
//  Created by bob on 16/2/23.
//  Copyright (c) 2016年 bob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface YDSystemUitil : NSObject

+ (CGFloat)appVersion;

+ (NSString *)appStringVersion;

+ (NSString *)appBundleIdentifier;

+ (CGFloat)currentSystemVersion;

+ (NSString *)currentSystemStringVersion;

+ (BOOL)isSystemVersionOver:(CGFloat)versionValue;

+ (NSString * )devicePlatform;

+ (NSString * )devicePlatformString;

+ (NSInteger)deviceDefaultSoc;

+ (BOOL)isiPad;

+ (BOOL)isiPhone;

+ (BOOL)isiPod;

+ (BOOL)isAppleTV;

+ (BOOL)isAppleWatch;

+ (BOOL)isSimulator;

+ (BOOL)isRetina;

+ (BOOL)isRetinaHD;

+ (BOOL)isJailBreak;

+ (BOOL)isCracked;

+ (NSUInteger)cpuFrequency;

+ (NSUInteger)busFrequency;

+ (NSUInteger)ramSize;

+ (NSUInteger)cpuNumber;

+ (NSUInteger)totalMemory;

+ (NSUInteger)userMemory;

+ (NSNumber * )totalDiskSpace;

+ (NSNumber * )freeDiskSpace;

+ (NSString * )macAddress DEPRECATED_MSG_ATTRIBUTE("In iOS 7 and later, if you ask for the MAC address of an iOS device, the system returns the value 02:00:00:00:00:00");

+ (NSString * )uniqueIdentifier;

+ (BOOL)isSystemVersionIs7;

+ (BOOL)isiPhone4Device;

+ (BOOL)isiPhone5Device;

+ (BOOL)isiPhone6Device;

+ (BOOL)isiPhone6PlusDevice;

/**
 *  权限
 */

+ (BOOL)isCameraAvailable;

+ (BOOL)isFrontCameraAvailable;

+ (BOOL)isCameraFlashAvailable;

+ (BOOL)canSendSMS;

+ (BOOL)canMakePhoneCall;

+ (BOOL)isAppCameraAccessAuthorized;

+ (BOOL)isAppPhotoLibraryAccessAuthorized;

/**
 *  frame
 */

+ (CGRect)screenBounds;

+ (CGFloat)currentScreenScale;

+ (CGSize)deviceScreenSize;

@end

NS_ASSUME_NONNULL_END
