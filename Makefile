RELEASE=0
TARGET= cpp_sau
OBJDir= Debug
SRCDir= Src
INCDir= Inc
SRCS= $(wildcard $(SRCDir)/*.cpp)
OBJS= $(patsubst $(SRCDir)/%.cpp, $(OBJDir)/%.o, $(SRCS))
DEPS= $(OBJS:.o=.d)
CXX= g++

ifeq ($(RELEASE), 1)
CXXFLAGS= -Wall -O2 -std=c++11 -MMD -I$(INCDir)
else
CXXFLAGS= -Wall -g -O0 -std=c++11 -MMD -I$(INCDir)
endif

all : $(TARGET).exe

$(TARGET).exe : $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(OBJDir):
	mkdir -p $@

$(OBJDir)/%.o : $(SRCDir)/%.cpp | $(OBJDir)
	$(CXX) -c $(CXXFLAGS) $< -o $@

clean:
	rm -f $(OBJDir)/*.o $(OBJDir)/*.d *.exe

-include $(DEPS)

.PHONY: all clean