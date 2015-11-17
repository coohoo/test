//
//  DVNetWorkEnum.h
//  DVBands
//
//  Created by Devond on 15/11/16.
//  Copyright © 2015年 Devond. All rights reserved.
//

#ifndef DVNetWorkEnum_h
#define DVNetWorkEnum_h

typedef enum {
    RequestTypeRegister                                = 0,
    RequestTypeLogin,
    RequestTypeLogout,
    RequestTypeGetDevicesList,
    RequestTypeGetDeviceDetail,
    RequestTypeUpdateDevice,
    RequestTypeSendMessage,
    RequestTypeGetMessagesList,
}RequestType;


#endif /* DVNetWorkEnum_h */
