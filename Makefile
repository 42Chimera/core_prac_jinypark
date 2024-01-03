CXX 		=	c++
NAME		=	chimera_example
RM 			=	rm -rvf
CPPFLAGS 	=	
SRCS		=	main.cpp
OBJS		=	$(SRCS:.cpp=.o)

all:
	cd Engine/build && cmake .. && make

run: all
	./Engine/Chimera_core