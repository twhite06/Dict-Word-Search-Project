# Makefile for Gerp
#
## Homework 5 (fall 2019)
#

CXX      = clang++
CXXFLAGS = -g3 -Wall -Wextra -std=c++11 

gerp: main.o stringProcessing.o HashClass.o FSTree.o DirNode.o
	${CXX} -O2 -o $@ $^

FSTree: FSTree.o
	$(CXX) $(LDFLAGS) -O2 -o FSTree FSTreeTraversal.o DirNode.o FSTree.o HashClass.cpp
	

tests: testingMain.o 
	$(CXX) $(LDFLAGS) -O2 -o tests testingMain.o HashClass.cpp

%.o: %.cpp $(shell echo *.h)
	${CXX} ${CXXFLAGS} -c $<

OBJECTS = main.o stringProcessing.o HashClass.o gerp

clean: 
	rm -f ${OBJECTS}

provide:
	provide comp15 proj2  \
	        README Makefile
