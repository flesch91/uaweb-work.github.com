<?php
class ListPagesWidget extends YWidget
{
    public $pageStatus=1;
    public $topLevelOnly = false;
    public $order        = 't.order ASC';
    public $category_id = 1;
    public $view;
    public $visible = true;

    public function init()
    {
        parent::init();
    }

    public function run()
    {
        if ($this->visible)
        {
            $criteria = new CDbCriteria;
            $criteria->order = $this->order;
            $criteria->addCondition("status = {$this->pageStatus}");

            if ($this->category_id)
                $criteria->addCondition("category_id = {$this->category_id}");

            $view = $this->view ? $this->view : 'listpageswidget';

            $this->render($view, array(
                'pages' => Page::model()->cache($this->cacheTime)->findAll($criteria),
            ));
        }
    }
}