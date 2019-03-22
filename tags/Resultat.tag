<Resultat>
	<spinner loading="{ loading }"></spinner>
	<div >
    <FORM>
	    <SELECT name="date" size="1" class="choice">
		    <OPTION each="{i in nbJours}" onClick="{ setDay }" id={i} name="{ i }">{i}
	    </SELECT>
    </FORM>
		<h4>{"journée "+currentMatchday}</h4>
		<table each="{ res in mtc }" if="{ res.matchday == currentMatchday}" class="tableauRes">
			<tr>
				<td>{res.group}</td>
				<td>{res.homeTeam.name}</td>
				<td>{res.score.fullTime.homeTeam+" - "+res.score.fullTime.awayTeam}</td>
				<td>{res.awayTeam.name}</td>
			</tr>
		</table>
	</div>
	
	<p></p>
	<script type="text/javascript">
		this.loading = false;
		this.mixin('serviceAjax');
		var t=this;
		this.mtc=[];
		this.nbJournée=0;
		this.id=opts.id;
		this.currentMatchday=1;
		this.nbJours=[];
		this.nbJ=0;

		this.getMatch = function(){
			this.loading=true;
			this.getMatchs(t.id)
				.then(function(data){
					t.mtc=data.matches;
					console.log(t.mtc);
					t.nbJ=t.mtc[t.mtc.length-1].matchday;
					console.log(t.nbJ);
					for (var i = 1; i <= t.nbJ; i++) {
						t.nbJours[i]=i;
					}
					t.loading=false;
					t.update();
				});
		}
		this.getMatch();

		this.setDay = function(evenement){
			t.currentMatchday=parseInt(evenement.target.id, 10);
			console.log(evenement.target.id);
			t.update();
		}
	</script>
</Resultat>