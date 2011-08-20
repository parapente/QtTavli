#ifndef DICE_H
#define DICE_H

#include <QObject>

class dice : public QObject
{
    Q_OBJECT

    Q_PROPERTY(unsigned int seed READ seed WRITE setSeed)

public:
    explicit dice(QObject *parent = 0);

    uint seed(void) const;
    void setSeed(uint seed);
    Q_INVOKABLE uint random(void);

private:
    uint m_seed;
};

#endif // DICE_H
