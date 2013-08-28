// Application with UI adaptability support template
#include "applicationui.hpp"
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/SceneCover>
#include <bb/cascades/Container>
#include <bb/device/DisplayInfo>


using namespace bb::device;
using namespace bb::cascades;

ApplicationUI::ApplicationUI(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);


    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // set created root object as a scene

    DisplayInfo display;
    int width = display.pixelSize().width();
    int height = display.pixelSize().height();

    QDeclarativePropertyMap* displayProperties = new QDeclarativePropertyMap;
    displayProperties->insert("width", QVariant(width));
    displayProperties->insert("height", QVariant(height));

    qml->setContextProperty("DisplayInfo", displayProperties);


//    QmlDocument *qmlCover = QmlDocument::create("asset:///AppCover.qml").parent(this);
//    if( !qmlCover->hasErrors()){
//    	Container *coverContainer = qmlCover->createRootObject<Container>();
//    	SceneCover *sceneCover = SceneCover::create().content(coverContainer);
//    	Application::instance()->setCover(sceneCover);
//    }
    app->setScene(root);
}

