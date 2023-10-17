CXX		  := gcc
CXX_FLAGS := -Wall -Wextra `pkg-config --cflags glib-2.0`

BIN		:= bin
SRC		:= src
INCLUDE	:= include/gtk-4.0
LIB		:= lib

LIBRARIES	:= `pkg-config --libs glib-2.0` -pthread -lgtk-4
EXECUTABLE	:= main


all: $(BIN)/$(EXECUTABLE)

run: clean all
	clear
	./$(BIN)/$(EXECUTABLE)

$(BIN)/$(EXECUTABLE): $(SRC)/*.c
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -L$(LIB) $^ -o $@ $(LIBRARIES)

clean:
	-rm $(BIN)/*