.SUFFIXES : .cpp
CC = g++
CXXFLAGS = -g -std=c++11
OBJS = PultorakHW2.o
TARGET = pultorakhw2
$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS)
.cpp.o:
	$(CC) -c $(CXXFLAGS) $(INCDIR) $<
clean:
	rm -f $(OBJS) $(TARGET) core
zipIt:
	zip -r Pultorak_M_HW2.zip PultorakHW2.cpp *.h README makefile