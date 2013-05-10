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
    echo Yii::t('BlogModule.blog', 'Пост не существует');
else: ?>
    <div class="post_info" data-slug="<?php echo $model->slug;?>">
    <a href="#"><?php echo $model->title;?></a>
    <div><?php echo Yii::app()->dateFormatter->format("dd MMMM yyyy HH:mm", $model->publish_date);?></div>
    <div><?php echo $model->content;?></div>
    </div>
<?php endif;?>