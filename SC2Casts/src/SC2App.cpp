// Application with UI adaptability support template
#include "SC2App.hpp"
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/SceneCover>
#include <bb/cascades/Container>
#include <bb/device/DisplayInfo>
#include "SC2DynamicCover.h"

using namespace bb::device;
using namespace bb::cascades;

SC2App::SC2App(bb::cascades::Application *app)
: QObject(app)
{
	QCoreApplication::setOrganizationName("Alex Kwan");
	QCoreApplication::setApplicationName("Watcher of the Void");
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime

//	SC2DynamicCover *activeFrame = new SC2DynamicCover();
	//Application::instance()->setCover(activeFrame);

    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
    qml->setContextProperty("_store", this);
  //  qml->setContextProperty("activeFrame", activeFrame);
    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    QmlDocument *qmlCover = QmlDocument::create("asset:///AppCover.qml").parent(this);
    if( !qmlCover->hasErrors()){
    	Container *coverContainer = qmlCover->createRootObject<Container>();
    	SceneCover *sceneCover = SceneCover::create().content(coverContainer);
    	Application::instance()->setCover(sceneCover);
    }
    app->setScene(root);
}

QString SC2App::get(const QString &objectName, const QString &defaultValue)
{
    QSettings settings;

    // If no value has been saved, return the default value.
    if (settings.value(objectName).isNull()) {
        return defaultValue;
    }

    // Otherwise, return the value stored in the settings object.
    return settings.value(objectName).toString();
}

void SC2App::set(const QString &objectName, const QString &inputValue)
{
    // A new value is saved to the application settings object.
    QSettings settings;
    settings.setValue(objectName, QVariant(inputValue));
}

