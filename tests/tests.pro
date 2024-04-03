QT += quick multimedia multimediawidgets testlib

CONFIG += warn_on qmltestcase testlib

INCLUDEPATH = $$PWD/../app

IMPORTPATH += $$PWD/../app

QML_IMPORT_PATH +=\
    $$PWD/../app

TEMPLATE = app

TARGET = tst_example

RESOURCES += tests.qrc

DISTFILES += \
    tst_InteractiveButtons.qml \
    tst_MoviePlayer.qml \
    tst_MovieInfoBox.qml \
    
# $$PWD/../app/MoviePlayer.qml

SOURCES += \
    main.cpp \
    mediaboxtestsetup.cpp \
    $$PWD/../app/movieinfo.cpp \
    $$PWD/../app/playercontroller.cpp

HEADERS += \
    mediaboxtestsetup.h \
    $$PWD/../app/movieinfo.h \
    $$PWD/../app/playercontroller.h
