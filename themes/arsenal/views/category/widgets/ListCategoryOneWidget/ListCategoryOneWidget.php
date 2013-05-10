<?php if($model){?>

<?php $v=$model;?>
<!--Restaurant menu start-->
    <p class="description_text"><?php echo $v->description;?></p>
    <?php $this->widget('application.modules.news.widgets.ListNewsWidget',
        array(
            'categories' => $v->id,
            'page'=>$page,
            'view_model'=> $v->alias
        )); ?>

    <?php $count_news=ceil(count(News::model()->findAllByAttributes(array("category_id"=>$v->id)))/4);?>
    <?php if($count_news>1):?>
        <?php $this->widget('application.modules.pagination.widgets.PaginationWidget', array('alias'=>$v->alias,'max' => $count_news,"page"=>$page));?>
    <?php endif;?>
<?php
}else{ echo "Информацію не знайдено";};?>
