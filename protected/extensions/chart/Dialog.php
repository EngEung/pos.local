<?php

class Dialog extends  CWidget{
	
	public $tag = '<table>';
	public $url = "";
	public $id = "";

	public function init()
	{
		if( empty($this->items) )
			return;
		$menuClass = 'accordion-menu';
		$cs = Yii::app()->clientScript;

		$dirname = basename(dirname(__FILE__));
		$js = $assetUrl . '/assets/js/script.js';

		Yii::app()->clientScript->registerScriptFile( $js );

		$content = '';
		$content = $this->renderTag($item);

		$htmlOptions = array(
			'id' => empty($this->id) ? null : $this->id,
			'class' => $menuClass
		);

		echo CHtml::tag($this->tag, $htmlOptions, $content);
	}

	private function renderTag($item, $level=1)
	{
		return '<table id="dg"></table>';
	}
}
?>