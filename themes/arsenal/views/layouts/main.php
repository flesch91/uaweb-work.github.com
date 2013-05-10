<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo Yii::app()->language; ?>" lang="<?php echo Yii::app()->language; ?>"> <!--<![endif]-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="language" content="<?php echo Yii::app()->language; ?>"/>
    <meta name="keywords" content="<?php echo $this->keywords; ?>"/>
    <meta name="description" content="<?php echo $this->description; ?>"/>

    <link rel="icon" type="image/png" href="<?php echo Yii::app()->baseUrl;?>/web/images/favicon.png" />

    <?php $module = Yii::app()->getModule('yupe'); ?>

    <link rel="stylesheet" type="text/css"
          href="<?php echo Yii::app()->theme->baseUrl; ?>/web/css/style.css"
    <!--Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700italic,700,500italic,500,400italic,300italic,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Ledger&subset=cyrillic,latin-ext' rel='stylesheet' type='text/css'>

    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <?php Yii::app()->clientScript->registerScriptFile(Yii::app()->theme->baseUrl."/web/js/jquery-1.9.1.js"); ?>
    <?php Yii::app()->clientScript->registerScriptFile(Yii::app()->theme->baseUrl."/web/js/jquery.form.js",CClientScript::POS_BEGIN);?>
    <?php //Yii::app()->clientScript->registerScriptFile("//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"); ?>
    <?php //Yii::app()->clientScript->registerScriptFile(Yii::app()->theme->baseUrl."/web/js/jquery10.js"); ?>
    <?php Yii::app()->clientScript->registerScriptFile(Yii::app()->theme->baseUrl.'/web/js/popup.js',CClientScript::POS_END);?>
    <?php Yii::app()->clientScript->registerScriptFile(Yii::app()->theme->baseUrl.'/web/js/social.js',CClientScript::POS_BEGIN);?>
    <script type="text/javascript">
        var language = "<?php echo Yii::app()->language;?>";
        var getrequest = <?php echo json_encode($_GET);?>
    </script>

    <title><?php echo CHtml::encode($this->pageTitle); ?></title>

</head>

<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
<?php //$this->widget('YAdminPanel');?>
<div id="loader" style="width: 24px;height: 24px; position: fixed; top:48%;left: 48%;z-index: 100;display: none;"><img src="<?php echo Yii::app()->theme->baseUrl?>/web/images/ajax-loader.gif"/></div>
<div class="wrap_site" id="page">
    <!--Promo image start-->
    <div class="promo_img_wrapper">

        <div class="promo_img_inner_wrapper">

            <!--Promo image-->
            <div class="promo_img">
                <div class="promo_img_holder"></div>
                <div class="promo_img_fade left"></div>
                <div class="promo_img_fade right"></div>
            </div>

        </div>

        <!--Promo content-->
        <div class="promo_content">

            <!--Working hours-->
            <div class="working_hours">
                <span class="time opening">07<sup>00</sup></span>
                <span class="time closing">01<sup>00</sup></span>
            </div>

            <!--Promo carousel start-->
            <div id="container">
                <div id="carousel" class="ui-carousel">
                    <div class="wrapper">
                        <div class="slide" id="slide01" style="width: 980px; height: 300px; margin-right: 0;">
                            <div class="text">
                                <h1>Музичні вечори</h1>
                                <p>"Арсенал" - один із небагатьох у Львові ресторанів, який має справді професійне звукове обладнання. Вечори в <br> закладі мають особливе музичне оформлення, адже тут виступають професійні львівські музиканти - віртуози. <br> Шість вечорів на тиждень тут звучить класична музика, джаз, етно-рок, рок-н-ролл, ірландська музика.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Promo carousel end-->

            <!--Promo carousel controls-->
            <button class="controls-carousel-prev" id="ui-carousel-prev"></button>
            <button class="controls-carousel-next" id="ui-carousel-next"></button>

            <!--3D tour & Hall map-->
            <a class="promo_links-sprite promo_links-tour_3d" href="#"></a>
            <a class="promo_links-sprite promo_links-hall_map" href="#"></a>

        </div>

        <!--Promo image bottom decoration-->
        <div class="promo_img_decoration_wrapper">
            <div class="promo_img_decoration left"></div>
            <div class="promo_img_decoration center"></div>
            <div class="promo_img_decoration right"></div>
        </div>

    </div>
    <!--Promo image end-->

    <!--Header start-->

            <?php $this->widget('application.modules.menu.widgets.MenuWidget', array(
                'name' => 'top_'.Yii::app()->language,
                'params' => array('hideEmptyItems' => true),
                'layoutParams' => array('htmlOptions' => array(
                    'class' => 'jqueryslidemenu',
                    'id' => 'myslidemenu',
                )),
            )); ?>

    <!--Header end-->


    <!-- Швидкі повідомлення -->
    <?php //$this->widget('YFlashMessages');?>

    <?php echo $content; ?>
    <!--Footer-->
    <div class="footer_wrapper">
        <footer>
            <span>© Музей-ресторан “Арсенал” <?$y="2013";echo $y;if($y!=date("Y"))echo "-".date("Y");?></span>
            <!--Decorated separator-->
            <div class="decor_separator decor_08"></div>
        </footer>
    </div>
</div>
<div id="popup" style="position: absolute; top:0;background: #fff; width: 100%;height: 100%;display: none;">
    <div class="closer">Close</div>
    <div class="wrap_popup_body"></div>
</div>
<?php $this->widget("application.modules.contentblock.widgets.ContentBlockWidget", array("code" => "STAT","silent" => true)); ?>
</body>
</html>
