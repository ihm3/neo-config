#include <stdint.h>
#include <stdio.h>

#define METEHAN 0

class MyClass {

public:
    MyClass();
    MyClass(MyClass &&) = default;
    MyClass(const MyClass &) = default;
    MyClass &operator=(MyClass &&) = default;
    MyClass &operator=(const MyClass &) = default;
    ~MyClass();

private:

};

MyClass::MyClass() {
}

MyClass::~MyClass() {
}

int main(void)
{
    printf("metehan");
    return 0;
}
