<classement>
	<spinner loading="{ loading }"></spinner>
	<p>hell</p>
	<p each="{ team }">{ type }</p>

	<script type="text/javascript">
		this.loading = false;
		this.mixin('serviceAjax');
		this.team=[];
		var that=this;

		this.getEquipe = function(){
			this.loading=true;
			this.getTeam()
				.then(function(data){
					that.team=data.standings[0];
					console.log(that.team);
					that.loading=false;
					that.update();
				});
		}
		this.getEquipe();

	</script>
</classement>