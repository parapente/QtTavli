#include <QApplication>
#include <qdeclarative.h>
#include "qmlapplicationviewer.h"
#include "directnetconnection.h"
#include "dice.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<directNetConnection>("TavliLib", 1, 0, "DirectNetConnection");
    qmlRegisterType<dice>("TavliLib", 1, 0, "Dice");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/QtTavli/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
