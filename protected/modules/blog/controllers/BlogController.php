<?php
class BlogController extends YFrontController
{
    /**
     * Выводит список блогов
     *
     * @return void
     */
    public function actionIndex()
    {
        $dataProvider = new CActiveDataProvider(
            'Blog', array(
                'criteria' => array(
                    'condition' => 't.status = :status',
                    'params'    => array(':status' => Blog::STATUS_ACTIVE),
                    'with'      => array('createUser', 'postsCount', 'membersCount'),
                    'order'     => 'create_date DESC',
                ),
            )
        );
        $this->render('index', array('dataProvider' => $dataProvider));
    }

    /**
     * Отобразить карточку блога
     *
     * @param string $slug - url блога
     *
     * @return void
     */
    public function actionShow($slug = null)
    {
        $blog = Blog::model()->showByUrl($slug)->find();

        if ($blog === null)
           throw new CHttpException(404, Yii::t('BlogModule.blog', 'Блог "{blog}" не найден!', array('{blog}' => $slug)));

        $this->render(
            'show', array(
                'blog'    => $blog,
            )
        );
    }

    public function actionajaxlist(){
        if (!Yii::app()->request->isAjaxRequest
            || ($blogID = Yii::app()->request->getParam('blogID')) == null){
            throw new CHttpException(404, Yii::t('BlogModule.blog', 'Страница не найдена!'));
        }
        if(($new_post_id = Yii::app()->request->getParam('new_post_id'))==null){$new_post_id=0;}
        if(($page = Yii::app()->request->getParam('page')) == null){$page=1;}
            $this->widget('blog.widgets.LastPostsOfBlogWidget', array('blogID' => $blogID,'page'=>$page,"new_post_id"=>$new_post_id,"view_model"=>"listposts_popup"));
    }

    public function actionajaxpost(){
        if (!Yii::app()->request->isAjaxRequest
            || ($postid = Yii::app()->request->getParam('postid')) == null
        )
            throw new CHttpException(404, Yii::t('BlogModule.blog', 'Страница не найдена!'));
        $this->widget('application.modules.blog.widgets.ShowPostWidget', array('postID' => $postid));
    }
    /**
     * метод для ajax-запроса на получение последних
     * постов блога:
     *
     * @return void
     **/
    public function actionLastpostsofblog()
    {
        if (!Yii::app()->request->isPostRequest
            || !Yii::app()->request->isAjaxRequest
            || ($blogID = Yii::app()->request->getParam('blogID')) == null
        )
            throw new CHttpException(404, Yii::t('BlogModule.blog', 'Страница не найдена!'.$blogID));

        Yii::app()->ajax->success(
            $this->widget('blog.widgets.LastPostsOfBlogWidget', array('blogID' => $blogID), true)
        );
    }

    /**
     * Показать участников блога
     * 
     * @return void
     */
    public function actionPeople()
    {
        if (!Yii::app()->request->isPostRequest
            || !Yii::app()->request->isAjaxRequest
            || ($blogID = Yii::app()->request->getPost('blogId')) === null
        )
            throw new CHttpException(404, Yii::t('BlogModule.blog', 'Страница не найдена!'));

        Yii::app()->ajax->success(
            $this->widget('blog.widgets.MembersOfBlogWidget', array('blogID' => $blogID), true)
        );
    }

    /**
     * "вступление" в блог
     *
     * @param int $blogId - id-блога
     *
     * @return void
     */
    public function actionJoin($blogId = null)
    {
        if (!Yii::app()->user->isAuthenticated()) {
            if (Yii::app()->request->isAjaxRequest) {
                Yii::app()->ajax->failure(Yii::t('BlogModule.blog', 'Пожалуйста, авторизуйтесь!'));
            } else {
                Yii::app()->user->setFlash(
                    YFlashMessages::NOTICE_MESSAGE,
                    Yii::t('BlogModule.blog', 'Пожалуйста, авторизуйтесь!')
                );
                $this->redirect(array('/blog/blog/index'));
            }
        }

        if ($blogId === null && Yii::app()->request->isPostRequest && Yii::app()->request->isAjaxRequest)
            $blogId = Yii::app()->request->getPost('blogId');

        $errorMessage = false;

        $blogId = (int) $blogId;
        if (!$blogId)
            $errorMessage = Yii::t('BlogModule.blog', 'Не передан blogId!');

        if (($blog = Blog::model()->loadModel($blogId)) === null)
            $errorMessage = Yii::t('BlogModule.blog', 'Блог с id = {id} не найден!', array('{id}' => $blogId));

        if ($errorMessage !== false) {
            if (Yii::app()->request->isAjaxRequest) {
                Yii::app()->ajax->failure($errorMessage);
            } else {
                Yii::app()->user->setFlash(
                    YFlashMessages::ERROR_MESSAGE,
                    $errorMessage
                );
                $this->redirect(array('/blog/blog/index'));
            }
        }

        if ($blog->userInBlog(Yii::app()->user->id) === false) {
            
            $blog->join(Yii::app()->user->id);
            
            if (Yii::app()->request->isAjaxRequest) {
                Yii::app()->ajax->success(
                    array(
                        'message' => Yii::t('BlogModule.blog', 'Вы присоединились к блогу!'),
                        'content' => $this->renderPartial('_view', array('data' => $blog), true),
                    )
                );
            } else {
                Yii::app()->user->setFlash(
                    YFlashMessages::NOTICE_MESSAGE,
                    Yii::t('BlogModule.blog', 'Вы присоединились к блогу!')
                );
                $this->redirect(array('/blog/blog/index'));
            }
        } else {
            if (Yii::app()->request->isAjaxRequest)
                Yii::app()->ajax->failure(
                    array(
                        'message' => Yii::t('BlogModule.blog', 'Вы уже присоединились к блогу!'),
                    )
                );
            else
            {
                Yii::app()->user->setFlash(
                    YFlashMessages::NOTICE_MESSAGE,
                    Yii::t('BlogModule.blog', 'Вы уже присоеденены к этому блогу!')
                );
                $this->redirect(array('/blog/blog/index'));
            }
        }
    }

