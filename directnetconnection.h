#ifndef DIRECTNETCONNECTION_H
#define DIRECTNETCONNECTION_H

#include <QTcpSocket>

class directNetConnection : public QTcpSocket
{
    Q_OBJECT

    Q_PROPERTY(QString address READ address WRITE setAddress NOTIFY addressChanged)
    Q_PROPERTY(unsigned int port READ port WRITE setPort NOTIFY portChanged)

public:
    explicit directNetConnection(QObject *parent = 0);

    QString address(void) const;
    quint16 port(void) const;

    void setAddress(const QString &address);
    void setPort(const quint16 &port);

signals:
    void addressChanged(void);
    void portChanged(void);

public slots:

private:
    QString m_address;
    quint16 m_port;
};

#endif // DIRECTNETCONNECTION_H
