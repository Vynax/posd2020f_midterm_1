.PHONY: clean  
SRC =  src/node.h src/app.h src/folder.h src/iterator.h src/node_iterator.h src/null_iterator.h src/utility.h
TEST = test/ut_app.h test/ut_folder.h test/ut_iterator.h test/ut_utility.h

all:directories bin/ut_main

bin/ut_main: test/ut_main.cpp $(TEST) obj/node.o $(SRC)
	g++ -std=c++11 -Wfatal-errors -o $@ $< obj/node.o -lgtest -lpthread

obj/node.o: src/node.cpp src/node.h
	g++ -std=c++11 -Wfatal-errors -c $< -o $@

directories:
	mkdir -p bin
	mkdir -p obj

clean:
	rm -rf bin
	rm -rf obj

stat:
	wc src/* test/*