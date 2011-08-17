#include "directnetconnection.h"

directNetConnection::directNetConnection(QObject *parent) :
    QTcpSocket(parent)
{
}
