.SUFFIXES : .cpp
CC = g++
CXXFLAGS = -g -std=c++11
OBJS = PultorakHW1.o
TARGET = pultorakhw1
$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS)
.cpp.o:
	$(CC) -c $(CXXFLAGS) $(INCDIR) $<
clean:
	rm -f $(OBJS) $(TARGET) core
zipIt:
	zip -r Pultorak_M_HW1.zip PultorakHW1.cpp *.h README makefile