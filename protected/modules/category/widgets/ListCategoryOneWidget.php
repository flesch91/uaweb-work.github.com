<?php
class ListCategoryOneWidget extends YWidget
{
    public $alias = "content_block_uk";
    public $page = 1;
    public $veiw_model = "listcategoryonewidget";

    public function run()
    {
        $model=Category::model()->cache($this->cacheTime)->findByAttributes(array("alias"=>$this->alias));
        $this->render($this->veiw_model, array('model' => $model,'page'=>$this->page));
    }
}