    /**
     * "покинуть" блог
     *
     * @param int $blogId - id-блога
     *
     * @return void
     */
    public function actionUnjoin($blogId = null)
    {
        if (!Yii::app()->user->isAuthenticated()) {
            if (Yii::app()->request->isAjaxRequest) {
                Yii::app()->ajax->failure(Yii::t('BlogModule.blog', 'Пожалуйста, авторизуйтесь!'));
            } else {
                Yii::app()->user->setFlash(
                    YFlashMessages::NOTICE_MESSAGE,
                    Yii::t('BlogModule.blog', 'Пожалуйста, авторизуйтесь!')
                );
                $this->redirect(array('/blog/blog/index'));
            }
        }

        if ($blogId === null && Yii::app()->request->isPostRequest && Yii::app()->request->isAjaxRequest)
            $blogId = Yii::app()->request->getPost('blogId');

        $errorMessage = false;

        $blogId = (int) $blogId;
        if (!$blogId)
            $errorMessage = Yii::t('BlogModule.blog', 'Не передан blogId!');

        if (($blog = Blog::model()->loadModel($blogId)) === null)
            $errorMessage = Yii::t('BlogModule.blog', 'Блог с id = {id} не найден!', array('{id}' => $blogId));
        elseif ($blog->createUser->id == Yii::app()->user->id) {
            if (Yii::app()->request->isAjaxRequest) {
                Yii::app()->ajax->failure(
                    Yii::t('BlogModule.blog', 'Вы являетесь создателем данного блога и не можете его покинуть.')
                );
            } else {
                Yii::app()->user->setFlash(
                    YFlashMessages::ERROR_MESSAGE,
                    Yii::t('BlogModule.blog', 'Вы являетесь создателем данного блога и не можете его покинуть.')
                );
                $this->redirect(array('/blog/blog/index'));
            }
        }


        if ($errorMessage !== false) {
            if (Yii::app()->request->isAjaxRequest) {
                Yii::app()->ajax->failure($errorMessage);
            } else {
                Yii::app()->user->setFlash(
                    YFlashMessages::ERROR_MESSAGE,
                    $errorMessage
                );
                $this->redirect(array('/blog/blog/index'));
            }
        }

        if (($userToBlog = $blog->userInBlog(Yii::app()->user->id)) !== false) {
            
            if ($userToBlog->delete()) {
                if (Yii::app()->request->isAjaxRequest) {
                    Yii::app()->ajax->success(
                        array(
                            'message' => Yii::t('BlogModule.blog', 'Вы покинули блог!'),
                            'content' => $this->renderPartial('_view', array('data' => $blog), true),
                        )
                    );
                } else {
                    Yii::app()->user->setFlash(
                        YFlashMessages::NOTICE_MESSAGE,
                        Yii::t('BlogModule.blog', 'Вы покинули блог!')
                    );
                    $this->redirect(array('/blog/blog/index'));
                }
            } else {
                if (Yii::app()->request->isAjaxRequest) {
                    Yii::app()->ajax->failure(Yii::t('BlogModule.blog', 'Произошла ошибка при исключении из блога!'));
                } else {
                    Yii::app()->user->setFlash(
                        YFlashMessages::NOTICE_MESSAGE,
                        Yii::t('BlogModule.blog', 'Произошла ошибка при исключении из блога!')
                    );
                    $this->redirect(array('/blog/blog/index'));
                }
            }
        } else {
            if (Yii::app()->request->isAjaxRequest)
                Yii::app()->ajax->failure(Yii::t('BlogModule.blog', 'Вы не присоеденены к этому блогу!'));
            else
            {
                Yii::app()->user->setFlash(
                    YFlashMessages::NOTICE_MESSAGE,
                    Yii::t('BlogModule.blog', 'Вы не присоеденены к этому блогу!')
                );
                $this->redirect(array('/blog/blog/index'));
            }
        }
    }
}