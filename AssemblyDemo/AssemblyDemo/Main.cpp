//https://www.cs.virginia.edu/~evans/cs216/guides/vsasm.html
extern "C" {
    void doit();
    void multiplyOverflow();
    void division();
}
void main() {
    division();
    multiplyOverflow();
	doit();
 }