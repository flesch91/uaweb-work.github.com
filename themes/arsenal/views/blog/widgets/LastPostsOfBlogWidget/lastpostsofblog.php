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
elseif (count($model->posts) > 0) : ?>
    <?php $c=0;?>
        <?php foreach ($model->posts as $post) : ?>
        <?php $c++;?>
                <?php //echo CHtml::link($post->title, array('/blog/post/show/', 'slug' => $post->slug)); ?>
                <a href="#"><?php echo $post->title;?></a>
        <?php if($c>=$limit)break;?>
        <?php endforeach;?>

<?php else : ?>
    <?php echo Yii::t('BlogModule.blog', 'Записей нет'); ?>
<?php endif; ?>