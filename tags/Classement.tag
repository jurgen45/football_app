<classement>
	<spinner loading="{ loading }"></spinner>
	<h3>{"Classement journée "+current.currentMatchday}</h3>
	<div  each="{ s in standingsTab }" if = "{s.type === 'TOTAL'}">
		<h4>{ s.group }</h4>
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
			<tr each = "{ elem in s.table }" class="tableau_equipe">
				<td>{ elem.position }</td>
				<td><img src="{ elem.team.crestUrl }"/>{ elem.team.name }</td>
				<td>{ elem.points }</td>
				<td>{ elem.playedGames }</td>
				<td>{ elem.goalsFor }</td>
				<td>{ elem.goalsAgainst }</td>
				<td>{ elem.goalDifference }</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		this.loading = false;
		this.mixin('serviceAjax');
		this.standingsTab=[];
		this.id=opts.id;
		this.current=[];
		var t=this;

		this.getEquipe = function(){
			this.loading=true;
			this.getClassement(t.id)
				.then(function(data){
					t.standingsTab=data.standings;
					console.log(t.standings);
					t.current=data.season;
					t.loading=false;
					t.update();
				});
		}
		this.getEquipe();
	</script>
</classement>