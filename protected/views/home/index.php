<?php 
	$this->pageTitle=Yii::app()->name;

	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
						
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.crud.js');	
	
?>

<?php 
$this->beginWidget('ext.yii-easyui.widgets.EuiWindow', array(
	'title' => 'Sign In',
	'id'=> 'login-win',
	'style'=> 'width:400px',
	'closable' => false,
	'collapsible' => true,
	'iconCls'=> 'icon-lock',
	'modal' => true,
	'shadow'=> false,
	'buttons' => '#dlg-button'	
));?>
		<?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm',
			   		array('id' => 'signInForm',
			   			  'type' => 'horizontal',
			   			  //'enableClientValidation'=>true,
						  'clientOptions'=>array(
		  				 	 'validateOnSubmit'=>true
							 )
					));?>
		
			<div>
				<?php if(Yii::app()->user->hasFlash('auth_message')): ?>
					<div class="alert alert-warning alert-danger">
						 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					  <strong>Warning!</strong> <?php echo Yii::app()->user->getFlash('auth_message'); ?>
					</div>
				<?php endif; ?>
			</div>
		
		  <?php
		    echo $form->textFieldRow($signInForm, 'username', array('autocomplete'=> 'off','placeholder' => 'Username', 'style'=> 'margin-left:-50px'));
		    echo $form->passwordFieldRow($signInForm, 'password',array('placeholder' => 'Password','style'=> 'margin-left:-50px'));
		  ?>  	
		   <div id="" class="dialog-button" style="margin-bottom: -20px;">
		 <?php 
			 	
				  $this->widget('bootstrap.widgets.TbButton',array(
							 'id' => 'btn-save',	
							 'label' => 'Sign In',
							 'size' => 'small',
							 'buttonType'=>'submit',
							 'htmlOptions' => array('style' => 'margin-left:5px;'),
						  ));
				 
		
		?>
		</div>
		    	
	
<?php 
	$this->endWidget();
	unset($form);	
	$this->endWidget();  
?>


<style>
	.btn{margin-left: 5px;}
	.form-horizontal .control-label{width: 110px;}
	#signInForm{padding-top: 20px;}
</style>
