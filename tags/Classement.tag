<classement>
	<spinner loading="{ loading }"></spinner>
	<table class="tableau">
		<tr>
			<th>Rang</th>
			<th>Equipe</th>
			<th>Points</th>
			<th>Joué</th>
			<th>Match</th>
			<th>Enemie</th>
			<th>difference</th>
		</tr>
		<tr each="{ team }" class="tableau_equipe">
			<td>{ position }</td>
			<td><img src="{ team.crestUrl }" >{ team.name }</td>
			<td>{ points }</td>
			<td>{ playedGames }</td>
			<td>{ goalsFor }</td>
			<td>{ goalsAgainst }</td>
			<td>{ goalDifference }</td>
		</tr>
	</table>

	<script type="text/javascript">
		this.loading = false;
		this.mixin('serviceAjax');
		this.team=[];
		this.id=opts.id;
		var that=this;

		this.getEquipe = function(){
			this.loading=true;
			this.getTeam(that.id)
				.then(function(data){
					that.team=data.standings[0].table;
					console.log(that.team);
					that.loading=false;
					that.update();
				});
		}
		this.getEquipe();
	</script>
</classement>