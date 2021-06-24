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
        $(".healthBar").css("width", data.health - 100 + "%");
        $(".armorBar").css("width", data.armor + "%");
        $(".thirstBar").css("width", data.thirst + "%");
        $(".hungerBar").css("width", data.hunger + "%");
        $(".bleedingBar").css("width", data.bleeding + "%");

        $('.time-text').html(data.time.hour + ':' + data.time.minute);
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