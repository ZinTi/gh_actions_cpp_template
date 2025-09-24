#ifndef HELLO_CLIENT_H
#define HELLO_CLIENT_H

#include <string>

class HelloClient {
private:
    std::string name_;
public:
    HelloClient(const std::string& name);
    ~HelloClient(void) = default;

    void SayHello(void) const;
};

#endif // HELLO_CLIENT_H