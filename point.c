#include <stdio.h>
#include "point.h"

Point Point_vlau(double x, double y)
{
    Point initialized = { x, y };
    return initialized;
}

void Point_print(Point *self)
{
    printf("(%f, %f)\n", self->x, self->y);
}
