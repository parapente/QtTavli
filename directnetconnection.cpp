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

bool directNetConnection::sendMsg(uint serial, quint8 code, quint16 data)
{
    char *packet;
    quint8 size;
    int retValue;

    size = sizeof(uint);
    packet = new char[size+3];
    for (int i=0; i<size; i++)
        packet[i] = (char) ((serial >> (i*8)) & 0xff);
    packet[size] = code;
    packet[size+1] = (char) (data & 0xff);
    packet[size+2] = (char) ((data >> 1) & 0xff);
    retValue = m_socket->write(packet, size+3);

    delete packet;

    if (retValue ==1)
        return false;
    else
        return true;
}

bool directNetConnection::readMsg(uint &serial, uchar &code, ushort &data)
{
    char *packet;
    quint8 size;

    size = sizeof(uint);
    packet = new char[size+3];
    if (m_socket->read(packet, size+3) == -1) {
        delete packet;
        return false;
    }
    else {
        serial = 0;
        for (int i=0; i<size; i++)
            serial |= ((uint) (uchar) packet[i]) << (i*8);
        code = packet[size];
        data = (uchar) packet[size+1];
        data |= ((uint) (uchar) packet[size+2]) << 8;
        delete packet;
        return true;
    }
}
