#include "dice.h"

dice::dice(QObject *parent) :
    QObject(parent)
{
}

void dice::setSeed(uint seed)
{
    m_seed = seed;
    qsrand(seed);
}

uint dice::seed(void) const
{
    return m_seed;
}

uint dice::random(void)
{
    return qrand();
}
