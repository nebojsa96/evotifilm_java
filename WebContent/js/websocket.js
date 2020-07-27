var ws;

function connect(korisnickoIme) {
    ws = new WebSocket("ws://" + document.location.host + "/evotifilm/chat/" + korisnickoIme);


    ws.onmessage = function(event) {
    var log = document.getElementById("log");
       console.log(event.data);
        var message = JSON.parse(event.data);
        log.innerHTML += message.from + " : " + message.content + "\n";
        	var uList = message.usersList;
        	console.log(uList);
        	var html = "";
        	for(let i=0; i<uList.length; i++ ) {
        		html += "<li class='list-group-item text-center'>";
        		html += uList[i];
        		html += "</li>";
        	}
        	console.log(html);
        	document.getElementById("ul-users").innerHTML = html;
        	document.getElementById("num-users").innerHTML = uList.length;
        
    };
}

function send() {
    var content = document.getElementById("input-msg").value;
    var json = JSON.stringify({
        "content":content
    });

    ws.send(json);
 
    document.getElementById("input-msg").value = "";
}

function disconnect() {
	ws.close();
	document.getElementById("ul-users").innerHTML = "";
	document.getElementById("num-users").innerHTML = "0";
}