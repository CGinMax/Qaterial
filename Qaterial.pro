TEMPLATE = lib
TARGET = Qaterial
QT += qml quick quickcontrols2
CONFIG += c++11 qtquickcompiler staticlib

TARGET = $$qtLibraryTarget($$TARGET)

DEFINES += QATERIAL_VERSION_MAJOR=1
DEFINES += QATERIAL_VERSION_MINOR=2
DEFINES += QATERIAL_VERSION_PATCH=1
DEFINES += QATERIAL_VERSION_TAG_HEX=0x00000000

SOURCES += \
    $$PWD/src/Utils.cpp \
    $$PWD/src/Version.cpp

HEADERS += \
    $$PWD/include/Qaterial/Qaterial.hpp \
    $$PWD/include/Qaterial/Export.hpp \
    $$PWD/include/Qaterial/Version.hpp \
    $$PWD/include/Qaterial/Utils.hpp

CONFIG(debug, debug|release){
    DESTDIR = $$PWD/../bin/debug/
}
else{
    DESTDIR = $$PWD/../bin/release/
}
INCLUDEPATH += $$PWD/include

#!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
#    copy_qmldir.target = $$OUT_PWD/qmldir
#    copy_qmldir.depends = $$_PRO_FILE_PWD_/qml/qmldir
#    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
#    QMAKE_EXTRA_TARGETS += copy_qmldir
#    PRE_TARGETDEPS += $$copy_qmldir.target

#    copy_qmltypes.target = $$OUT_PWD/plugins.qmltypes
#    copy_qmltypes.depends = $$_PRO_FILE_PWD_/qml/plugins.qmltypes
#    copy_qmltypes.commands = $(COPY_FILE) \"$$replace(copy_qmltypes.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmltypes.target, /, $$QMAKE_DIR_SEP)\"
#    QMAKE_EXTRA_TARGETS += copy_qmltypes
#    PRE_TARGETDEPS += $$copy_qmltypes.target
#}
unix {
    QMAKE_POST_LINK += $$quote(cp -r $$PWD/qml/* $$OUT_PWD/)
#    system(cp -r $$PWD/qml/* $$OUT_PWD/)
}

win32 {
    QMAKE_POST_LINK += $$quote(cmd /c copy /y $$PWD\\qml $$OUT_PWD\\)
}

qmldir.files = qml/qmldir
qrc.files = qml/Qaterial.qrc

RESOURCES += \
    qml/Qaterial.qrc

