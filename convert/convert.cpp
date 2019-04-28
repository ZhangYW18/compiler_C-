#include "convert.h"
#include <cstdlib>

string int2str(int n) {
	char buf[10];
	sprintf(buf, "%d", n);
	string b = buf;
	return b;
}

int str2int(string s) {
	int n;
	n = atoi(s.c_str());
	return n;
}
