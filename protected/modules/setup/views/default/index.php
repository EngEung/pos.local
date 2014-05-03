<?php
$this->breadcrumbs=array(
	$this->module->id,
);
?>
<<<<<<< HEAD
<h1><?php echo $this->uniqueId . '/' . $this->action->id; ?></h1>
=======
<h1> Dashboard<?php //echo $this->uniqueId . '/' . $this->action->id; ?></h1>
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6

<p>
This is the view content for action "<?php echo $this->action->id; ?>".
The action belongs to the controller "<?php echo get_class($this); ?>" in the "<?php echo $this->module->id; ?>" module.
</p>
<p>
You may customize this page by editing <tt><?php echo __FILE__; ?></tt>
</p> 
<<<<<<< HEAD
<?php 
var_dump(Yii::app()->session['flag']);
var_dump(23);
?>
=======
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6
