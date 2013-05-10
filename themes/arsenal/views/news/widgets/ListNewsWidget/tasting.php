<?php if(isset($models) && $models != array()): ?>
    <?php $count=0;?>
    <!--Weapons list start-->
    <ul class="event_list clearfix">
        <?php foreach ($models as $model): ?>
            <?php $count++;?>
            <li alt="<?php echo $model->alias;?>">
                <!--Event start-->
                <a class="event popup_link" href="<?php echo $model->id;?>" alt="<?php echo $view_model;?>">

                    <img src="<?php echo "/uploads/news/".$model->image;?>" alt="<?php echo $model->title;?>"/>

                    <!--Event overlay start-->
                        <span class="event_overlay_hover">

                            <!--Event info start-->
                            <span class="event_info">

                                <!--Event date-->
                                <span class="event_date">
                                    <span class="event_day_month"><?php echo $model->creation_date;?></span>
                                    |
                                    <span class="event_year"><?php echo $model->creation_date;?></span>
                                </span>

                                <!--Event statistics-->
                                <span class="event_stats">
                                    <span class="event_views">
                                        <img src="<?php echo Yii::app()->theme->baseUrl;?>/web/im/ico_views.png" alt="Views"/> 124
                                    </span>
                                    <span class="event_comments">
                                        <img src="<?php echo Yii::app()->theme->baseUrl;?>/web/im/ico_comments.png" alt="Comments"/> 43
                                    </span>
                                </span>

                            </span>
                            <!--Event info end-->

                            <!--Event name-->
                            <span class="event_name"><?php echo $model->title;?></span>

                        </span>
                    <!--Event overlay end-->

                </a>
                <!--Event end-->
            </li>
        <?php endforeach;?>
    </ul>
    <!--Restaurant menu items preview end-->
    <div class="static_page">
            <ul>
                <?php $this->widget('application.modules.page.widgets.ListPagesWidget', array('category_id' => $category_id));?>
            <ul>
    </div>
<?php endif; ?>
