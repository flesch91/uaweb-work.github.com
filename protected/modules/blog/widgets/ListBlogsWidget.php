<?php
/**
 * Created by JetBrains PhpStorm.
 * User: aopeykin
 * Date: 26.04.12
 * Time: 10:41
 * To change this template use File | Settings | File Templates.
 */
class ListBlogsWidget extends YWidget
{
    public function run()
    {
        $this->render('listblogswidget', array('models' => Blog::model()->public()->published()->cache($this->cacheTime)->findAll()));
    }
}
