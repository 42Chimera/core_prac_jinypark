CXX 		=	c++
NAME		=	chimera_example
RM 			=	rm -rvf
CPPFLAGS 	=	
SRCS		=	main.cpp
OBJS		=	$(SRCS:.cpp=.o)

all:
	cd chimera/build && cmake .. && make 

# $(NAME): $(OBJS)
# 	@$(CXX) $(CPPFLAGS) -o $@ $(OBJS)

# %.o : %.c
# 	@echo [$<] compiling ...
# 	@$(CXX) $(CPPFLAGS) -c -o $@ $<

# clean:
# 	@echo ">>>>>>deleted list<<<<<<<"
# 	@$(RM) $(OBJS)

# fclean: clean
# 	@echo ">>>>>>deleted list<<<<<<<"
# 	@$(RM) $(NAME)

# re:
# 	@make fclean
# 	@make all

# .PHONY: all clean fclean re
