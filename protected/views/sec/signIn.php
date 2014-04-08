<?php $box = $this->beginWidget('bootstrap.widgets.TbBox',
	array(
		'title' => 'Login',
		'headerIcon' => 'icon-lock',
		'htmlHeaderOptions' =>array('class' => 'login_header'),
		'htmlContentOptions' =>array('class' => 'login_content')
	));?>    
    
    <?php /** @var TbActiveForm $form */
	 	$form = $this->beginWidget('bootstrap.widgets.TbActiveForm',
		   			array(
				     	'id' => 'horizontalForm',
						'type' => 'horizontal',
			    ));
	    echo $form->textFieldRow($signInForm, 'username', array('autocomplete'=> 'off','placeholder' => 'Username'));
	    echo $form->passwordFieldRow($signInForm, 'password',array('placeholder' => 'Password'));
	    $this->widget(
	    'bootstrap.widgets.TbButton',
	    	array('buttonType' => 'submit', 'label' => 'Signin', 'type' => 'primary', 'htmlOptions'=> array('class'=> 'pull-right'))
	    );
	     echo "</div>";
	    	$this->endWidget();
	    	unset($form);
	?>
<?php $this->endWidget(); ?>
	
<style>
	.form-horizontal .control-label{
		text-align: right;
		width: 80px;
		min-height: 1px;
    	padding-left: 15px;
    	padding-right: 15px;
    	position: relative;
    	 margin-left: -15px;
	}
	#SignInForm_username, #SignInForm_password{
		margin-left: -80px;
	}
	.login_header{width: 360px;}
	.login_content{width: 330px;}
	.bootstrap-widget-header{background: #428BCA; border: 1px solid #428BCA;}
	.bootstrap-widget-content{border: 1px solid #428BCA;}
	.bootstrap-widget-header h3{color: #FFF3F3; font-weight: 0;}
	#yw1{margin-right: 15px;}
	.error{width:200px; margin-left: -50px;}
</style>
</style>