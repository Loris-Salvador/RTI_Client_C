.SILENT:

CLI_OBJ = ./objets
SOCK = ./LibSocket

all: Client

Client:	$(SOCK)/socket.o $(CLI_OBJ)/mainclient.o $(CLI_OBJ)/windowclient.o $(CLI_OBJ)/moc_windowclient.o
	echo Creation Client
	g++ -Wno-unused-parameter -o ./Client $(CLI_OBJ)/mainclient.o $(CLI_OBJ)/windowclient.o $(SOCK)/socket.o $(CLI_OBJ)/moc_windowclient.o /usr/lib64/libQt5Widgets.so /usr/lib64/libQt5Gui.so /usr/lib64/libQt5Core.so /usr/lib64/libGL.so -lpthread




$(SOCK)/socket.o:	$(SOCK)/socket.cpp
	echo Creation LibSocket...
	g++ -c $(SOCK)/socket.cpp -o $(SOCK)/socket.o

$(CLI_OBJ)/mainclient.o:	./mainclient.cpp
	echo Creation mainclient...
	g++ -Wno-unused-parameter -c -pipe -g -std=gnu++11 -Wall -W -D_REENTRANT -fPIC -DQT_DEPRECATED_WARNINGS -DQT_QML_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I../UNIX_DOSSIER_FINAL -I. -isystem /usr/include/qt5 -isystem /usr/include/qt5/QtWidgets -isystem /usr/include/qt5/QtGui -isystem /usr/include/qt5/QtCore -I. -I. -I/usr/lib64/qt5/mkspecs/linux-g++ -o $(CLI_OBJ)/mainclient.o ./mainclient.cpp

$(CLI_OBJ)/windowclient.o:	./windowclient.cpp
	echo Creation windowClient...
	g++ -Wno-unused-parameter -c -pipe -g -std=gnu++11 -Wall -W -D_REENTRANT -fPIC -DQT_DEPRECATED_WARNINGS -DQT_QML_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I../UNIX_DOSSIER_FINAL -I. -isystem /usr/include/qt5 -isystem /usr/include/qt5/QtWidgets -isystem /usr/include/qt5/QtGui -isystem /usr/include/qt5/QtCore -I. -I. -I/usr/lib64/qt5/mkspecs/linux-g++ -o $(CLI_OBJ)/windowclient.o ./windowclient.cpp

$(CLI_OBJ)/moc_windowclient.o:	./moc_windowclient.cpp
	echo Creation moc_windowclient...
	g++ -Wno-unused-parameter -c -pipe -g -std=gnu++11 -Wall -W -D_REENTRANT -fPIC -DQT_DEPRECATED_WARNINGS -DQT_QML_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I../UNIX_DOSSIER_FINAL -I. -isystem /usr/include/qt5 -isystem /usr/include/qt5/QtWidgets -isystem /usr/include/qt5/QtGui -isystem /usr/include/qt5/QtCore -I. -I. -I/usr/lib64/qt5/mkspecs/linux-g++ -o $(CLI_OBJ)/moc_windowclient.o ./moc_windowclient.cpp

clean:
	rm $(CLI_OBJ)/*
	rm $(SOCK)/*o
	echo Objets supprimes

clobber:
	rm ./Client
	echo Executable supprimes