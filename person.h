#ifndef PERSON_H
#define PERSON_H

typedef struct person {
	int age;
	float high;
	const char *name;
} person;


// initialized and return a struct person vlaue
person person_info(int age, float high, char *name);

// print a rep of a person
void person_display(person*self);

#endif
