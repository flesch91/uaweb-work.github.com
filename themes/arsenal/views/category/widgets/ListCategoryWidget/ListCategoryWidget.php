<?php $decor=1;?>
<!--Decorated separator-->
<div class="decor_separator decor_0<?php echo $decor;?>"></div>
<?php if($model){?>

<?php foreach($model as $v){?>
    <?php $decor++;?>
<!--Restaurant menu start-->
<div class="<?php echo $v->alias;?> container clearfix">
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
</div>

    <!--Decorated separator-->
    <div class="decor_separator decor_0<?php echo $decor;?>"></div>
<!--Restaurant menu end-->
<?php }}else{ echo "Информацію не знайдено";};?>
