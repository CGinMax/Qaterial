#include "qaterial_plugin.h"
#include <qqml.h>

void QaterialPluginPlugin::registerTypes(const char* uri)
{
    qmlRegisterType(QUrl("qrc:/Qaterial/ApplicationWindow.qml"), uri, 1, 0, "ApplicationWindow");
    qmlRegisterType(QUrl("qrc:/Qaterial/Label.qml"), uri, 1, 0, "Label");
    qmlRegisterType(QUrl("qrc:/Qaterial/Button.qml"), uri, 1, 0, "Button");
//    qmlRegisterType(QUrl("qrc:/Qaterial/ApplicationWindow.qml"), uri, 1, 0, "ApplicationWindow");
}
