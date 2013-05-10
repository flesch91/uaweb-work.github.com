
<div class="header_wrapper">
    <header class="container">
        <!--Header navigation-->
        <nav class="header_nav">
            <?php echo $this->widget('zii.widgets.CMenu', $params1, true); ?>
            <!--Header logo-->
            <a class="header_logo" href="index.html"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/web/im/logo.png" alt="Arsenal logo"/></a>
            <?php echo $this->widget('zii.widgets.CMenu', $params2, true); ?>
        </nav>

        <!--Header social links-->
        <div class="header_social_links">
            <a class="social_icons-sprite fb" href="#"></a>
            <a class="social_icons-sprite vk" href="#"></a>
        </div>
        <?php $this->widget('application.modules.yupe.widgets.YLanguageSelector'); ?>
    </header>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $(function() {
            var $menu = $(".header_wrapper");
            if(typeof $menu[0]!= "undefined"){
                MenuFix = $menu.offset().top+70;
                $(window).scroll(function() {
                    if ($(window).scrollTop() >= MenuFix) {
                        $menu.addClass("menu_fixed");
                    }
                    else if ($(window).scrollTop() <= MenuFix+60) {
                        $menu.removeClass("menu_fixed");
                    }
                });
            }
        });
    });
</script>