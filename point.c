#include <stdio.h>
#include "point.h"

Point Point_vlau(double x, double y)
{
    Point initalized = { x, y };
    return initalized;
}

void Point_print(Point *self)
{
    printf("(%f, %f)\n", self->x, self->y);
}