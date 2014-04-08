<?php
/* @var $this SiteController */
/* @var $model LoginForm */
/* @var $form CActiveForm  */

$this->pageTitle=Yii::app()->name . ' - Sing in';
//$this->breadcrumbs=array(
//	'Sign in',
//);
?>

<div class="form">
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'login-form',
	'enableClientValidation'=>true,
	'clientOptions'=>array(
		'validateOnSubmit'=>true,
	),
)); ?>
<div style="width: 400px; margin: 0 auto;">
	<div class="auth-form-header">
		<h1>Sign in</h1>
	</div>
		<div class="auth-form-body">
			<?php if(Yii::app()->user->hasFlash('auth_message')): ?>
		
				<div class="errorSummary">
					<?php echo Yii::app()->user->getFlash('auth_message'); ?>
				</div>
				
			<?php endif; ?>
		
		<div class="row">
			<?php echo $form->labelEx($model,'username'); ?>
			<?php echo $form->textField($model,'username', array('class'=>'inputtext')); ?>
			<?php echo $form->error($model,'username'); ?>
		</div>
	
		<div class="row">
			<?php echo $form->labelEx($model,'password'); ?>
			<?php echo $form->passwordField($model,'password', array('class'=>'inputtext')); ?>
			<?php echo $form->error($model,'password'); ?>
			
		</div>
		<div class="row buttons">
			<?php echo CHtml::submitButton('Sign in'); ?>
		</div>
	</div>
</div>
<?php $this->endWidget(); ?>
</div><!-- form -->
