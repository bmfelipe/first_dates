
all:
	javac -d WEB-INF/classes -cp WEB-INF/classes:../../lib/servlet-api.jar WEB-INF/src/*.java

stop:
	../../bin/shutdown.sh

start:
	../../bin/startup.sh

reset: stop start
