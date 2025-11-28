CC := g++
TARGET_EXEC := wxwidget_start.out
source_files := $(wildcard *.cpp)
CXXFLAGS := -pthread
CPPFLAGS := $(shell ./wx-config --cppflags)
LDFLAGS := $(shell ./wx-config --libs)


$(TARGET_EXEC): wx-config $(source_files:%.cpp=%.o)
	$(CC) $(source_files:%.cpp=%.o) -o $(TARGET_EXEC) $(LDFLAGS)

wx-config:
	ln -s /home/apprentice/Desktop/wxwidget-source/wxWidgets-3.3.1/mj-static-build/wx-config ./wx-config

.PHONY: clean

clean:
	rm *.o

