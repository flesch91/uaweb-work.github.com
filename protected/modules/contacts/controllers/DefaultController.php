<?php

class DefaultController extends YBackController
{
    /**
     * Manages all models.
     */
    public function actionIndex()
    {
        $model="Desription";
        $this->render('index', array('model' => $model));
    }

}