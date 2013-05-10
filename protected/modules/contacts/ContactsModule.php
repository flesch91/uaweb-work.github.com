<?php
class ContactsModule extends YWebModule
{
    public $description = 'Модуль <Контакти>';
    public $address = 'Модуль <Контакти>';
    public $lat   = 0;
    public $long  = 0;


    public function getInstall()
    {
        if(parent::getInstall())
            @mkdir($this->getUploadPath(),0755);

        return false;
    }

    public function getDependencies()
    {
        return array(
            'user',
            'category',
            'image'
        );
    }
    public function getNavigation()
    {
        return array(
            array('label' => Yii::t('ContactsModule.contacts', 'Контакти')),
            array('icon' => 'list-alt','label' => Yii::t('ContactsModule.contacts', 'Змінити контакти'), 'url' => array('/contacts/contacts/index'))
        );
    }

    public function getParamsLabels()
    {
        return array(
            'adminMenuOrder' => Yii::t('ContactsModule.contacts', 'Порядок следования в меню'),
            'editor'         => Yii::t('ContactsModule.contacts', 'Визуальный редактор'),
        );
    }
    public function getVersion()
    {
        return Yii::t('ContactsModule.contacts', '0.4');
    }

    public function getIsInstallDefault()
    {
        return true;
    }

    public function getCategory()
    {
        return Yii::t('ContactsModule.contacts', 'Контент');
    }

    public function getName()
    {
        return Yii::t('ContactsModule.contacts', 'Контакти');
    }

    public function getDescription()
    {
        return Yii::t('ContactsModule.contacts', 'Модуль для создания и публикации новостей');
    }

    public function getAuthor()
    {
        return Yii::t('ContactsModule.contacts', 'banakh');
    }

    public function getAuthorEmail()
    {
        return Yii::t('ContactsModule.contacts', 'boom@boom.com');
    }

    public function getUrl()
    {
        return Yii::t('ContactsModule.contacts', 'http://banakh.com');
    }

    public function getIcon()
    {
        return "leaf";
    }


    public function isMultiLang()
    {
        return true;
    }

    public function init()
    {
        parent::init();

        $this->setImport(array(
            'contacts.models.*',
            'contacts.components.*',
        ));
    }
}