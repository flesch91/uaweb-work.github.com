<div class="clearfix"></div>
<!--Main page pagination start-->
<div alt="<?php echo $page;?>" class="main_page_pagination_wrapper">

    <button alt="<?php echo $alias;?>" class="main_pagination prev"><img src="<?php echo Yii::app()->theme->baseUrl;?>/web/im/pagination_prev.png" alt="Previous"/></button>

    <ul class="main_page_pagination">
        <li alt="<?php echo $alias;?>"><a class="pagination" href='<?php echo $model[0];?>'><?php echo $model[0];?></a></li>
        <?php if($model[1]=="..."){?>
            <li><span><?php echo $model[1];?></span></li>
        <?php }else{?>
            <li  alt="<?php echo $alias;?>"><a class="pagination" href="#<?php echo $model[1];?>"><?php echo $model[1];?></a></li>
        <?php };?>

        <li alt="<?php  echo $alias;?>"><a class="pagination" href="#<?php echo $model[2];?>"><?php echo $model[2];?></a></li>
        <li alt="<?php echo  $alias;?>"><a class="pagination" href="#<?php echo $model[2];?>"><?php echo $model[3];?></a></li>
        <li alt="<?php  echo $alias;?>" class="is-active"><a class="pagination" href='<?php echo $model[2];?>'><?php echo $model[4];?></a></li>
        <li alt="<?php  echo $alias;?>"><a class="pagination" href=" <?php echo $model[2];?>"><?php echo $model[5];?></a></li>
        <li alt="<?php echo  $alias;?>"><a class="pagination" href=" <?php echo $model[2];?>"><?php echo $model[6];?></a></li>

        <?php if($model[7]=="..."){?>
            <li><span><?php echo $model[7];?></span></li>
        <?php }else{ ?>
            <li  alt="<?php echo  $alias;?>"><a class="pagination" href="<?php echo $model[7];?>"><?php echo $model[7];?></a></li>
        <?php };?>
        <li alt="<?php echo  $alias;?>"><a class="pagination" href="<?php echo $model[8];?>"><?php echo $model[8];?></a></li>
    </ul>
    <span class="max" alt="<?php echo $max;?>"></span>
    <button alt="<?php echo $alias;?>" class="main_pagination next"><img src="<?php echo Yii::app()->theme->baseUrl;?>/web/im/pagination_next.png" alt="Next"/></button>

</div>
<!--Main page pagination end-->