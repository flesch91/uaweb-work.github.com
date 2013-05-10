<?php if (isset($models) && $models != array()): ?>

<!--Blogs links list start-->
<ul class="blog_links_list">
    <?php foreach ($models as $model): ?>
        <li>
            <!--Author info-->
            <span class="blog_author_name"><?php echo $model->name;?></span>
            <span class="blog_author_position">Арт-директор</span>

            <!--Author link start-->
            <a class="blog_author_link popup_link_blog" href="<?php echo $model->id;?>">
                <img src="<?php echo "/uploads/blogs/".$model->icon;?>" alt="<?php echo $model->name;?>"/>
                            <span class="blog_author_slogan_overlay">
                                <span class="blog_author_slogan"><?php echo $model->description;?></span>
                            </span>
            </a>
            <!--Author link end-->

            <!--Last publication-->

            <div class="blog_last_publication_date"><?php echo Yii::app()->getDateFormatter()->formatDateTime($model->create_date, "short", null); ?></div>

            <div class="blog_last_publication_name">
                <?php $this->widget('application.modules.blog.widgets.LastPostsOfBlogWidget', array(
                    'limit' => 1,
                    'blogID' => $model->id,
                )); ?>
            </div>

        </li>
    <?php endforeach; ?>
<ul>
<?php endif; ?>
