<?php
class ListCategoryWidget extends YWidget
{
    public $alias = "content_block_uk";
    public $page = 1;
    public $veiw_model = "listcategorywidget";

    public function run()
    {
        $id=Category::model()->cache($this->cacheTime)->findByAttributes(array("alias"=>$this->alias))->id;
        $model=Category::model()->cache($this->cacheTime)->findAllByAttributes(array("parent_id"=>$id));

        $this->render($this->veiw_model, array('model' => $model,"page"=>$this->page));
    }
}