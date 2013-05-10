<?php if(isset($models) && $models != array()): ?>
    <?php $count=0;?>
    <!--Restaurant menu items preview start-->
    <ul class="restaurant_menu_preview">
        <?php foreach ($models as $model): ?>
            <?php $count++;?>

            <li alt="<?php echo $model->alias;?>">
                <a class="menu_item item_0<?php echo $count;?> popup_link" style="background: url('<?php echo "/uploads/news/".$model->image;?>') no-repeat scroll 0 0 transparent;" href="<?php echo $model->id;?>" alt="<?php echo $view_model;?>">
                        <span class="menu_item_description">
                            <span class="menu_item_name"><?php echo $model->title;?></span>
                            <span class="menu_item_description_txt"><?php echo $model->full_text;?></span>
                        </span>
                </a>
            </li>
        <?php endforeach;?>
    </ul>
    <!--Restaurant menu items preview end-->
<div class="static_page">
    <ul class="restaurant_menu_links">
    <?php $this->widget('application.modules.page.widgets.ListPagesWidget', array('category_id' => $category_id));?>
    <ul>
</div>
</ul>
<?php endif; ?>

