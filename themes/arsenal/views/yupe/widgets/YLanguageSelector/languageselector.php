<!--Header languages-->
<div class="header_lang">
   <?php foreach($langs as $lang): ?>
        <?php if ($currentLanguage == $lang): ?>
        <a class="is-active" href="#"><?php echo $icon . strtoupper(Yii::t('yupe', $lang)); ?></a>
        <?php else:?>
            <?php echo CHtml::link( strtoupper(Yii::t('yupe', $lang)), $homeUrl . Yii::app()->urlManager->replaceLangUrl($cleanUrl, $lang));?>
        <?php endif?>
    <?php endforeach;?>
</div>