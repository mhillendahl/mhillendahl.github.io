<!DOCTYPE html>

<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <style>
    
        canvas{
            padding: 0;
            margin: auto;
            margin-top: 50px;
            display: block;
            border: 1px solid #d3d3d3;
            background-color: #f1f1f1;
        }
        
        h1, p, wrapper { text-align:center; }
        
        button{
            margin: auto;
            margin-top: 10px;
            display: block;
        }
        
    </style>
    
</head>

<body onload="initGame()">
    
    <div class="wrapper">
        <button class="button" onclick="startGame()">start</button>
    </div>

    <h1>dvorak.io</h1>
    
    <p>
        <img src="./dvorak/dvorak.png" alt="dvorak keyboard layout">
        <br>
        The image above depicts the DVORAK keyboard layout, for your reference.
    </p>
    
    <script>

        function initGame(){
            myGame.init();
        }
        
        function startGame(){
            myGame.start();
        }
        
        var myGame = {
            canvas: document.createElement("canvas"),
            init: function() {
                this.canvas.width = 900;
                this.canvas.height = 600;
                this.context = this.canvas.getContext("2d");
                document.body.insertBefore(this.canvas, document.body.childNodes[0]);            
            },
            start: function() {
                //this.canvas.width = 850;
            }
        }
        
    </script>

</body>

</html>