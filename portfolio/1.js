
//urbandead

//if (document.head.innerHTML.match("Urban Dead - The City") != null)
if (document.head.innerHTML.match("urbandead") != null || document.head.innerHTML.match("Urban Dead") != null)
    main();
else
    console.log("UdScriptFail");

function main(){
    //alert("1.js");        javascript pop-up window
    //console.log("1.js");  log message in chrome console
    addCoords();
    addDssMapLink();
    // STOP SCRIPT IF YOU HAVE NO AP
    if (document.body.innerHTML.match(/You have 0 Action Points remaining./) != null) return;
    formatHpXpAp();
    formatSurvivorNames();
    // STOP SCRIPT IF YOU ARE DEAD
    if (document.body.innerHTML.match(/you are <b>dead/) != null) return;
    var mallHtml = removeAndFormatMallHtml();
    formatActionsAndAppendMallHtml(mallHtml);
    formatComm();
    formatAttack();
    formatInventory();
    //formatGPS();
    // how barricaded?
    str1 = document.body.innerHTML.match(/[\w]+\sbarricaded$/);
    if (str1 != null)
    {
        //get barricaded info and do something interesting here.n
    }
}


function addCoords(){
    var match = document.body.innerHTML.match("You are asleep");
    if (match == null)
    {
        var loc = document.body.innerHTML.match(/"sb">(.+?)</)[1];
        
        //var match = document.body.innerHTML.match(/(\d+)(?:-)(\d+)/);
        var match = document.body.innerHTML.match(/(?:"sb"[^]*?)(\d+)(?:-)(\d+)+/);
        
        
        
        match[1]=parseInt(match[1],10)+1;
        match[2]=parseInt(match[2],10)+1;
        var gps='['+match[1]+','+match[2]+']';
        document.body.innerHTML=document.body.innerHTML.replace(loc, loc + ' ' + gps);
    }
}

function addDssMapLink(){
    var str1 = 'Donate</a>';
    var str2 = '</p><p><a href="http://map.dssrzs.org/" target="_blank" class="y">DSS Map</a></p>';    
        document.body.innerHTML = document.body.innerHTML.replace(str1,str1+str2);
        
           
    //document.body.innerHTML = document.body.innerHTML.replace(str1,str1+str2);
}

function formatHpXpAp(){   
    str1 = /(You are .+?. You have )(.+?)(?: Hit Points and )(.+?)(?: Exp.*ave )<b>(\d+?)<\/b>(?: Act.*?ing.)/;
    match = document.body.innerHTML.match(str1);
    var AP = match[4]
    AP = "<b>"+AP+"</b>";
    var size = '';
    var endsize = '';
    var action = ' actions';
    if (match[4]<11) {
        size = ' size="32"';
        endsize = '</font><font color="#0000cc">'
        if (match[4]==1)
            action = ' action';
    }
    str2 = match[1] + '<br><font color="#882222">' + match[2] + ' HP</font>, <font color="#22cc22">' + match[3] + ' XP</font>, and <font color="#0000cc"' +size+">"+ AP + endsize + action +"</font> left.";    
    if (match !=null) {
        document.body.innerHTML = document.body.innerHTML.replace(str1, str2);
    }
}

function formatSurvivorNames(){
    str1 = "Also here";
    body = document.body.innerHTML;
    match = body.match(str1);
    if (match!=null){
        body = body.replace(str1, "<br><br>"+match[0]);
        document.body.innerHTML = body;
    }
}

function removeAndFormatMallHtml(){

    body = document.body.innerHTML;
    regex = /<f((.|\n)(?!<f))*Search the(.|\n)*Search the(.|\n)*?m>/;
    match = body.match(regex);
    var mall = (match!=null);
    var mallHtml = "";
    
    if (mall==true) {
        body = body.replace(regex,'');
        str1 = match[0];
        str2 = "";
        str2 = str2 + "<table><col width=\"75\"><col width=\"1000\">";
        str2 = str2 + "<tr><td> " + "Search" + " </td>";
        str2 = str2 + "<td> " + match[0] + " </td></tr>";
        str2 = str2 + "</table>";
        str2 = str2.replace("<br>","");
        str2 = str2.replace(/Search the /g, "");
        var mallHtml = str2;
        document.body.innerHTML = body;
    }
    
    return mallHtml;
}

