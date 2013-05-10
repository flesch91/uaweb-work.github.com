<?php
class PaginationWidget extends YWidget
{
    public $max = 100;
    public $page = 1;
    public $alias = "";
    public $view_model = 'paginator';

    public function run()
    {
        for($i=2;$i<=7;$i++){
            if( (($this->page-4+$i)>0)&&(($this->page-4+$i)<=$this->max) ){
                $arr[$i]=($this->page-4)+$i;
            }else{
                $arr[$i]=null;
            }
        }
        if($this->page>4){$arr[0]='1';$arr[1]="...";}
        if($this->page<=3){$arr[0]='';$arr[1]="";}
        if($this->page==3){$arr[0]='';$arr[1]="";}
        if($this->page==4){$arr[0]='';$arr[1]="1";}

        if($this->page<=($this->max-4)){$arr[8]=$this->max;$arr[7]="...";}
        //if($this->page>=($this->max-4)){$arr[8]="";$arr[7]="";}

        $this->render($this->view_model, array('model'=>$arr,'alias'=>$this->alias,'page'=>$this->page,"max"=>$this->max ));
    }
}