#include "hello-client.h"
#include <iostream>

HelloClient::HelloClient(const std::string& name) : name_(name) {}

void HelloClient::SayHello(void) const {
    std::cout << "Hello, " << name_ << "!" << std::endl;
}