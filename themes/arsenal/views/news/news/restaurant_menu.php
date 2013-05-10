<div class="post" >
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

<div class="social" >
    <a onclick="Share.vkontakte(location.href,'<?php echo $news->title;?>','<?php echo $_SERVER["HTTP_HOST"].$news->imageUrl;?>','<?php echo $news->full_text; ?>')"> {шарь меня полностью}</a>
    <a onclick="Share.facebook(location.href,'<?php echo $news->title;?>','IMG_PATH','<?php echo $news->full_text; ?>')"> {шарь меня полностью}</a>
    <a onclick="Share.mailru(location.href,'<?php echo $news->title;?>','IMG_PATH','<?php echo $news->full_text; ?>')"> {шарь меня полностью}</a>
    <a onclick="Share.odnoklassniki(location.href,'<?php echo $news->full_text; ?>')"> {шарь меня полностью}</a>
    <a onclick="Share.twitter(location.href,'<?php echo $news->title;?>')"> {шарь меня полностью}</a>
</div>

<br/><br/><br/>
<?php $this->widget('application.modules.comment.widgets.CommentsListWidget', array('model' => $news, 'modelId' => $news->id)); ?>
<br/>
<h3>Залишити коментар</h3>
<?php $this->widget('application.modules.comment.widgets.CommentFormWidget', array('redirectTo' => $news->getPermaLink(), 'model' => $news, 'modelId' => $news->id)); ?>
