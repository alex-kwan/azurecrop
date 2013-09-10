// Application with UI adaptability support template
#include "SC2App.hpp"
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/SceneCover>
#include <bb/cascades/Container>
#include <bb/device/DisplayInfo>
#include "SC2DynamicCover.h"
#include <bb/system/InvokeRequest>
#include "ActiveFrameQML.h"
using namespace bb::device;
using namespace bb::cascades;
using namespace bb::system;

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

    ActiveFrameQML *activeFrame = new ActiveFrameQML();
	Application::instance()->setCover(activeFrame);

	qml->setContextProperty("_app", this);
	qml->setContextProperty("_activeFrame", activeFrame);

	AbstractPane *root = qml->createRootObject<AbstractPane>();
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

bool SC2App::onWifiConnection(){
	QNetworkConfigurationManager netMgr;
	QList<QNetworkConfiguration> mNetList = netMgr.allConfigurations(
	        QNetworkConfiguration::Active);
	QString wlan = "WLAN";
		for(int i = 0; i < mNetList.size(); i++){
			if (mNetList.at(i).bearerName().compare(wlan) == 0 ){
				return true;
			}
		}
		return false;
}
bool SC2App::isNetworkAvailable() {
QNetworkConfigurationManager netMgr;
QList<QNetworkConfiguration> mNetList = netMgr.allConfigurations(
        QNetworkConfiguration::Active);
	bool activeInterface = mNetList.count() > 0;
	return activeInterface;
}

void SC2App::invoke(const QString &target, const QString &action,
                   const QString &mimetype, const QString &uri) {
           // Create a new invocation request
           InvokeRequest request;

           request.setTarget(target);
           request.setAction(action);

           if (target == QLatin1String("com.rim.bb.app.facebook")) {
                   QVariantMap payload;

                   if (!uri.isEmpty()) {
                           payload["object_type"] = mimetype;
                           payload["object_id"] = uri;
                   } else {
                           // Open the BlackBerry North America page by default
                           payload["object_type"] = "page";
                           payload["object_id"] = "328506290597521";
                   }

                   request.setMetadata(payload);
           } else {
                   request.setUri(uri);
           }

           m_invokeManager->invoke(request);
   }

