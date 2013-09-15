// Application with UI adaptability support template
#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
 #include <bb/system/InvokeManager>
#include <bb/cascades/QListDataModel>
#include <bb/cascades/ListView>
namespace bb{
	namespace cascades {
		class Application;
	}
}

namespace bb{
	namespace cascades {
		class QListDataModel<QString>;
	}
}


namespace bb{
	namespace system {
		class InvokeManager;
	}
}


/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class SC2App : public QObject
{
    Q_OBJECT
public:
    SC2App(bb::cascades::Application *app);
    virtual ~SC2App() {}

	Q_INVOKABLE
	QString get(const QString &objectName, const QString &defaultValue);
	Q_INVOKABLE
	void set(const QString &objectName, const QString &inputValue);
	Q_INVOKABLE
	bool isNetworkAvailable();
	Q_INVOKABLE
	bool onWifiConnection();
	Q_INVOKABLE
	void setupList(const QString& type);


public Q_SLOTS:
	void invoke(const QString &target, const QString &action,
	                    const QString &mimetype, const QString &uri);
	void filterDataModel(const QString &txt);
private:
	bb::cascades::QListDataModel<QString>* dupDtMdl;
	bb::cascades::QListDataModel<QString>* primaryDtMdl;
	bb::system::InvokeManager* m_invokeManager;
	bb::cascades::Application* _app;
	bb::cascades::ListView* lv;
};


#endif /* ApplicationUI_HPP_ */
