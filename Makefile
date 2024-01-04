CXX 		=	c++
NAME		=	chimera_example
RM 			=	rm -rvf
CPPFLAGS 	=	
SRCS		=	main.cpp
OBJS		=	$(SRCS:.cpp=.o)

all:
	cd Engine/Build && cmake -S .. -B Temp && cmake --build Temp

run: all
	./Engine/Chimera_core