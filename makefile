CXX := g++
CXXFLAGS := -Ofast -g -Wfatal-errors -Wall -Wextra -Wpedantic -Wconversion -Wshadow -pedantic-errors -std=c++11
TARGET := TestApp

INC_DIRS :=

LIB_DIRS :=

LIBS :=

# $(wildcard *.cpp /xxx/xxx/*.cpp): get all .cpp files from the current directory and dir "/xxx/xxx/"
SRCS := $(wildcard *.cpp)
# $(patsubst %.cpp,%.o,$(SRCS)): substitute all ".cpp" file name strings to ".o" file name strings
OBJS := $(patsubst %.cpp,%.o,$(SRCS))

DEP := $(patsubst %.o,%.d,$(OBJS))

all: $(TARGET)
$(TARGET): $(OBJS) makefile
	$(CXX) $(LIB_DIRS) $(LIBS) -o $@ $(OBJS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INC_DIRS) -MMD -c $<

-include $(DEP)

clean:
	rm -rf $(TARGET) *.o *.d

.PHONY: all clean