function formatActionsAndAppendMallHtml(mallHtml){
    body = document.body.innerHTML;
    var mictext = -1;
    var end = '';
    var action = [  "Dump the body outside gatehouse",
                    "Dump a body outside gatehouse",
                    "Dump the body outside",
                    "Dump a body outside",
                    "Repair building",
                    "Fix the generator",
                    "stains",
                    "Clean up graffiti",
                    "Scout the",
                    //"Fix the generator",
                    "Search the area",
                    //"Fix the generator",
                    "Access NecroNet",
                    //"Scout the",
                    "Barricade",
                    "Leave",
                    "Clean up Graffiti",
                    "Store" ];    
                
    //str1 = '(?:<p>Possible actions:<\/p>.*?)(<f(.|\\n)*?';
    //str2 = '(.|\\n)*?<\/form>)(<br>)*';	
    str1 = '(?:<p>Possible actions:<\/p>.*?)(<f(.|\n)*?';
    str2 = '(.|\n)*?<\/form>)(<br>)*';	
    
    for (var i = 0; i<action.length; i++){
        var regex = new RegExp(str1+action[i]+str2);
        match = body.match(regex);
        if (match != null) {
            var matchFound = true;
            break;
        }
    }
    
    match[1]=match[1].replace(/\n/g,'');
    str1 = match[0];
    str2 = "<br><table><col width=\"75\"><col width=\"1000\">";
    str2 = str2 + "<tr><td>Action </td><td> "+match[1]+" </td></tr>";
    str2 = str2 + "</table>";
    str2 = str2 + mallHtml;
    //str2 = str2 + "<br>";
    str2 = str2 + end;
    body = body.replace(str1,str2);
    document.body.innerHTML = body;
}

function formatComm(){
    body = document.body.innerHTML;
    end = '';
    str1 = -1;
    var check = 0;
    if (body.match("Retune transmitter")!=null){
        str1 = /(<f((.|\n)(?!<f))*("speech"|"graffiti"|"broadcast")(.|\n)*Retune transmitter(.|\n)*?m>)<br>/;
        check = -1;
    }
    
    /*
    else if (body.match("name=\"speech\"")!=null){
        //str1 = /(<f([^](?!<f))*("speech"[^]*?m>)(?:[^]*)(?:(<br>)*))([^]*?(?:ttack|tory))/;
        //str1 = /(<f([^](?!<f))*("speech"[^]*?m>)(?:[^]*?))([^]*?(?:ttack|tory))/;
        //str1 = /(<f([^](?!<f))*("speech"[^]*?m>)(?:[^]*?))([^]*?(?:(?:<f[^]*?Attack)|(?:<p>Inventory)))/;
        str1 = /(<f([^](?!<f))*("speech"[^]*?m>)(?:[^]*?)<\/form>(?:<br> ))/;
    
    }
    else if (body.match("name=\"graffiti\"")!=null){
       //str1 = /(<f([^](?!<f))*("graffiti"[^]*?m>)(?:[^]*?))([^]*?(?:ttack|tory))/;
        str1 = /(<f([^](?!<f))*("graffiti"[^]*?m>)(?:[^]*?)<\/form>(?:<br> ))/;
    }
    else if (body.match("name=\"broadcast\"")!=null){
       // str1 = /(<f([^](?!<f))*("broadcast"[^]*?m>)(?:[^]*)(?:(<br>)*))([^]*?(?:ttack|tory))/;
        str1 = /(<f([^](?!<f))*("broadcast"[^]*?m>)(?:[^]*?)<\/form>(?:<br> ))/;
    }
    */
    
    else {
        //str1 = /(<f([^](?!<f))*?("speech"|"graffiti"|"broadcast"[^]*?m>)[^]*?(?:<br> ))/;
        str1 = /(<f([^](?!<f))*?("speech"|"graffiti"|"broadcast"[^]*?m>)[^]*?)(?:(<p>)|(<br> ))/;
    }
    match = body.match(str1);
    
    if (match!=null) {
        match[1]=match[1].replace(/\n/g,'');
        //if (str1 != -1 && check != -1)
            //end = match[match.length-1];
        str2 = "";
        str2 = str2 + "<table><col width=\"75\"><col width=\"1000\">";
        str2 = str2 + "<tr><td> " + "Comm." + " </td>";
        str2 = str2 + "<td> " + match[1] + " </td></tr>";
        str2 = str2 + "</table>";
        body = body.replace(str1, str2+end);
        document.body.innerHTML = body;
    }
}

