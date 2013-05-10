<?php if(isset($models) && $models != array()): ?>
    <?php $count=0;?>
    <!--Weapons list start-->
    <ul class="event_news_list">
        <?php foreach ($models as $model): ?>
            <?php $count++;?>
            <li alt="<?php echo $model->alias;?>">
                <!--Events news box start-->
                <div class="event_news_box" alt="<?php echo $model->alias;?>">

                    <!--Event news top info start-->
                    <div class="event_news_info">

                        <span class="event_news_date"><?php echo $model->date;?></span>

                        <!--Views & comments-->
                        <div class="event_news_stats">
                                <span class="event_news_views">
                                    <img src="<?php echo Yii::app()->theme->baseUrl;?>/web/im/ico_views.png" alt="Views"/> 124
                                </span>
                                <span class="event_news_comments">
                                    <img src="<?php echo Yii::app()->theme->baseUrl;?>/web/im/ico_comments.png" alt="Comments"/> 43
                                </span>
                        </div>

                    </div>
                    <!--Event news top info end-->

                    <!--Event news image & name link-->
                    <a class="event_news_link popup_link" href="<?php echo $model->id;?>" alt="<?php echo $view_model;?>">
                        <img src="<?php echo "/uploads/news/".$model->image;?>" alt="<?php echo $model->title;?>"/>
                        <span class="event_news_overlay"></span>
                        <span class="event_news_name"><?php echo $model->title;?></span>
                    </a>

                </div>
            </li>
        <?php endforeach;?>
    </ul>

<?php endif; ?>
