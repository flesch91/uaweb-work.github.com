<div class="form">
<?php $form = $this->beginWidget('CActiveForm', array(
     'action'                 => $this->controller->createUrl('/comment/comment/addajax'),
     'id'                     => 'comment-form',
     'enableClientValidation' => true,
));

    ?>
    <?php echo CHtml::form();?>
    <p class="note">
        <?php echo Yii::t('CommentModule.comment', 'Поля, отмеченные'); ?>
        <span class="required">*</span> 
        <?php echo Yii::t('CommentModule.comment', 'обязательны для заполнения'); ?>
    </p>

    <?php echo $form->errorSummary($model); ?>

    <?php echo $form->hiddenField($model, 'model'); ?>
    <?php echo $form->hiddenField($model, 'model_id'); ?>
    <?php echo CHtml::hiddenField('redirectTo', $redirectTo); ?>
    <?php if (!Yii::app()->user->isAuthenticated()): ?>
        <div class="row">
            <?php echo $form->labelEx($model, 'name'); ?>
            <?php echo $form->textField($model, 'name', array('size' => 60, 'maxlength' => 128)); ?>
            <?php echo $form->error($model, 'name'); ?>
        </div>

        <div class="row">
            <?php echo $form->labelEx($model, 'email'); ?>
            <?php echo $form->textField($model, 'email', array('size' => 60, 'maxlength' => 128)); ?>
            <?php echo $form->error($model, 'email'); ?>
        </div>

        <div class="row">
            <?php echo $form->labelEx($model, 'url'); ?>
            <?php echo $form->textField($model, 'url', array('size' => 60, 'maxlength' => 128)); ?>
            <?php echo $form->error($model, 'url'); ?>
        </div>
    <?php else: ?>
        <p><?php echo Yii::t('CommentModule.comment', 'От имени'); ?>: <?php echo Yii::app()->user->getState('nick_name'); ?></p>
    <?php endif; ?>
    <div class="row">
        <?php echo $form->labelEx($model, 'text'); ?>
        <?php echo $form->textArea($model, 'text', array('rows' => 6, 'cols' => 50)); ?>
        <?php echo $form->error($model, 'text'); ?>
    </div>
    <?php if (!Yii::app()->user->isAuthenticated() && extension_loaded('gd')): ?>
        <div class="row">
            <?php echo $form->labelEx($model, 'verifyCode'); ?>
            <div>
                <?php $this->widget('CCaptcha', array(
                    'captchaAction'     => '/comment/comment/captcha',
                    'showRefreshButton' => false,
                    'clickableImage'    => true,
                )); ?>
                <?php echo $form->textField($model, 'verifyCode'); ?>
            </div>
            <div class="hint">
                <?php echo Yii::t('CommentModule.comment', 'Введите цифры указанные на картинке'); ?>
            </div>
        </div> 
    <?php endif; ?>
    <div class="row buttons">
        <?php// echo CHtml::submitButton(Yii::t('CommentModule.comment', 'Добавить комментарий')); ?>
        <?php echo CHtml::ajaxSubmitButton('Обработать', $this->controller->createUrl('/comment/comment/addajax'), array(
        'type' => 'POST',
        // Результат запроса записываем в элемент, найденный по CSS-селектору #output.
        'update' => '#content',
        ),
        array(
        // Меняем тип элемента на submit, чтобы у пользователей с отключенным JavaScript всё было хорошо.
        'type' => 'submit'
        ));?>
    </div>
    <?php echo CHtml::endForm();?>
<?php $this->endWidget(); ?>
</div><!-- form -->


<script>
    $(document).ready(function() {
        $('#comment-form').ajaxForm({
            dataType:  'json',
            success:   function(data){
                alert(data.data);
                if(data.result){
                    $.ajax({
                        type:"GET",
                        url:"/comment/comment/listajax/",
                        data:"id=<?php echo $model->model_id;?>",
                        success: function(result){
                            $("#comments").html(result);
                        }
                    });
                    $.ajax({
                        type:"GET",
                        url:"/comment/comment/formrefreshajax/",
                        data:"id=<?php echo $model->model_id;?>",
                        success: function(result){
                            $("#comment-form").parent().html(result);
                        }
                    });

                }
            }
        });
    });
</script>