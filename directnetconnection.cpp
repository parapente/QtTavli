#include "directnetconnection.h"

directNetConnection::directNetConnection(QObject *parent) :
    QObject(parent)
{
    m_hostAddress = "0.0.0.0";
    m_hostPort = 0;
}

QString directNetConnection::hostAddress(void) const
{
    return m_hostAddress;
}

QString directNetConnection::connAddress(void) const
{
    return m_connAddress;
}

quint16 directNetConnection::hostPort(void) const
{
    return m_hostPort;
}

quint16 directNetConnection::connPort(void) const
{
    return m_connPort;
}

void directNetConnection::setHostAddress(const QString &address)
{
    m_hostAddress = address;
}

void directNetConnection::setConnAddress(const QString &address)
{
    m_connAddress = address;
}

void directNetConnection::setHostPort(const quint16 &port)
{
    m_hostPort = port;
}

void directNetConnection::setConnPort(const quint16 &port)
{
    m_connPort = port;
}

int directNetConnection::host(void)
{
    if (!m_server) {
        m_server = new QTcpServer();
    }
    m_server->setMaxPendingConnections(1);
    if (m_server->listen(QHostAddress(m_hostAddress), m_hostPort) == false) {
        return -1;
    }
    connect(m_server, SIGNAL(newConnection()), this, SLOT(handleNewConnection()));
    return 0;
}

void directNetConnection::closeHost(void)
{
    if (m_server) {
        m_server->close();
        disconnect(m_server, SIGNAL(newConnection()));
    }
}

void directNetConnection::handleNewConnection(void)
{
    if (m_socket)
        delete m_socket;

    m_socket = m_server->nextPendingConnection();
    closeHost();
}
