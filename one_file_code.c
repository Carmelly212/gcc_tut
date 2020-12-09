#include <stdio.h>

typedef struct Point {
    double x;
    double y;

} Point;

/**
 * Inintailast and returna Point struct value.
 */
 Point Point_vlau(double x, double y);

/**
 * Print a represntaton of a Point to stdout
*/
void Point_print(Point *self);

Point Point_vlau(double x, double y)
{
    Point initialized = { x, y };
    return initialized;
}

void Point_print(Point *self)
{
    printf("(%f, %f)\n", self->x, self->y);
}


int main () {

    Point a = Point_vlau(1.0,2.0);
    Point_print(&a);
}

