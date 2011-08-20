#ifndef DIRECTNETCONNECTION_H
#define DIRECTNETCONNECTION_H

#include <QTcpSocket>
#include <QTcpServer>

class directNetConnection : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString hostAddress READ hostAddress WRITE setHostAddress NOTIFY hostAddressChanged)
    Q_PROPERTY(unsigned int hostPort READ hostPort WRITE setHostPort NOTIFY hostPortChanged)
    Q_PROPERTY(QString connAddress READ connAddress WRITE setConnAddress NOTIFY connAddressChanged)
    Q_PROPERTY(unsigned int connPort READ connPort WRITE setConnPort NOTIFY connPortChanged)

public:
    explicit directNetConnection(QObject *parent = 0);

    QString hostAddress(void) const;
    quint16 hostPort(void) const;
    QString connAddress(void) const;
    quint16 connPort(void) const;

    void setHostAddress(const QString &address);
    void setHostPort(const quint16 &port);
    void setConnAddress(const QString &address);
    void setConnPort(const quint16 &port);

    Q_INVOKABLE int host(void);
    Q_INVOKABLE void closeHost(void);

signals:
    void hostAddressChanged(void);
    void hostPortChanged(void);
    void connAddressChanged(void);
    void connPortChanged(void);

public slots:
    void handleNewConnection(void);

private:
    QString m_hostAddress;
    quint16 m_hostPort;
    QString m_connAddress;
    quint16 m_connPort;
    QTcpServer *m_server;
    QTcpSocket *m_socket;
};

#endif // DIRECTNETCONNECTION_H
