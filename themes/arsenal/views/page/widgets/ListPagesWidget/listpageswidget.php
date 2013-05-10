<?php foreach($pages as $page){?>
        <li>
            <a class="popup_static_page <?php echo $page->title_short;?>" href="<?php echo $page->slug;?>">
                <span class="restaurant_menu_name"><?php echo $page->title;?></span>
                <span class="restaurant_menu_ico menu_icons-sprite"></span>
            </a>
        </li>
<? } ?>