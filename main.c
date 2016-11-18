
#include <stdio.h>

#ifdef _WIN32
CCONV
#endif
int foo(int a, short b, int *c)
{
	*c += a;
	return a + b;
}


int main()
{
	int x = 3;
	short y = 4;
	int z = 5;

	foo(x, y, &z);
	printf("x: %d, y: %hu, z: %d\n", x, y, z);
	return 42;		
}