function formatAttack(){
    body = document.body.innerHTML;
    match = body.match(/<f([^](?!<f))*Attack([^](?!<f))*with([^](?!<f))*<\/form>/);
    if (match !=null){
        str1 = match[0];
        str2 = "";
        str2 = str2 + "<table><col width=\"75\"><col width=\"1000\">";
        str2 = str2 + "<tr><td> " + "Attack" + " </td>";
        str2 = str2 + "<td> " + match[0] + " </td></tr>";
        str2 = str2 + "</table>";
        body = body.replace(str1, str2);
        document.body.innerHTML = body;
    }   
}

function formatInventory(){

    //NEW METHOD TO LIFT INVENTORY FORMS FROM HTML
    body = document.body.innerHTML;
    document.body.innerHTML = document.body.innerHTML.replace("Invent","<p>Invent");
    match = body.match(/(?:click to use)(?:[^]+?)(<form[^]+<\/form>)(?:[^]+?)(?:encumbered)/);
    var inventhtml = match[1];
    str1 = /<form[^]+?<\/form>/g;
    match = inventhtml.match(str1);    
    
    //CONDENSE INVENTORY
    if (match != null) {
        mlen = match.length;
    
        var names = [];
        var qtys = [];
        
        for (var i=0; i<mlen; i++) {
            var regex1 = new RegExp(match[i]);
            var name = match[i].match(/(?:value=")([^"]+)/)[1];
            var qty = match[i].match(/(?:class="m">\()([^\)]+)/);
            if (qty != null) {
                qty = qty[1];
            }
            names.push(name);
            qtys.push(qty);
        }
        
        //iterate over each item, finding & deleting duplicates, and remembering relevant info
        
        var nums = [];
        var duplicateitemdetected = 0;
        for (var i=0; i<mlen; i++) {                //as many times as there are inventory items...
            var num = 1;                            //assume only 1 of these items in inventory (no duplicates)
            for (var j=i+1; j<mlen; j++) {          //now check all subsequent inventory items
                if (names[i]==names[j] && names[i]!="radio") {           //if another item has the same name as item i
                    duplicateitemdetected++;        //we found a duplicate! (just a flag, number is not important)
                    num++;                          //add 1 to the number of THIS item in inventory
                    
                    if (qtys[i]!=null) {            //if there is a quantity (like number of bullets in a pistol)
                        //if (qtys[i].length==1) {    //if there's currently only one quantity
                        if (num==2) {
                            var temp = qtys[i];
                            qtys[i] = [];    //reinitialize the variable to an array
                            qtys[i].push(temp);
                        }
                        qtys[i].push(qtys[j]);      //add the qty of the duplicate item to the qty array of the first item
                    }
                
                    names.splice(j,1);              //
                    qtys.splice(j,1);               //remove the duplicate item from the list!
                    match.splice(j,1);              //
                    
                    mlen--;                         //remember that the list is now shorter by 1 item
                    
                    j--;                            //since this index now contains a different item, check it again
                }
            }
            nums.push(num);                         //record how many of this item we found
        }
        
        //for each duplicate item, prepend the number to the html object
        
        if (duplicateitemdetected>0) {
            for (var i=0; i<mlen; i++) {
                if (nums[i]>1) {
                    //match[i] = nums[i] + "x " + match[i];
                    match[i] = match[i].replace("<input", nums[i] + "x " + "<input");
                    if (qtys[i]!=null) {
                        for (var j=1; j<qtys[i].length; j++) {
                            //this will work for non-radio items
                            match[i] = match[i].replace(")</form>", ", " + qtys[i][j] + ")</form>");
                            //this will work for radio items
                            match[i] = match[i].replace(")<input", ", " + qtys[i][j] + ")<input");
                            
                            match[i] = match[i].replace("("," ("); //add a space before the parentheses
                        }
                    }
                }
            }
        }
        
        //re-order items
        
        // /*
        var index = 0;
        //var list = ["fire axe", "first-aid kit", "pistol", "pistol clip", "shotgun", "shotgun shell"]; 
        var list = ["first-aid kit", "revivification syringe", "NecroTech syringe", "DNA extractor", "pistol", "pistol clip", "shotgun", "shotgun shell", "fire axe", "toolbox", "mobile phone", "GPS unit", "flak jacket", "newspaper", "spray can", "radio"]; 
        for (i=0; i<list.length; i++) {
            for (var j=0; j<mlen; j++) {
                if (names[j] == list[i]) {
                    var tempmatch = match.splice(j,1)[0];
                    match.splice(index,0,tempmatch);
                    var tempname = names.splice(j,1)[0];
                    names.splice(index,0,tempname);
                    index++;
                }   
            }
        }
        // */
        
        
        //selectively add a <br> to the end of each inventory object
        //do not add a breakbetween axe/fak, pistol/clip, shotgun/shell, etc
        
        for (var i=0; i<mlen-1; i++)
        {
            if (
                /*
                  (names[i]=="first-aid kit" && names[i+1]=="revivification syringe")
                ||(names[i]=="first-aid kit" && names[i+1]=="NecroTech syringe")
                ||(names[i]=="revivification syringe" && names[i+1]=="NecroTech syringe")
                ||*/(names[i]=="pistol" && names[i+1]=="pistol clip")
                ||(names[i]=="shotgun" && names[i+1]=="shotgun shell")
                
                ||(names[i]=="fire axe" && names[i+1]=="toolbox")
                ||(names[i]=="fire axe" && names[i+1]=="mobile phone")
                ||(names[i]=="fire axe" && names[i+1]=="GPS unit")
                ||(names[i]=="fire axe" && names[i+1]=="flak jacket")
                ||(names[i]=="fire axe" && names[i+1]=="newspaper")
                ||(names[i]=="fire axe" && names[i+1]=="spray can")
                
                ||(names[i]=="toolbox" && names[i+1]=="mobile phone")
                ||(names[i]=="toolbox" && names[i+1]=="GPS unit")
                ||(names[i]=="toolbox" && names[i+1]=="flak jacket")
                ||(names[i]=="toolbox" && names[i+1]=="newspaper")
                ||(names[i]=="toolbox" && names[i+1]=="spray can")
                
                ||(names[i]=="mobile phone" && names[i+1]=="GPS unit")
                ||(names[i]=="mobile phone" && names[i+1]=="flak jacket")
                ||(names[i]=="mobile phone" && names[i+1]=="newspaper")
                ||(names[i]=="mobile phone" && names[i+1]=="spray can")
                
                ||(names[i]=="GPS unit" && names[i+1]=="flak jacket")
                ||(names[i]=="GPS unit" && names[i+1]=="newspaper")
                ||(names[i]=="GPS unit" && names[i+1]=="spray can")
                
                ||(names[i]=="flak jacket" && names[i+1]=="newspaper")
                ||(names[i]=="flak jacket" && names[i+1]=="spray can")
                
                ||(names[i]=="newspaper" && names[i+1]=="spray can")
                
                ||(names[i]=="radio" && names[i+1]=="radio")
               )
            {
                match[i] = match[i];
            }
            else {
                match[i] = match[i] + "<br>";
            }
        }
        
        //write the html back into the file.
        var newhtml = '';
        for (var i=0; i<mlen; i++) {
            newhtml = newhtml + match[i];
            //newhtml = newhtml + match[i];
        }
        //newhtml =  "click to use):<\/p> " + newhtml + " <p>You are";
        
             
        var test1 = document.body.innerHTML.match(/(?:click to use)(?:[^]+?)(<form[^]+<\/form>)(?:[^]+?)(?:encumbered)/);
        document.body.innerHTML = document.body.innerHTML.replace(test1[1], newhtml);
    }
    
    document.body.innerHTML = document.body.innerHTML.replace(" (click to use):", ":");
}

function formatGPS(){
    var match = document.body.innerHTML.match(/&nbsp;(\[\d*,\d*\])/);
    if (match != null){
        document.body.innerHTML = document.body.innerHTML.replace(match[0],'');
        var loc = document.body.innerHTML.match(/"sb">(.+?)</)[1];
        var gps = match[0];
        document.body.innerHTML=document.body.innerHTML.replace(loc, loc + ' ' + gps);
    }
}