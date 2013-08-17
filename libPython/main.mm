//
//  main.m
//  pythonpythonios
//
//  Created by Fancyzero on 13-7-6.
//  Copyright (c) 2013年 Fancyzero. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#include "Python.h"
#include <string>
extern "C" void initzlib(void);
int main(int argc, char *argv[])
{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"python" ofType:nil inDirectory:@""];
    std::string str = [path UTF8String];
    str += "/";
    char ppp[10240];
    strcpy( ppp, str.c_str());
    Py_SetPythonHome(ppp);
    Py_Initialize();
    initzlib();
    PyRun_SimpleString("from encodings import ascii");
    PyRun_SimpleString("from encodings import hex_codec");
    PyRun_SimpleString("import json");
        PyRun_SimpleString("import socket");
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
