<div class="post">
    <div class="title">
        <?php echo $news->title; ?>
    </div>
    <div class="author">
        Опубликовал <b><?php echo $news->user->nick_name?></b>
        дата: <?php echo $news->creation_date; ?>
    </div>
    <br/>

    <div class="content">
        <?php //$this->widget('application.modules.upload_photos.widgets.SliderWidget', array("slider_id"=>$news->slider_id));?>
        <p><?php echo $news->full_text; ?></p>
    </div>

</div>
<div class="social">
    <?php $this->widget('application.modules.social.widgets.ysc.yandex.YandexShareApi',array("services"=>array('yaru', 'twitter','vkontakte', 'facebook', 'odnoklassniki', 'gplus', 'linkedin', 'moimir'))  ); ?>
</div>

<br/><br/><br/>
<?php $this->widget('application.modules.comment.widgets.CommentsListWidget', array('model' => $news, 'modelId' => $news->id)); ?>
<br/>
<h3>Залишити коментар</h3>
<?php $this->widget('application.modules.comment.widgets.CommentFormWidget', array('redirectTo' => $news->getPermaLink(), 'model' => $news, 'modelId' => $news->id)); ?>
