<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo Yii::app()->language; ?>" lang="<?php echo Yii::app()->language; ?>">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="language" content="<?php echo Yii::app()->language; ?>"/>
    <meta name="keywords" content="<?php echo $this->keywords; ?>"/>
    <meta name="description" content="<?php echo $this->description; ?>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width">

    <?php $module = Yii::app()->getModule('yupe'); ?>
    <?php Yii::app()->clientScript->registerScriptFile($jNotify . '/js/lib/jquery-1.9.0.min.js'); ?>

    <link rel="shortcut icon" href="/favicon.ico"/>
    <title><?php echo CHtml::encode($this->pageTitle); ?></title>

    <link rel="stylesheet" href="/css/style.css">

    <!--Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700italic,700,500italic,500,400italic,300italic,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Ledger&subset=cyrillic,latin-ext' rel='stylesheet' type='text/css'>

    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->


    <?php Yii::app()->clientScript->registerScriptFile('/js/jquery.form.js',CClientScript::POS_BEGIN);?>

    <?php Yii::app()->clientScript->registerScript('scroll','$(document).ready(function() {
            $(".listItemLink").click(function () {
                elementClick = $(this).attr("href");
                destination = $(elementClick).offset().top-180;
                $("body").animate({ scrollTop: destination}, 1100 );
                return false;
            });
        });');?>
</head>

<body>

<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->

<div id="loader" style="display: none;position: fixed; width: 500px;height: 500px; top: 100px;left: 400px;"><img src="/images/ajax-loader.gif" alt="loader" /></div>
<div id="popup" style="z-index:1000; display: none; padding: 10px; position: fixed; width: 500px;height: 300px; top: 40px;left: 400px; background-color: #eee;">
    <div class="closer" style="  background-color: #FFAAAA;  float: right; height: 20px; width: 20px; cursor: pointer;">X</div>
    <div class="content" style="overflow: auto; height: 100%"></div>
</div>

<div class="container" id="page">

    <div id="header">
        <div id="logo">
            <a href="<?php echo CHtml::normalizeUrl(array("/site/index"))?>"><?php echo CHtml::image(Yii::app()->baseUrl . '/web/images/arsenalskuj.png');?></a>
            <span style="vertical-align: 40px; margin-left: 20px; font-size: 25px;">
                <?php echo CHtml::encode($module->siteDescription);?>
            </span>

        </div>
    </div>
    <!--Header start-->
    <div class="header_wrapper">
        <header class="container">
            <?php $this->widget('application.modules.menu.widgets.MenuWidget', array(
                'name' => "top_".Yii::app()->language,
                'params' => array('hideEmptyItems' => true),
                'layoutParams' => array('htmlOptions' => array(
                    'class' => 'jqueryslidemenu',
                    'id' => 'myslidemenu',
                )),
            )); ?>
        </header>
    </div>
    <!--Header end-->


    <?php $this->widget('application.modules.yupe.extensions.jquerySlideMenu.JquerySlideMenuWidget'); ?>
    <!-- mainmenu -->
    <?php $this->widget('zii.widgets.CBreadcrumbs', array('links' => $this->breadcrumbs)); ?>
    <!-- breadcrumbs -->
    <?php $this->widget('YFlashMessages');?>

    <div class="container">
        <div class="span-19">
            <div id="content">
                <?php echo $content; ?>
            </div>
            <!-- content -->
        </div>
        <div class="span-5 last">
            <div id="sidebar">
                <?php $this->widget('application.modules.blog.widgets.LastPostsWidget', array('cacheTime' => 0)); ?>
                <?php $this->widget('application.modules.blog.widgets.TagCloudWidget', array('cacheTime' => 0)); ?>
                <?php $this->widget('application.modules.feedback.widgets.FaqWidget', array('cacheTime' => 0)); ?>
                <?php //$this->widget('application.modules.news.widgets.LastNewsWidget', array('cacheTime' => 0)); ?>
                <?php $this->widget('application.modules.blog.widgets.BlogsWidget', array('cacheTime' => 0));?>
                <?php $this->widget('application.modules.user.widgets.LastLoginUsersWidget', array('cacheTime' => 0)); ?>
            </div>
            <!-- sidebar -->
        </div>
    </div>

    <div id="footer">
        Copyright &copy; 2009-<?php echo date('Y'); ?> <a href='http://yupe.ru?from=engine'>Юпи!</a>
        v<?php echo $module->getVersion();?><br/> <?php echo Yii::powered(); ?>

        <?php $this->widget('YPerformanceStatistic');?>
    </div>
    <!-- footer -->
</div>
<!-- page -->
<?php $this->widget("application.modules.contentblock.widgets.ContentBlockWidget", array("code" => "STAT","silent" => true)); ?>
</body>
</html>
