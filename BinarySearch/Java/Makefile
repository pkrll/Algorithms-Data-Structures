.PHONY: clean run

JCC=javac
JVM=java
FLAGS=-g
PATHS=-cp "/usr/local/share/java/junit4-4.12.jar:/usr/local/share/java/hamcrest-core-1.3.jar:Sources:tests"
JUNIT=org.junit.runner.JUnitCore

sources = $(shell find . -type f -name '*.java')
classes = $(sources:.java=.class)

all: $(classes)

%.class: %.java
	$(JCC) $(FLAGS) $(PATHS) $<

test: all
	$(JVM) $(PATHS) $(JUNIT) TestRunner

clean:
	rm -f $(classes)

debug: all
	$(JVM) -Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n ParserDriver

jdb:
	jdb -sourcepath . -connect com.sun.jdi.SocketAttach:hostname=localhost,port=8000
