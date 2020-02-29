//
//  CocoaWindow.hpp
//  SoftProjector
//
//  Created by Max Nedorezov on 1/20/20.
//

#ifndef CocoaWindow_hpp
#define CocoaWindow_hpp

#include <stdio.h>
#include <Cocoa/Cocoa.h>
#include <QMacNativeWidget>

class CocoaWindow {
    NSWindow *window = nullptr;
public:
    CocoaWindow(QMacNativeWidget *native_widget);

    void show();
    void close();
};

#endif /* CocoaWindow_hpp */
