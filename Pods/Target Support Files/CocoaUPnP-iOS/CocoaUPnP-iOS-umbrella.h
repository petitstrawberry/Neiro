#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CocoaUPnP.h"
#import "UPPEventServer.h"
#import "UPPEventSubscription.h"
#import "UPPEventSubscriptionManager.h"
#import "NSArray+firstObjectMatchingPredicate.h"
#import "NSMutableString+xmlNode.h"
#import "ONOXMLDocument+StringValueOrNil.h"
#import "UPPMetadataHelper.h"
#import "UPPBasicDevice.h"
#import "UPPConstants.h"
#import "UPPDeviceIcon.h"
#import "UPPError.h"
#import "UPPMediaItem.h"
#import "UPPMediaItemArtwork.h"
#import "UPPMediaItemResource.h"
#import "UPPMediaRendererDevice.h"
#import "UPPMediaServerDevice.h"
#import "UPPParameters.h"
#import "UPPServiceDescription.h"
#import "SSDPService.h"
#import "SSDPServiceBrowser.h"
#import "UPPDiscovery.h"
#import "UPPRequestSerializer.h"
#import "UPPResponseSerializer.h"
#import "UPPSessionManager.h"
#import "UPPBaseParser.h"
#import "UPPDeviceParser.h"
#import "UPPErrorParser.h"
#import "UPPLastChangeParser.h"
#import "UPPMediaItemParser.h"
#import "UPPResponseParser.h"
#import "UPPMediaItemProtocol.h"
#import "UPPAVTransportService.h"
#import "UPPBasicService.h"
#import "UPPConnectionManagerService.h"
#import "UPPContentDirectoryService.h"
#import "UPPRenderingControlService.h"

FOUNDATION_EXPORT double CocoaUPnPVersionNumber;
FOUNDATION_EXPORT const unsigned char CocoaUPnPVersionString[];

