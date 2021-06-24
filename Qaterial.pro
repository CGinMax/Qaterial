TEMPLATE = lib
TARGET = QaterialPlugin
QT += qml quick quickcontrols2
CONFIG += c++11 qtquickcompiler

TARGET = $$qtLibraryTarget($$TARGET)

#SOURCES += \
#    qaterial_plugin.cpp

#HEADERS += \
#    qaterial_plugin.h
CONFIG(debug, debug|release){
    DESTDIR = $$PWD/../bin/debug/Qaterial
}
else{
    DESTDIR = $$PWD/../bin/release/Qaterial
}

#message("_PRO_FILE_PWD_= $$_PRO_FILE_PWD_")
!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qml/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}
unix {
    system(cp -r $$PWD/qml/* $$OUT_PWD/)
}

qmldir.files = qml/qmldir
qrc.files = qml/Qaterial.qrc

RESOURCES += \
    qml/Qaterial.qrc

