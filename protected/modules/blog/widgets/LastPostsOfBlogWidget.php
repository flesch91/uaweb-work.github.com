<?php
class LastPostsOfBlogWidget extends YWidget
{
    public $limit = 100;
    public $page = 1;
    public $per_page = 3;
    public $offset = 0;
    public $blogID;
    public $new_post_id;
    public $view_model = 'lastpostsofblog';

    public function run()
    {
        $this->offset=($this->page-1)*$this->per_page;

        $Criteria = new CDbCriteria();
        $Criteria->condition = "blog_id = :blog";
        $Criteria->params = array(':blog'=>$this->blogID);
        $max_page=ceil(count(Post::model()->findAll($Criteria))/$this->per_page);
        $Criteria->order = 'create_date DESC';
        $Criteria->limit = $this->per_page;
        $Criteria->offset = $this->offset;
        $posts = Post::model()->findAll($Criteria);

        $slug=Blog::model()->findByPk($this->blogID);
        $blog_slug=$slug->slug;

        if($this->new_post_id==0){
            $Crit = new CDbCriteria();
            $Crit->condition = "blog_id = :blog";
            $Crit->params = array(':blog'=>$this->blogID);
            $Crit->order = 'create_date DESC';
            $Crit->limit = 1;

            $new_post = Post::model()->findAll($Crit);
            foreach($new_post as $v){
                $this->new_post_id=$v->id;
            }
            $slug = Post::model()->findByPk($this->new_post_id);
            $post_slug = $slug->slug;
        }else{
                $slug = Post::model()->findByPk($this->new_post_id);
                $post_slug = $slug->slug;
        }

        $this->render($this->view_model, array('model' => $posts,"post_slug"=>$post_slug,"new_post_id"=>$this->new_post_id,"max_page"=>$max_page,"blogID"=>$this->blogID,"blog_slug"=>$blog_slug,"page"=>$this->page));
    }
}