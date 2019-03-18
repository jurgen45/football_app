<app>
	<!-- Spinner -->
	<spinner loading="{loading}"></spinner>
	<h1>Championnat</h1>
	
	<div each={ categorie }> 
		<button>{ name }</button>
	</div>
	
	<script type="text/javascript">
	this.loading = false;  // booléen qui controle le spinner
	this.categorie=[];
	this.mixin('serviceAjax');

	this.getCompet = function(){
		this.loading=true;
		this.update();
		var t = this;
		this.getChampionnats()
			.then(function(e){
				t.categorie=e.competitions;
				console.log(e.competitions);
				t.loading=false;
				t.update;
				console.log(t.categorie);
			});
			//console.log(t.categorie);
	}
	this.getCompet();
	</script>
</app>