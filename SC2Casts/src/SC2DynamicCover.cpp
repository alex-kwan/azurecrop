#include "SC2DynamicCover.hpp"

#include <bb/cascades/SceneCover>
#include <bb/cascades/Container>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>

using namespace bb::cascades;

SC2DynamicCover::SC2DynamicCover(QObject *parent)
    : SceneCover(parent)
{
    QmlDocument *qml = QmlDocument::create("asset:///AppCover.qml")
            .parent(parent);
    Container *mainContainer = qml->createRootObject<Container>();
    setContent(mainContainer);

    m_coverImage = mainContainer->findChild<ImageView*>("imageView");
    m_coverImage->setParent(mainContainer);
}

void SC2DynamicCover::update(QString appText) {

	m_coverImage->setImagesource( appText );
  //  m_coverLabel->setText(appText);
}
