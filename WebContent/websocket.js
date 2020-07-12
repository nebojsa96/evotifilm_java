var ws;

function connect() {
    var korisnickoIme = document.getElementById("korisnickoIme").value;
    ws = new WebSocket("ws://" + document.location.host + "/evotifilm/chat/" + korisnickoIme);


    ws.onmessage = function(event) {
    var log = document.getElementById("log");
        //console.log(event.data);
        var message = JSON.parse(event.data);
        log.innerHTML += message.from + " : " + message.content + "\n";
    };
    document.getElementById("korisnickoIme").disabled = true;
    document.getElementById("connect").disabled = true;
    document.getElementById("disconnect").disabled = false;
}

function send() {
    var content = document.getElementById("msg").value;
    var json = JSON.stringify({
        "content":content
    });

    ws.send(json);
 
    document.getElementById("msg").value = "";
}

function disconnect() {
	document.getElementById("korisnickoIme").disabled = false;
	document.getElementById("connect").disabled = false;
	document.getElementById("disconnect").disabled = true;
	ws.close();
}