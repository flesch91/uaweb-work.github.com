<?php
class NewsController extends YFrontController
{
    const NEWS_PER_PAGE = 10;

    public function actionShow($title)
    {
        $news = News::model()->published();
        $news = ($this->isMultilang())
            ? $news->language(Yii::app()->language)->find('alias = :alias', array(':alias' => $title))
            : $news->find('alias = :alias', array(':alias' => $title));
        if (!$news)
            throw new CHttpException(404, Yii::t('NewsModule.news', 'Новость не найдена!'));

        // проверим что пользователь может просматривать эту новость
        if ($news->is_protected ==News::PROTECTED_YES && !Yii::app()->user->isAuthenticated())
        {
            Yii::app()->user->setFlash(
                YFlashMessages::NOTICE_MESSAGE,
                Yii::t('NewsModule.news', 'Для просмотра этой страницы Вам необходимо авторизоваться!')
            );
            $this->redirect(array(Yii::app()->getModule('user')->accountActivationSuccess));
        }

        $this->render('news', array('news' => $news));
    }

    public function actionIndex()
    {
        $dbCriteria = new CDbCriteria(array(
                'condition' => 't.status = :status',
                'params'    => array(
                    ':status' => News::STATUS_PUBLISHED,
                ),
                'limit'     => self::NEWS_PER_PAGE,
                'order'     => 't.creation_date DESC',
                'with'      => 'user',
        ));
        
        if($this->isMultilang()){
            $dbCriteria->mergeWith(array(
                'condition' => 't.lang = :lang',
                'params'    => array(':lang' => Yii::app()->language),
            ));            
        }
        
        $dataProvider = new CActiveDataProvider('News', array( 'criteria' => $dbCriteria ));
        $this->render('index', array('dataProvider' => $dataProvider));
    }

    public function actionShowAjax($id,$view_model)
    {
       // if (!Yii::app()->request->isAjaxRequest) throw new CHttpException(404, Yii::t('NewsModule.news', 'Страница не найдена!'));

        $news = News::model()->published();
        $news = $news->findByPk($id);
//        $news = ($this->isMultilang())
//            ? $news->language(Yii::app()->language)->findByPk($id)
//            : $news->findByPk($id);
        if (!$news)
            throw new CHttpException(404, Yii::t('NewsModule.news', 'Новость не найдена!'));
        $this->renderpartial($view_model, array('news' => $news));
    }

    public function actionajaxpopup($page){
        if (!Yii::app()->request->isAjaxRequest
            || ($alias = Yii::app()->request->getParam('alias')) == null
        )
            throw new CHttpException(404, Yii::t('NewsModule.news', 'Страница не найдена!'));
        $this->widget('application.modules.category.widgets.ListCategoryOneWidget', array('alias' => $alias,'page'=>$page));
    }
}