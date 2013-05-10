<?php
class ShowPostWidget extends YWidget
{
    public $postID;
    public $view_model = 'showpost';

    public function run()
    {
        $post=Post::model()->findByPk($this->postID);

        $this->render($this->view_model, array('model' => $post));
    }
}