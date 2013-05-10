<?php $this->widget('application.modules.category.widgets.ListCategoryWidget', array('alias' => 'content_block_'.Yii::app()->language)); ?>

<!--Blog start-->
<div class="blog_wrapper">

    <!--Blog container start-->
    <div class="blog container clearfix">
        <?php $this->widget('application.modules.blog.widgets.ListBlogsWidget', array()); ?>
        <div class="clearfix"></div>
    </div>
    <!--Blog container end-->

</div>
<!--Blog end-->

<!--Decorated separator-->
<div class="decor_separator decor_07"></div>

<!--Contacts-->
<div class="contacts container">
    <p class="address">вул.Підвальна 5, Львів, Україна, 79000 <br> arsenal.lviv@facebook.com <br> 067 372 4455</p>
        <?php
        Yii::import('application.extension.EGMap.*');
        $gMap = new EGMap();
        $gMap->setJsName('test_map');
        $gMap->width = '100%';
        $gMap->height = 440;
        $gMap->zoom = 16;
        $gMap->setCenter(49.841022, 24.035470);

        $info_box = new EGMapInfoBox('<div style="color:#fff;border: 1px solid black; margin-top: 8px; background: #000; padding: 5px;"><img src="/css/arsenal.jpg" width="100px"/></div>');

        $info_box->pixelOffset = new EGMapSize('0','-140');
        $info_box->maxWidth = 0;
        $info_box->boxStyle = array(
            'width'=>'"120px"',
            'height'=>'"120px"',
            'background'=>'"url(http://google-maps-utility-library-v3.googlecode.com/svn/tags/infobox/1.1.9/examples/tipbox.gif) no-repeat"'
        );
        $info_box->closeBoxMargin = '"10px 2px 2px 2px"';
        $info_box->infoBoxClearance = new EGMapSize(1,1);
        $info_box->enableEventPropagation ='"floatPane"';

        $marker = new EGMapMarker(49.841022, 24.035470, array('title' => 'Ресторан "Арсенал"'));
        $marker->addHtmlInfoBox($info_box);
        $gMap->addMarker($marker);

        $gMap->renderMap();
        ?>
</div>