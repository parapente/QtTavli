#include "directnetconnection.h"

directNetConnection::directNetConnection(QObject *parent) :
    QTcpSocket(parent)
{
}

QString directNetConnection::address(void) const
{
    return m_address;
}

quint16 directNetConnection::port(void) const
{
    return m_port;
}

void directNetConnection::setAddress(const QString &address)
{
    m_address = address;
}

void directNetConnection::setPort(const quint16 &port)
{
    m_port = port;
}
