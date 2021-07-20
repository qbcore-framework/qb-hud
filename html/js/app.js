$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: ESC
            //Inventory.Close();
            break;
    }
});

var moneyTimeout = null;

(() => {
    QBHud = {};

    QBHud.Open = function(data) {
        $(".money-cash").css("display", "block");
        $(".money-bank").css("display", "block");
        $("#cash").html(data.cash);
        $("#bank").html(data.bank);
    };

    QBHud.Close = function() {

    };

    QBHud.Show = function(data) {
        if(data.type == "cash") {
            $(".money-cash").fadeIn(150);
            $("#cash").html(data.cash);
            setTimeout(function() {
                $(".money-cash").fadeOut(750);
            }, 3500)
        } else if(data.type == "bank") {
            $(".money-bank").fadeIn(150);
            $("#bank").html(data.bank);
            setTimeout(function() {
                $(".money-bank").fadeOut(750);
            }, 3500)
        }
    };

    QBHud.ToggleSeatbelt = function(data) {
        if (data.seatbelt) {
            $(".seatbelt-text").css("color", "#5feb46");
        } else {
            $(".seatbelt-text").css("color", "#c92222");
        }
    };

    QBHud.ToggleCruise = function(data) {
        if (data.cruise) {
            $(".cruise-text").css("color", "#5feb46");
        } else {
            $(".cruise-text").css("color", "#c92222");
        }
    };

    QBHud.CarHud = function(data) {
        if (data.show) {
            $(".ui-car-container").fadeIn();
        } else {
            $(".ui-car-container").fadeOut();
        }
    };

    QBHud.UpdateHud = function(data) {
        $(".ui-container").css("display", data.show ? "none" : "block");

        if (data.health == 100) {
            $(".health").css("display", "none");
        } else {
            $(".health").css("display", "block");
            $(".health").find(".progressBar")
            .attr("style", "width: " + data.health + "%");
            SetProgressBar(data.health, '.progress-health')
        }

        if (data.armor > 0) {
            $(".armor").css("display", "block");
            $(".armor").find(".progressBar")
            .attr("style", "width: " + data.armor + "%");
            SetProgressBar(data.armor, '.progress-armor')
        } else {
            $(".armor").css("display", "none");
        }

        if (data.hunger == 100) {
            $(".hunger").css("display", "none");
        } else {
            $(".hunger").css("display", "block");
            $(".hunger").find(".progressBar")
            .attr("style", "width: " + data.hunger + "%");
            SetProgressBar(data.hunger, '.progress-hunger')
        }

        if (data.thirst == 100) {
            $(".thirst").css("display", "none");
        } else {
            $(".thirst").css("display", "block");
            $(".thirst").find(".progressBar")
            .attr("style", "width: " + data.thirst + "%");
            SetProgressBar(data.thirst, '.progress-thirst')
        }

        if (data.stress > 0) {
            $(".stress").css("display", "block");
            $(".stress").find(".progressBar")
            .attr("style", "width: " + data.stress + "%");
            SetProgressBar(data.stress, '.progress-stress')
        } else {
            $(".stress").css("display", "none");
        }

        $(".voice")
            switch(data.voice) {
                case 1.0:
                data.voice = 33;
                break;
                case 2.3:
                data.voice = 66;
                break;
                case 5.0:
                data.voice = 100;
                break;
            }
            $(".voice").find(".progressBar")
            .attr("style", "width: " + data.voice + "%");
            SetProgressBar(data.voice, '.progress-voice')

        if (data.talking == 1) {
            $("#voice-icon").css("color", "#39FF14");
        } else {
            $("#voice-icon").css("color", "white");
        }

        if (data.nos != null ) {
            $(".nos-text").css('display', 'block');
            $(".nos-label").css('display', 'block');
            $(".nos-text").html(data.nos);
        } else {
            $(".nos-text").css('display', 'none');
            $(".nos-label").css('display', 'none');
        }

        $(".fuel-text").html((data.fuel).toFixed(0));
        $(".speed-text").html(data.speed);

        if (data.street2 != "" && data.street2 != undefined) {
            $(".ui-car-street").html(data.direction + ' | ' + data.street1 + ' | ' + data.street2);
        } else {
            $(".ui-car-street").html(data.direction + ' | ' + data.street1);
        }
    };

    QBHud.Update = function(data) {
        if(data.type == "cash") {
            $(".money-cash").css("display", "block");
            $("#cash").html(data.cash);
            if (data.minus) {
                $(".money-cash").append('<p class="moneyupdate minus">-<span id="cash-symbol">&dollar;&nbsp;</span><span><span id="minus-changeamount">' + data.amount + '</span></span></p>')
                $(".minus").css("display", "block");
                setTimeout(function() {
                    $(".minus").fadeOut(750, function() {
                        $(".minus").remove();
                        $(".money-cash").fadeOut(750);
                    });
                }, 3500)
            } else {
                $(".money-cash").append('<p class="moneyupdate plus">+<span id="cash-symbol">&dollar;&nbsp;</span><span><span id="plus-changeamount">' + data.amount + '</span></span></p>')
                $(".plus").css("display", "block");
                setTimeout(function() {
                    $(".plus").fadeOut(750, function() {
                        $(".plus").remove();
                        $(".money-cash").fadeOut(750);
                    });
                }, 3500)
            }
        }
            $(".money-bank").css("display", "block");
            $("#bank").html(data.bank);
            if (data.minus) {
                $(".money-bank").append('<p class="minus">-<span id="minus-symbol">&dollar;</span><span><span id="minus-changeamount">' + data.amount + '</span></span></p>')
                $(".minus").css("display", "block");
                setTimeout(function() {
                    $(".minus").fadeOut(750, function() {
                        $(".minus").remove();
                        $(".money-bank").fadeOut(750);
                    });
                }, 3500)
            } else {
                $(".money-bank").append('<p class="plus">+<span id="plus-symbol">&dollar;</span><span><span id="plus-changeamount">' + data.amount + '</span></span></p>')
                $(".plus").css("display", "block");
                setTimeout(function() {
                    $(".plus").fadeOut(750, function() {
                        $(".plus").remove();
                        $(".money-bank").fadeOut(750);
                    });
                }, 3500)
            }
    };

    window.onload = function(e) {
        window.addEventListener('message', function(event) {
            switch(event.data.action) {
                case "open":
                    QBHud.Open(event.data);
                    break;
                case "close":
                    QBHud.Close();
                    break;
                case "update":
                    QBHud.Update(event.data);
                    break;
                case "show":
                    QBHud.Show(event.data);
                    break;
                case "hudtick":
                    QBHud.UpdateHud(event.data);
                    break;
                case "car":
                    QBHud.CarHud(event.data);
                    break;
                case "seatbelt":
                    QBHud.ToggleSeatbelt(event.data);
                    break;
                case "cruise":
                    QBHud.ToggleCruise(event.data);
                    break;
            }
        })
    }

})();

function SetProgressBar(value, element){
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find('span');
    var percent = value*100/100;
  
    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;
  
    const offset = circumference - ((-percent*99)/100) / 100 * circumference;
    circle.style.strokeDashoffset = -offset;
  
    var speed = Math.floor(value * 1.8)
    if (speed == 81 || speed == 131) {
        speed = speed - 1
    }
  
    html.text(speed);
}