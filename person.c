#include <stdio.h>
#include "person.h"

person person_info(int age, float high, char *name)
{
	person start = { age, high, name };
	return start;
}

void person_display(person*self)
{		
	printf("age = %d, how high = %0.1f, WIFE LAST NAME: %s\n", self->age, self->high, self->name);
}
