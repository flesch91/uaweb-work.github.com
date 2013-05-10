<?php
class ListNewsWidget extends YWidget
{
    public $count      = 4;
    /** @var $categories mixed Список категорий, из которых выбирать новости. NULL - все */
    public $categories = null;

    public $view_model = "listnews";

    public function run()
    {
        $criteria = new CDbCriteria();
        //$criteria->limit = $this->count;
        $criteria->order = 'date DESC';

        if ($this->categories)
        {
            if (is_array($this->categories))
                $criteria->addInCondition('category_id', $this->categories);
            else
                $criteria->compare('category_id', $this->categories);
        }

        $short_description=Category::model()->findByPk($this->categories)->short_description;

        $news = ($this->controller->isMultilang())
            ? News::model()->published()->language(Yii::app()->language)->cache($this->cacheTime)->findAll($criteria)
            : News::model()->published()->cache($this->cacheTime)->findAll($criteria);

        $this->render($this->view_model, array('models' => $news,'short_description'=>$short_description));
    }
}