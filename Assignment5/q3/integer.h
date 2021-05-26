#ifndef __integer_h__
#define __integer_h__

struct integer;

struct integer* integer_create(int value);
int             integer_value(struct integer* integer);

#endif
