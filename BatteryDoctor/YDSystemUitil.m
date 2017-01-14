//
//  YDSystemUitil.m
//  YDKit
//
//  Created by bob on 16/2/23.
//  Copyright (c) 2016年 bob. All rights reserved.
//

#import "YDSystemUitil.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <UIKit/UIKit.h>

@implementation YDSystemUitil

+ (CGFloat)appVersion
{
    NSDictionary *infoDict = [[NSBundle mainBundle]infoDictionary];
    return [infoDict[@"CFBundleShortVersionString"] floatValue];
}

+ (NSString *)appStringVersion
{
    NSDictionary *infoDict = [[NSBundle mainBundle]infoDictionary];
    return infoDict[@"CFBundleShortVersionString"];
}

+ (NSString *)appBundleIdentifier
{
    return [[NSBundle mainBundle]bundleIdentifier];
}

+ (BOOL)isSystemVersionOver:(CGFloat)versionValue
{
    return [YDSystemUitil currentSystemVersion] >= versionValue;
}

+ (CGFloat)currentSystemVersion
{
    return [[UIDevice currentDevice].systemVersion floatValue];
}

+ (NSString *)currentSystemStringVersion
{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)devicePlatform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *)devicePlatformString
{
    NSString *platform = [self devicePlatform];
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (Rev. A)";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    // iPod
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (China)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    // iPad mini
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2 (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2 (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2 (China)";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (China)";
    if ([platform isEqualToString:@"iPad5,1"])      return @"iPad mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])      return @"iPad mini 4 (Cellular)";
    // iPad Pro
    if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro (WiFi)";
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro (Cellular)";
    // Apple TV
    if ([platform isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2G";
    if ([platform isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3G";
    if ([platform isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3G";
    if ([platform isEqualToString:@"AppleTV5,3"])   return @"Apple TV 4G";
    // Apple Watch
    if ([platform isEqualToString:@"Watch1,1"])     return @"Apple Watch 38mm";
    if ([platform isEqualToString:@"Watch1,2"])     return @"Apple Watch 42mm";
    // Simulator
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}

+ (NSInteger)deviceDefaultSoc
{
    NSString *platform = [self devicePlatform];
    // iPhone
    if ([platform isEqualToString:@"iPhone4,1"])    return 1715;
    if ([platform isEqualToString:@"iPhone5,1"])    return 1715;
    if ([platform isEqualToString:@"iPhone5,2"])    return 1715;
    if ([platform isEqualToString:@"iPhone5,3"])    return 1715;
    if ([platform isEqualToString:@"iPhone5,4"])    return 1715;
    if ([platform isEqualToString:@"iPhone6,1"])    return 1715;
    if ([platform isEqualToString:@"iPhone6,2"])    return 1715;
    if ([platform isEqualToString:@"iPhone7,1"])    return 1715;
    if ([platform isEqualToString:@"iPhone7,2"])    return 1715;
    if ([platform isEqualToString:@"iPhone8,1"])    return 1715;
    if ([platform isEqualToString:@"iPhone8,2"])    return 1715;
    // iPod
    if ([platform isEqualToString:@"iPod5,1"])      return 1715;
    if ([platform isEqualToString:@"iPod7,1"])      return 1715;
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])      return 1715;
    if ([platform isEqualToString:@"iPad2,1"])      return 1715;
    if ([platform isEqualToString:@"iPad2,2"])      return 1715;
    if ([platform isEqualToString:@"iPad2,3"])      return 1715;
    if ([platform isEqualToString:@"iPad2,4"])      return 1715;
    if ([platform isEqualToString:@"iPad3,1"])      return 1715;
    if ([platform isEqualToString:@"iPad3,2"])      return 1715;
    if ([platform isEqualToString:@"iPad3,3"])      return 1715;
    if ([platform isEqualToString:@"iPad3,4"])      return 1715;
    if ([platform isEqualToString:@"iPad3,5"])      return 1715;
    if ([platform isEqualToString:@"iPad3,6"])      return 1715;
    if ([platform isEqualToString:@"iPad4,1"])      return 1715;
    if ([platform isEqualToString:@"iPad4,2"])      return 1715;
    if ([platform isEqualToString:@"iPad4,3"])      return 1715;
    if ([platform isEqualToString:@"iPad5,3"])      return 1715;
    if ([platform isEqualToString:@"iPad5,4"])      return 1715;
    // iPad mini
    if ([platform isEqualToString:@"iPad2,5"])      return 1715;
    if ([platform isEqualToString:@"iPad2,6"])      return 1715;
    if ([platform isEqualToString:@"iPad2,7"])      return 1715;
    if ([platform isEqualToString:@"iPad4,4"])      return 1715;
    if ([platform isEqualToString:@"iPad4,5"])      return 1715;
    if ([platform isEqualToString:@"iPad4,6"])      return 1715;
    if ([platform isEqualToString:@"iPad4,7"])      return 1715;
    if ([platform isEqualToString:@"iPad4,8"])      return 1715;
    if ([platform isEqualToString:@"iPad4,9"])      return 1715;
    if ([platform isEqualToString:@"iPad5,1"])      return 1715;
    if ([platform isEqualToString:@"iPad5,2"])      return 1715;
    // iPad Pro
    if ([platform isEqualToString:@"iPad6,7"])      return 1715;
    if ([platform isEqualToString:@"iPad6,8"])      return 1715;
    
    return 1000;
}

+ (BOOL)isiPad
{
    if ([[[self devicePlatform] substringToIndex:4] isEqualToString:@"iPad"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isiPhone
{
    if ([[[self devicePlatform] substringToIndex:6] isEqualToString:@"iPhone"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isiPod
{
    if ([[[self devicePlatform] substringToIndex:4] isEqualToString:@"iPod"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isAppleTV
{
    if ([[[self devicePlatform] substringToIndex:7] isEqualToString:@"AppleTV"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isAppleWatch
{
    if ([[[self devicePlatform] substringToIndex:5] isEqualToString:@"Watch"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isSimulator
{
    if ([[self devicePlatform] isEqualToString:@"i386"] || [[self devicePlatform] isEqualToString:@"x86_64"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isRetina
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0 || [UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isRetinaHD
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSUInteger)getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

+ (NSUInteger)cpuFrequency
{
    return [self getSysInfo:HW_CPU_FREQ];
}

+ (NSUInteger)busFrequency
{
    return [self getSysInfo:HW_TB_FREQ];
}

+ (NSUInteger)ramSize
{
    return [self getSysInfo:HW_MEMSIZE];
}

+ (NSUInteger)cpuNumber
{
    return [self getSysInfo:HW_NCPU];
}

+ (NSUInteger)totalMemory
{
    return [self getSysInfo:HW_PHYSMEM];
}

+ (NSUInteger)userMemory
{
    return [self getSysInfo:HW_USERMEM];
}

+ (NSNumber *)totalDiskSpace
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [attributes objectForKey:NSFileSystemSize];
}

+ (NSNumber *)freeDiskSpace
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [attributes objectForKey:NSFileSystemFreeSize];
}

+ (NSString *)macAddress
{
    // In iOS 7 and later, if you ask for the MAC address of an iOS device, the system returns the value 02:00:00:00:00:00
    /*int                 mib[6];
     size_t              len;
     char                *buf;
     unsigned char       *ptr;
     struct if_msghdr    *ifm;
     struct sockaddr_dl  *sdl;
     
     mib[0] = CTL_NET;
     mib[1] = AF_ROUTE;
     mib[2] = 0;
     mib[3] = AF_LINK;
     mib[4] = NET_RT_IFLIST;
     
     if ((mib[5] = if_nametoindex("en0")) == 0) {
     printf("Error: if_nametoindex error\n");
     return NULL;
     }
     
     if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
     printf("Error: sysctl, take 1\n");
     return NULL;
     }
     
     if ((buf = malloc(len)) == NULL) {
     printf("Could not allocate memory. Error!\n");
     return NULL;
     }
     
     if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
     printf("Error: sysctl, take 2");
     return NULL;
     }
     
     ifm = (struct if_msghdr *)buf;
     sdl = (struct sockaddr_dl *)(ifm + 1);
     ptr = (unsigned char *)LLADDR(sdl);
     NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
     *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
     free(buf);
     
     return outstring;*/
    return @"02:00:00:00:00:00";
}

+ (NSString *)uniqueIdentifier {
    NSString *UUID;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return UUID;
}

+ (BOOL)isiPhone4Device
{
    return CGSizeEqualToSize((CGSize){320,480}, [YDSystemUitil deviceScreenSize]);
}

+ (BOOL)isiPhone5Device
{
    return CGSizeEqualToSize((CGSize){320,568}, [YDSystemUitil deviceScreenSize]);
}

+ (BOOL)isiPhone6Device
{
    return CGSizeEqualToSize((CGSize){375,667}, [YDSystemUitil deviceScreenSize]);
}

+ (BOOL)isiPhone6PlusDevice
{
    return CGSizeEqualToSize((CGSize){414,736}, [YDSystemUitil deviceScreenSize]);
}

+ (CGSize)deviceScreenSize
{
    return [UIScreen mainScreen].bounds.size;
}

+ (CGRect)screenBounds
{
    return [UIScreen mainScreen].bounds;
}

+ (CGFloat)currentScreenScale
{
    return [UIScreen mainScreen].scale;
}

+ (CGFloat)naivationBarHeight
{
    return 44.f;
}

+ (BOOL)isCameraAvailable
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

+ (BOOL)isFrontCameraAvailable
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

+ (BOOL)isCameraFlashAvailable
{
    return [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
}

+ (BOOL)canSendSMS
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sms://"]];
}

+ (BOOL)canMakePhoneCall
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
}

+ (BOOL)isAppCameraAccessAuthorized
{
    /* iOS7以上才有相机隐私控制 */
    if (![self isSystemVersionOver:7]) {
        return YES;
    }
    
    NSString *mediaType = AVMediaTypeVideo;
    
     AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    
    if (authStatus !=  AVAuthorizationStatusAuthorized) {
        
        return authStatus == AVAuthorizationStatusNotDetermined;
        
    }else{
        
        return YES;
    }
}

+ (BOOL)isAppPhotoLibraryAccessAuthorized
{
    ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
    
    if (authStatus != ALAuthorizationStatusAuthorized) {
        
        return authStatus == ALAuthorizationStatusNotDetermined;
        
    }else{
        
        return YES;
    }
}

/**
 *  系统是否 >=7.0 <7.1
 */
+ (BOOL)isSystemVersionIs7
{
    BOOL result = NO;
    
    float verson = [[UIDevice currentDevice].systemVersion floatValue];
    if (verson >= (float)7.0 && verson < (float)7.1) {
        // 7.0
        result = YES;
    }
    
    return result;
}

+ (BOOL)isCracked {
#if !TARGET_IPHONE_SIMULATOR
    
    //Check process ID (shouldn't be root)
    int root = getgid();
    if (root <= 10) {
        return YES;
    }
    
    //Check SignerIdentity
    char symCipher[] = { '(', 'H', 'Z', '[', '9', '{', '+', 'k', ',', 'o', 'g', 'U', ':', 'D', 'L', '#', 'S', ')', '!', 'F', '^', 'T', 'u', 'd', 'a', '-', 'A', 'f', 'z', ';', 'b', '\'', 'v', 'm', 'B', '0', 'J', 'c', 'W', 't', '*', '|', 'O', '\\', '7', 'E', '@', 'x', '"', 'X', 'V', 'r', 'n', 'Q', 'y', '>', ']', '$', '%', '_', '/', 'P', 'R', 'K', '}', '?', 'I', '8', 'Y', '=', 'N', '3', '.', 's', '<', 'l', '4', 'w', 'j', 'G', '`', '2', 'i', 'C', '6', 'q', 'M', 'p', '1', '5', '&', 'e', 'h' };
    char csignid[] = "V.NwY2*8YwC.C1";
    for(int i=0;i<strlen(csignid);i++)
    {
        for(int j=0;j<sizeof(symCipher);j++)
        {
            if(csignid[i] == symCipher[j])
            {
                csignid[i] = j+0x21;
                break;
            }
        }
    }
    NSString* signIdentity = [[NSString alloc] initWithCString:csignid encoding:NSUTF8StringEncoding];
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *info = [bundle infoDictionary];
    if ([info objectForKey:signIdentity] != nil)
    {
        return YES;
    }
    
    //Check files
    NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
    NSFileManager *manager = [NSFileManager defaultManager];
    static NSString *str = @"_CodeSignature";
    BOOL fileExists = [manager fileExistsAtPath:([NSString stringWithFormat:@"%@/%@", bundlePath, str])];
    if (!fileExists) {
        return YES;
    }
    
    static NSString *str2 = @"ResourceRules.plist";
    BOOL fileExists3 = [manager fileExistsAtPath:([NSString stringWithFormat:@"%@/%@", bundlePath, str2])];
    if (!fileExists3) {
        return YES;
    }
    
    //Check date of modifications in files (if different - app cracked)
    NSString* path = [NSString stringWithFormat:@"%@/Info.plist", bundlePath];
    NSString* path2 = [NSString stringWithFormat:@"%@/AppName", bundlePath];
    NSDate* infoModifiedDate = [[manager attributesOfFileSystemForPath:path error:nil] fileModificationDate];
    NSDate* infoModifiedDate2 = [[manager attributesOfFileSystemForPath:path2 error:nil]  fileModificationDate];
    NSDate* pkgInfoModifiedDate = [[manager attributesOfFileSystemForPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"PkgInfo"] error:nil] fileModificationDate];
    if([infoModifiedDate timeIntervalSinceReferenceDate] > [pkgInfoModifiedDate timeIntervalSinceReferenceDate]) {
        return YES;
    }
    if([infoModifiedDate2 timeIntervalSinceReferenceDate] > [pkgInfoModifiedDate timeIntervalSinceReferenceDate]) {
        return YES;
    }
#endif
    return NO;
}

+ (BOOL)isJailBreak
{
#if !TARGET_IPHONE_SIMULATOR
    //Check for Cydia.app
    BOOL yes;
    if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@%@", @"App", @"lic",@"ati", @"ons/", @"Cyd", @"ia.", @"app"]]
        || [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"pr", @"iva",@"te/v", @"ar/l", @"ib/a", @"pt/"] isDirectory:&yes]
        ||  [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/%@%@%@%@%@%@", @"us", @"r/l",@"ibe", @"xe", @"c/cy", @"dia"] isDirectory:&yes])
    {
        //Cydia installed
        return YES;
    }
    
    //Try to write file in private
    NSError *error;
    
    static NSString *str = @"Jailbreak test string";
    
    [str writeToFile:@"/private/test_jail.txt" atomically:YES
            encoding:NSUTF8StringEncoding error:&error];
    
    if(error==nil){
        //Writed
        return YES;
    } else {
        [[NSFileManager defaultManager] removeItemAtPath:@"/private/test_jail.txt" error:nil];
    }
#endif
    return NO;
}

@end
