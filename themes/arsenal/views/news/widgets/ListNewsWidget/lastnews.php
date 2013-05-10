<div class='portlet'>
    <div class='portlet-decoration'>
        <div class='portlet-title'>Новости</div>
    </div>
    <div class='portlet-content'>
        <?php if(isset($models) && $models != array()): ?>
            <ul>
                <?php foreach ($models as $model): ?>
                    <li alt="<?php echo $model->alias;?>"><?php echo CHtml::link($model->title, array('/news/news/show/', 'title' => $model->alias)); ?></li>
                <?php endforeach;?>
            </ul>
        <?php endif; ?>
    </div>
</div>
