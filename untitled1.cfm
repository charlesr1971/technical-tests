
<cfscript>

	function fib(n){
		if(n LT 2){
			return n;
		}
		else{
			return fib(n-1) + fib(n-2);
		}
	}
	
	function numberSequencer(n,m,end){
		var sequenceList = "";
		while(fib(n) LTE end){
			sequenceList = ListAppend(sequenceList,fib(n));
			n = n + m;
		}
		return sequenceList;
	}

</cfscript>