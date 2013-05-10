<?php
/**
 * Отображение для blog/widgets/lastpostsofblog:
 * 
 *   @category YupeView
 *   @package  YupeCMS
 *   @author   Yupe Team <team@yupe.ru>
 *   @license  https://github.com/yupe/yupe/blob/master/LICENSE BSD
 *   @link     http://yupe.ru
 **/
if ($model === null) :
    echo Yii::t('BlogModule.blog', 'Блог не существует');
elseif (count($model) > 0) : ?>
    <?php// Пост детально?>
<div class="post_detail" alt="<?php echo $new_post_id;?>" data-slug="<?php echo $blog_slug;?>">
    <?php $this->widget('application.modules.blog.widgets.ShowPostWidget', array('postID' => $new_post_id)); ?>
</div>
    <?php// Список постів у вигляді посилань ?>
    <ul>
        <?php foreach ($model as $post) : ?>
            <li>
                <a class="link_post" href="#<?php echo $post->slug;?>" alt="<?php echo $post->id;?>"><?php echo $post->title;?></a>
            </li>
        <?php endforeach;?>
    </ul>

    <?php// Пагінація ?>
    <div class="blog_pagination">
    <?php $this->widget('application.modules.pagination.widgets.PaginationWidget', array('alias'=>$blogID,'max' => $max_page,"page"=>$page)); ?>
    <div/>
<?php else : ?>
    <?php echo Yii::t('BlogModule.blog', 'Записей нет'); ?>
<?php endif; ?>
