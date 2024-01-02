CXX 		=	c++
NAME		=	chimera_example
RM 			=	rm -rvf
CPPFLAGS 	=	
SRCS		=	main.cpp
OBJS		=	$(SRCS:.cpp=.o)

all:
	mkdir -p build;\
	cd build && cmake .. && make