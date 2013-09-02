#ifndef SC2DYNAMICCOVER_H_
#define SC2DYNAMICCOVER_H_
 
#include <QObject>
#include <bb/cascades/ImageView>
#include <bb/cascades/SceneCover>
 
using namespace ::bb::cascades;
 
class SC2DynamicCover: public SceneCover {
    Q_OBJECT
 
public:
    SC2DynamicCover(QObject *parent=0);
 
public slots:
    Q_INVOKABLE void update(QString appText);
 
private:
    bb::cascades::ImageView *m_coverImage;
};
 
#endif /* SC2DYNAMICCOVER_H_ */