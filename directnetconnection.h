#ifndef DIRECTNETCONNECTION_H
#define DIRECTNETCONNECTION_H

#include <QTcpSocket>

class directNetConnection : public QTcpSocket
{
    Q_OBJECT
public:
    explicit directNetConnection(QObject *parent = 0);

signals:

public slots:

};

#endif // DIRECTNETCONNECTION_H
