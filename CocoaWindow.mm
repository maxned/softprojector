//
//  CocoaWindow.cpp
//  SoftProjector
//
//  Created by Max Nedorezov on 1/20/20.
//

#include "CocoaWindow.hpp"

CocoaWindow::CocoaWindow(QMacNativeWidget *nativeWidget)
{
    NSRect frame = [[NSScreen screens][1] frame];

    window = [[NSWindow alloc] initWithContentRect:frame
                                         styleMask:NSBorderlessWindowMask
                                           backing:NSBackingStoreBuffered
                                             defer:NO];

    [window setOpaque:NO];
    [window setLevel:CGShieldingWindowLevel()];
    [window setBackgroundColor:[NSColor colorWithDeviceRed:0.0 green:0.0 blue:1.0 alpha:0.4]];

    // Adjust Cocoa layouts
    NSView *nativeWidgetView = reinterpret_cast<NSView *>(nativeWidget->winId());
    NSView *contentView = [window contentView];
    [contentView setAutoresizesSubviews:YES];
    //[nativeWidgetView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    //[nativeWidgetView setAutoresizesSubviews:YES];
    [contentView addSubview:nativeWidgetView positioned:NSWindowAbove relativeTo:nil];

    close();
}

void CocoaWindow::show()
{
    if (!window) return;
    
    [window orderFrontRegardless];
}

void CocoaWindow::close()
{
    if (!window) return;

    [window orderOut:nil];
}
