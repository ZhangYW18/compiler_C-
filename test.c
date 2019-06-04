int a;

int sum(int a,b) {
    int c;
    c = a + b;
    return c;
}

int main() {
    int b;
    a = 3;
    b = 5;
    while (b>0) {
	    if (a+4<15) {
		    a = sum(4, a);
	    } else {
		    a += 1;
	    }
	    b -= 1;
    }
	a -= 1;
	b = 5+a;
    return 0;
}
