// Application with UI adaptability support template
#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

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
};


#endif /* ApplicationUI_HPP_ */
