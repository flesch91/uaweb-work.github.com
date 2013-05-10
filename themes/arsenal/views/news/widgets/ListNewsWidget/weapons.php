<?php if(isset($models) && $models != array()): ?>
    <?php $count=0;?>
    <!--Weapons list start-->
    <ul class="weapons_list">
        <?php foreach ($models as $model): ?>
            <?php $count++;?>
            <li alt="<?php echo $model->alias;?>">
                <a class="popup_link" href="<?php echo $model->id;?>" alt="<?php echo $view_model;?>" >
                    <img src="<?php echo "/uploads/news/".$model->image;?>" alt="<?php echo $model->title;?>"/>
                    <span class="weapons_img_overlay"></span>
                    <span class="weapons_img_overlay_hover"></span>
                    <span class="weapon_name"><?php echo $model->title;?></span>
                </a>
            </li>
        <?php endforeach;?>
    </ul>
    <!--Restaurant menu items preview end-->
<div class="rules_wrapper">
    <ul class="restaurant_menu_links">
        <?php $this->widget('application.modules.page.widgets.ListPagesWidget', array('category_id' => $category_id));?>
    <ul>
</div>
<?php endif; ?>
